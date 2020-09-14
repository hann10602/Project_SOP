package com.laptrinhjavaweb.controller.admin.API.BookAPI;

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
import com.laptrinhjavaweb.Utils.FormUtils;
import com.laptrinhjavaweb.Utils.HttpUtils;
import com.laptrinhjavaweb.Utils.SessionUtils;
import com.laptrinhjavaweb.model.BookModel;
import com.laptrinhjavaweb.model.UserModel;

@WebServlet(urlPatterns = {"/api-book"})
public class BookAPI extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 3410510149575747667L;
	
	@Inject
	private IBookService iBookService;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		
		BookModel model = FormUtils.toModel(BookModel.class, request);
		model = iBookService.findOne(model.getID());
		mapper.writeValue(response.getOutputStream(), model);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		
		BookModel model = HttpUtils.getIntance().convertJsontoString(request.getReader()).toModel(BookModel.class);
		try {
			String fullName =((UserModel) SessionUtils.getIntance().getValue(request, SystemConstants.USER_MODEL)).getFullName() ;
			model.setCreateBy(fullName);	
		} catch (NullPointerException e) {
			System.out.println("--------"+e.getMessage());
		}
		model = iBookService.save(model);
		mapper.writeValue(response.getOutputStream(), model);
	}
	
	@Override
	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		
		BookModel model = HttpUtils.getIntance().convertJsontoString(request.getReader()).toModel(BookModel.class);
		try {
			String fullName = ((UserModel) SessionUtils.getIntance().getValue(request, SystemConstants.USER_MODEL)).getFullName();
			model.setModifiedBy(fullName);	
		} catch (NullPointerException e) {
			System.out.println("-------"+e.getMessage());
		}
		model = iBookService.save(model);
		mapper.writeValue(response.getOutputStream(), model);
	}
	
	@Override
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		
		BookModel model = HttpUtils.getIntance().convertJsontoString(request.getReader()).toModel(BookModel.class);
		iBookService.delete(model);
		mapper.writeValue(response.getOutputStream(), model.getIds());
	}
}
