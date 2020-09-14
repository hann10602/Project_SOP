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
import com.laptrinhjavaweb.Service.ICommentService;
import com.laptrinhjavaweb.Utils.HttpUtils;
import com.laptrinhjavaweb.Utils.SessionUtils;
import com.laptrinhjavaweb.model.CommentModel;
import com.laptrinhjavaweb.model.UserModel;

@WebServlet(urlPatterns = {"/api-comment"})
public class CommentAPI extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = -4286813690881194270L;
	
	@Inject
	private ICommentService iCommentService;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
	
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		ObjectMapper om = new ObjectMapper();
		CommentModel commentModel = HttpUtils.getIntance().convertJsontoString(request.getReader()).toModel(CommentModel.class);
		UserModel userModel =(UserModel) SessionUtils.getIntance().getValue(request, SystemConstants.USER_MODEL);
		commentModel.setUserID(userModel.getID());
		commentModel.setName(userModel.getFullName());
		if(!commentModel.getCommentContent().trim().isEmpty()) {
			commentModel = iCommentService.save(commentModel);
		}else {
			throw new IOException();
		}
		om.writeValue(response.getOutputStream(), commentModel);
	}
	
	@Override
	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		ObjectMapper om = new ObjectMapper();
		CommentModel commentModel = HttpUtils.getIntance().convertJsontoString(request.getReader()).toModel(CommentModel.class);
		UserModel userModel = (UserModel) SessionUtils.getIntance().getValue(request, SystemConstants.USER_MODEL);
		commentModel.setUserID(userModel.getID());
		commentModel.setName(userModel.getFullName());
		if(!commentModel.getCommentContent().trim().isEmpty()) {
			commentModel = iCommentService.save(commentModel);
		}else {
			throw new IOException();
		}
		om.writeValue(response.getOutputStream(), commentModel);
	}
	
	@Override
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		ObjectMapper om = new ObjectMapper();
		CommentModel commentModel = HttpUtils.getIntance().convertJsontoString(request.getReader()).toModel(CommentModel.class);
		Integer[] idDelete = iCommentService.delete(commentModel);
		om.writeValue(response.getOutputStream(), idDelete);
	}
}
