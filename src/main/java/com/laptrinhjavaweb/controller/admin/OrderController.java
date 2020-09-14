package com.laptrinhjavaweb.controller.admin;

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
import com.laptrinhjavaweb.Service.IBookService;
import com.laptrinhjavaweb.Service.ICategoryService;
import com.laptrinhjavaweb.Service.IOrderService;
import com.laptrinhjavaweb.Utils.FormUtils;
import com.laptrinhjavaweb.model.BookModel;
import com.laptrinhjavaweb.model.OrderModel;
import com.laptrinhjavaweb.model.categoryModel;

@WebServlet(urlPatterns = {"/admin-order","/admin-sales"})
public class OrderController extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -8081767920201808103L;
	
	@Inject
	private IOrderService iOrderService;
	
	@Inject
	private ICategoryService iCategoryService;
	
	@SuppressWarnings("unchecked")
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		OrderModel model = FormUtils.toModel(OrderModel.class, request);
		String path = "/views/admin/Order/listOrder.jsp";
		if(model.getType() != null) {
			if(model.getType().equalsIgnoreCase("XemDoanhThu")) {
				model.setListResult(iOrderService.findByStatus("Đã Thanh Toán"));
				Double totalSales = 0.0;
				for (OrderModel od : model.getListResult()) {
					totalSales += od.getTotalCash();
				}
				request.setAttribute(SystemConstants.TOTAL_SALES, totalSales);
				path = "/views/admin/Order/sales.jsp";
			}
		}else {
			path = "/views/admin/Order/listOrder.jsp";
			List<OrderModel> listOrder = iOrderService.findAllOrderByCreateDate();
			model.setListResult(listOrder);
		}
		request.setAttribute(SystemConstants.LIST_ORDER, model.getListResult());
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	}
}