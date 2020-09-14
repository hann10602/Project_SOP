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
import com.laptrinhjavaweb.Service.IBookService;
import com.laptrinhjavaweb.Service.ICategoryService;
import com.laptrinhjavaweb.Service.ICommentService;
import com.laptrinhjavaweb.Utils.FormUtils;
import com.laptrinhjavaweb.model.BookModel;
import com.laptrinhjavaweb.model.CommentModel;
import com.laptrinhjavaweb.model.categoryModel;

@WebServlet(urlPatterns = {"/views-book"})
public class BooksController extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = -4471949249621247162L;
	
	@Inject
	private IBookService BookServiceImpl;
	
	@Inject
	private ICategoryService iCategoryServie;
	
	@Inject
	private ICommentService iCommentService;
	
	@SuppressWarnings("unchecked")
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path="";
		BookModel bookModel = FormUtils.toModel(BookModel.class, request);
		String action = request.getParameter("action");
		if(action != null) {
			if(action.equalsIgnoreCase("viewdetail")) {
				path = "/views/web/viewdetail.jsp";
				if(null != bookModel.getID()) {
					List<CommentModel> listComment = iCommentService.findByBookID(bookModel.getID());
					bookModel = BookServiceImpl.findOne(bookModel.getID());
					request.setAttribute(SystemConstants.LIST_COMMENT, listComment);
					request.setAttribute(SystemConstants.LIST_BOOK, bookModel);
				}
			}else if(action.equalsIgnoreCase("search")) {
				String key = request.getParameter("key");
				path = "/views/web/homesearch.jsp";
				if(key != null) {
					bookModel.setListResult(BookServiceImpl.findByKey(key));
				}
				request.setAttribute(SystemConstants.LIST_BOOK, bookModel.getListResult());
			}else if(action.equalsIgnoreCase("findByCategory")) {
				int categoryID = Integer.parseInt(request.getParameter("categoryID"));
				path = "/views/web/homesearch.jsp";
				bookModel.setListResult(BookServiceImpl.findByCategoryID(categoryID));
				request.setAttribute(SystemConstants.LIST_BOOK, bookModel.getListResult());
			}
			List<categoryModel> listCategory = iCategoryServie.findALL();
			request.setAttribute(SystemConstants.LIST_CATEGORY, listCategory);
			RequestDispatcher dispatcher = request.getRequestDispatcher(path);
			dispatcher.forward(request, response);
		}else {
			response.sendRedirect(request.getContextPath()+"/trang-chu");
		}
		
	}
}
