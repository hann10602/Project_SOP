package com.laptrinhjavaweb.controller.web;

import java.io.IOException;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.laptrinhjavaweb.Constants.SystemConstants;
import com.laptrinhjavaweb.Service.IOrderService;
import com.laptrinhjavaweb.Utils.FormUtils;
import com.laptrinhjavaweb.Utils.SessionUtils;
import com.laptrinhjavaweb.model.OrderModel;
import com.laptrinhjavaweb.model.UserModel;

@WebServlet(urlPatterns = {"/Xem-DanhSachDonHang"})
public class OrdersController extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = -4935317353572742091L;
	
	@Inject
	private IOrderService iOrderService;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		OrderModel model = FormUtils.toModel(OrderModel.class, request);
		String path = "/views/web/Order/listOrder.jsp";
		if(model.getType() != null) {
			
		}else {
			path = "/views/web/Order/listOrder.jsp";
			UserModel user = (UserModel) SessionUtils.getIntance().getValue(request, SystemConstants.USER_MODEL);
			List<OrderModel> listOrder = iOrderService.findByUserID(user.getID());
			model.setListResult(listOrder);
		}
		request.setAttribute(SystemConstants.LIST_ORDER, model.getListResult());
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	}

}
