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
import com.laptrinhjavaweb.Service.IReportCommentService;
import com.laptrinhjavaweb.Utils.FormUtils;
import com.laptrinhjavaweb.model.ReportCommentModel;

@WebServlet(urlPatterns = {"/admin-reportcomment"})
public class ReportCommentController extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1628608199874006855L;
	
	@Inject
	private IReportCommentService iReportCommentService;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ReportCommentModel model = FormUtils.toModel(ReportCommentModel.class, request);
		String path = "/views/admin/reportComment/reportComment.jsp";
		String action = request.getParameter("action");
		if(action != null) {
			
		}else {
			path = "/views/admin/reportComment/reportComment.jsp";
			model.setListResult(iReportCommentService.findAll());
			request.setAttribute(SystemConstants.ADMIN_LIST_REPORTCOMMENT, model.getListResult());
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	}
}
