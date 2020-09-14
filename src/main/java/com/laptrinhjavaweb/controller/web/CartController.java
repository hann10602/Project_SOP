package com.laptrinhjavaweb.controller.web;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.laptrinhjavaweb.Constants.SystemConstants;
import com.laptrinhjavaweb.Utils.SessionUtils;
import com.laptrinhjavaweb.model.CartModel;

@WebServlet(urlPatterns = "/view-cart")
public class CartController extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 8794684929543256471L;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CartModel cartModel = (CartModel) SessionUtils.getIntance().getValue(request, SystemConstants.MY_CART);
		if(cartModel != null) {
			cartModel.totalCash();
			String path = "/views/web/cart/cartdetail.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(path);
			dispatcher.forward(request, response);
		}else {
			response.sendRedirect(request.getContextPath()+"/trang-chu");
		}
	}
	

}
