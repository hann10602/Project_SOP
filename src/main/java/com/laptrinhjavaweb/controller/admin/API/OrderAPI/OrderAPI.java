package com.laptrinhjavaweb.controller.admin.API.OrderAPI;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.laptrinhjavaweb.Constants.SystemConstants;
import com.laptrinhjavaweb.Service.IOrderService;
import com.laptrinhjavaweb.Utils.HttpUtils;
import com.laptrinhjavaweb.Utils.SessionUtils;
import com.laptrinhjavaweb.model.OrderModel;
import com.laptrinhjavaweb.model.UserModel;

@WebServlet(urlPatterns = {"/api-order"})
public class OrderAPI extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -4557099880632637273L;
	
	
	@Inject
	private IOrderService iOrderService;
	
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ObjectMapper om = new ObjectMapper();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		
		OrderModel orderModel = HttpUtils.getIntance().convertJsontoString(request.getReader()).toModel(OrderModel.class);
		UserModel user = (UserModel) SessionUtils.getIntance().getValue(request, SystemConstants.USER_MODEL);
//		if(user == null) {
//			throw new IOException();
//		}else {
			orderModel.setUserId(user.getID());
			orderModel.setUser(user);
			orderModel.setStatus("Đang Đợi Thanh Toán.");
			orderModel = iOrderService.add(orderModel);
		//}
		om.writeValue(response.getOutputStream(), orderModel);
	}
	
	@Override
	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ObjectMapper om = new ObjectMapper();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		
		int id = Integer.parseInt(request.getParameter("ID"));
		OrderModel orderModel = iOrderService.findOne(id);
		orderModel.setStatus("Đã Thanh Toán.");
		orderModel = iOrderService.update(orderModel);
		
		om.writeValue(response.getOutputStream(), orderModel);
	}
	
	@Override
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ObjectMapper om = new ObjectMapper();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("aplication/json");
		OrderModel model = HttpUtils.getIntance().convertJsontoString(request.getReader()).toModel(OrderModel.class);
		iOrderService.delete(model);
		om.writeValue(response.getOutputStream(), model);
	}
}
