package com.laptrinhjavaweb.controller.web.API;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.laptrinhjavaweb.Constants.SystemConstants;
import com.laptrinhjavaweb.Service.IBookService;
import com.laptrinhjavaweb.Utils.HttpUtils;
import com.laptrinhjavaweb.Utils.SessionUtils;
import com.laptrinhjavaweb.model.BookModel;
import com.laptrinhjavaweb.model.CartModel;

@WebServlet(urlPatterns = {"/api-cart"})
public class CartAPI extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 5155259734567542026L;
	
	@Inject
	private IBookService bookServiceImpl;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ObjectMapper om = new ObjectMapper();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		om.writeValue(response.getOutputStream(), SessionUtils.getIntance().getValue(request, SystemConstants.MY_CART));
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ObjectMapper om = new ObjectMapper();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		BookModel bookmodel = HttpUtils.getIntance().convertJsontoString(request.getReader()).toModel(BookModel.class);
		if(bookmodel != null) {
			Integer soLuong = bookmodel.getAmount();
			if(bookmodel.getAmount() == null) {
				soLuong = 1;
			}
			bookmodel = bookServiceImpl.findOne(bookmodel.getID());
			bookmodel.setAmount(soLuong);
			CartModel cartModel = (CartModel) SessionUtils.getIntance().getValue(request, SystemConstants.MY_CART);
			if(cartModel == null) {
				cartModel = new CartModel();
			}
			cartModel.getListBooks().add(bookmodel);
			SessionUtils.getIntance().putValue(request, SystemConstants.MY_CART, cartModel);
		}
		om.writeValue(response.getOutputStream(),SessionUtils.getIntance().getValue(request, SystemConstants.MY_CART));
	}
	
	@Override
	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ObjectMapper om = new ObjectMapper();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		CartModel cartModel = (CartModel) SessionUtils.getIntance().getValue(request, SystemConstants.MY_CART);
		if(cartModel != null) {
			try {
			int sttUpdate = Integer.parseInt(request.getParameter("sttUpdate"));
			int amountUpdate = Integer.parseInt(request.getParameter("amountUpdate"));
			if(sttUpdate >= 0 && amountUpdate > 0) {
				cartModel.getListBooks().get(sttUpdate).setAmount(amountUpdate);
				SessionUtils.getIntance().putValue(request, SystemConstants.MY_CART, cartModel);
			}			
			om.writeValue(response.getOutputStream(), SessionUtils.getIntance().getValue(request, SystemConstants.MY_CART));
			}catch (Exception e) {
				e.printStackTrace();
				om.writeValue(response.getOutputStream(), "{}");
			}
		}else {
			om.writeValue(response.getOutputStream(), "{}");
		}
	}
	
	/* @SuppressWarnings("unlikely-arg-type") */
	@Override
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		ObjectMapper om = new ObjectMapper();
		try {
			int sttDelete = Integer.parseInt(request.getParameter("sttDelete"));
			CartModel cartModel = (CartModel) SessionUtils.getIntance().getValue(request, SystemConstants.MY_CART);
			if(cartModel != null) {
				cartModel.getListBooks().remove(sttDelete);
			}
			SessionUtils.getIntance().putValue(request, SystemConstants.MY_CART, cartModel);
			om.writeValue(response.getOutputStream(),SessionUtils.getIntance().getValue(request, SystemConstants.MY_CART));
		} catch (Exception e) {
			e.printStackTrace();
			om.writeValue(response.getOutputStream(),"{}");
		}		
		
	}
}
