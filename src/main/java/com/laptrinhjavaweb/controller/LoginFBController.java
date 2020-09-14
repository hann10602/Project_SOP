package com.laptrinhjavaweb.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.laptrinhjavaweb.Constants.SystemConstants;
import com.laptrinhjavaweb.Utils.RestFBUtils;
import com.laptrinhjavaweb.Utils.SessionUtils;
import com.laptrinhjavaweb.model.UserModel;
import com.restfb.types.User;

@WebServlet(urlPatterns = {"/dang-nhap-fb"})
public class LoginFBController extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 754950024518138672L;
	
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String path = "";
		String code = request.getParameter("code");
		 if(code == null || code.isEmpty()) {
			 path = "/views/login.jsp";
		 }else {
			 path = "/views/web/login.jsp";
			 String accessToken = RestFBUtils.getToken(code);
			 User userFB = RestFBUtils.getUserInfo(accessToken);
			 System.out.println("Thoong tin USERFB : \n");
			 System.out.println(userFB.getId());
			 System.out.println(userFB.getName());
			 request.setAttribute("idfb", userFB.getId());
			 request.setAttribute("namefb", userFB.getName());
			 UserModel userModel = new UserModel();
			 userModel.setFullName(userFB.getName());
			 userModel.setFacebookID(Long.parseLong(userFB.getId()));
			 
			 SessionUtils.getIntance().putValue(request, SystemConstants.USER_MODEL,userModel);
		 }
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	}
	
}
