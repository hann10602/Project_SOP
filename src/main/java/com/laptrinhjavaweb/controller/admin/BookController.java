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
import com.laptrinhjavaweb.Utils.FormUtils;
import com.laptrinhjavaweb.model.BookModel;
import com.laptrinhjavaweb.model.categoryModel;

@WebServlet(urlPatterns = {"/admin-book"})
public class BookController extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -8081767920201808103L;
	
	@Inject
	private IBookService iBookService;
	
	@Inject
	private ICategoryService iCategoryService;
	
	@SuppressWarnings("unchecked")
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BookModel model = FormUtils.toModel(BookModel.class, request);
		String path = "/views/admin/book/listbook.jsp";
		if(model.getType() != null) {
			if(model.getType().equalsIgnoreCase("editBook")) {
				path = "/views/admin/book/editBook.jsp";
				List<categoryModel> listcaCategoryModels = iCategoryService.findALL();
				request.setAttribute(SystemConstants.ADMIN_LIST_CATEGORY, listcaCategoryModels);
				if(model.getID() != null) {
					model = iBookService.findOne(model.getID());	
				}else {
					
				}
				
			}
		}else {
			path = "/views/admin/book/listbook.jsp";
			model.setListResult(iBookService.findAll());
		}
		request.setAttribute(SystemConstants.ADMIN_BOOK, model);
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	}
}
