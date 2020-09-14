package com.laptrinhjavaweb.controller.admin.API.UserAPI;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.laptrinhjavaweb.Constants.SystemConstants;
import com.laptrinhjavaweb.Service.IUserService;
import com.laptrinhjavaweb.Utils.FormUtils;
import com.laptrinhjavaweb.Utils.HttpUtils;
import com.laptrinhjavaweb.Utils.SessionUtils;
import com.laptrinhjavaweb.model.UserModel;

@WebServlet(urlPatterns = {"/api-user"})
public class UserAPI extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = -7418826850904431609L;
	
	@Inject
	private IUserService iUserService;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		
		UserModel model = FormUtils.toModel(UserModel.class, request);
		model = iUserService.findOne(model.getID());
		mapper.writeValue(response.getOutputStream(), model);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		request.setCharacterEncoding("UtF-8");
		response.setContentType("application/json");
		
		UserModel model = HttpUtils.getIntance().convertJsontoString(request.getReader()).toModel(UserModel.class);
		try {
			model.setFacebookID(0L);
			String fullName = ((UserModel) SessionUtils.getIntance().getValue(request, SystemConstants.USER_MODEL)).getFullName();
			model.setCreateBy(fullName);
		} catch (NullPointerException e) {
			model.setCreateBy("ADMIN");
			System.out.println("-------"+e.getMessage());
		}
		model = iUserService.save(model);
		/*
		 * if(model == null) { throw new IOException(); }
		 */
		mapper.writeValue(response.getOutputStream(), model);
	}
	
	@Override
	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		
		UserModel model = HttpUtils.getIntance().convertJsontoString(request.getReader()).toModel(UserModel.class);
		try {
			model.setFacebookID(0L);
			String fullName = ((UserModel) SessionUtils.getIntance().getValue(request, SystemConstants.USER_MODEL)).getFullName();
			model.setModifiedBy(fullName);
		} catch (NullPointerException e) {
			model.setModifiedBy("ADMIN");
			System.out.println("--------"+e.getMessage());
		}
		model = iUserService.save(model);
		/*
		 * if(model == null) { throw new IOException(); }
		 */
		mapper.writeValue(response.getOutputStream(), model);
	}
	
	@Override
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		
		UserModel model = HttpUtils.getIntance().convertJsontoString(request.getReader()).toModel(UserModel.class);
		iUserService.delete(model);
		mapper.writeValue(response.getOutputStream(), model.getIds());
	}
}
