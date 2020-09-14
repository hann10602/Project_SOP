package com.laptrinhjavaweb.controller.admin.API.ReportAPI;

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
import com.laptrinhjavaweb.Service.ICommentService;
import com.laptrinhjavaweb.Service.IReportCommentService;
import com.laptrinhjavaweb.Utils.HttpUtils;
import com.laptrinhjavaweb.Utils.SessionUtils;
import com.laptrinhjavaweb.model.ReportCommentModel;
import com.laptrinhjavaweb.model.UserModel;

@WebServlet(urlPatterns = {"/api-reportcomment"})
public class ReportCommentAPI extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = -1940856927224369039L;

	
	@Inject
	private ICommentService iCommentService;
	
	@Inject
	private IBookService iBookService;
	
	@Inject
	private IReportCommentService iReportCommentServie;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ObjectMapper om = new ObjectMapper();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ObjectMapper om = new ObjectMapper();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		ReportCommentModel reportComment = HttpUtils.getIntance().convertJsontoString(request.getReader()).toModel(ReportCommentModel.class);
		UserModel users = (UserModel) SessionUtils.getIntance().getValue(request, SystemConstants.USER_MODEL);
		if(users != null) {
			reportComment.setUsersID(users.getID());
			reportComment.setUsers(users);
			reportComment.setComment(iCommentService.findOne(reportComment.getCommentID()));
			reportComment.setBooks(iBookService.findOne(reportComment.getBookID()));
			reportComment = iReportCommentServie.save(reportComment);
		}else {
			throw new IOException();
		}
		om.writeValue(response.getOutputStream(), reportComment);
	}
	
	@Override
	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ObjectMapper om = new ObjectMapper();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		ReportCommentModel reportComment = HttpUtils.getIntance().convertJsontoString(request.getReader()).toModel(ReportCommentModel.class);
		UserModel users = (UserModel) SessionUtils.getIntance().getValue(request, SystemConstants.USER_MODEL);
		if(users != null) {
			reportComment.setUsersID(users.getID());
			reportComment.setUsers(users);
			iCommentService.findOne(reportComment.getCommentID());
			reportComment = iReportCommentServie.save(reportComment);
		}else {
			throw new IOException();
		}
		om.writeValue(response.getOutputStream(), reportComment);
	}
	
	@Override
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ObjectMapper om = new ObjectMapper();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		ReportCommentModel reportComment = HttpUtils.getIntance().convertJsontoString(request.getReader()).toModel(ReportCommentModel.class);
		Integer[] resultDelete = iReportCommentServie.delete(reportComment);
		om.writeValue(response.getOutputStream(), resultDelete);
	}
}
