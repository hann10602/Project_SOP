package com.laptrinhjavaweb.controller.admin;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.laptrinhjavaweb.Constants.SystemConstants;
import com.laptrinhjavaweb.Service.IRoleService;
import com.laptrinhjavaweb.Service.IUserService;
import com.laptrinhjavaweb.Utils.FormUtils;
import com.laptrinhjavaweb.model.UserModel;

@WebServlet(urlPatterns = {"/admin-user"})
public class UserController extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 2627812500482784082L;
	
	@Inject
	private IUserService iUserService;
	
	@Inject
	private IRoleService iRoleService;
	
	@SuppressWarnings("unchecked")
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserModel model = FormUtils.toModel(UserModel.class, request);
		String path = "/views/admin/user/listUser.jsp";
		if(model.getType() != null) {
			if(model.getType().equalsIgnoreCase("editUser")) {
				path = "/views/admin/user/editUser.jsp";
				if(model.getID() != null) {
					model = iUserService.findOne(model.getID());
					request.setAttribute(SystemConstants.ADMIN_USER, model);
				}else {
					
				}
					request.setAttribute(SystemConstants.ADMIN_LIST_ROLE, iRoleService.findAll());
			}else {
				
			}
		}else {
			path = "/views/admin/user/listUser.jsp";
			model.setListResult(iUserService.findAll());
		}
		request.setAttribute(SystemConstants.ADMIN_USER, model);
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	}

}
