package com.laptrinhjavaweb.controller.web;

import java.io.IOException;
import java.util.List;
import java.util.ResourceBundle;

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
import com.laptrinhjavaweb.Service.IUserService;
import com.laptrinhjavaweb.Utils.FormUtils;
import com.laptrinhjavaweb.Utils.SessionUtils;
import com.laptrinhjavaweb.model.BookModel;
import com.laptrinhjavaweb.model.CartModel;
import com.laptrinhjavaweb.model.UserModel;

@WebServlet(urlPatterns = {"/trang-chu","/dang-nhap","/dang-xuat","/dang-ky"})
public class homeController extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = -8127710757286014085L;
	
	@Inject
	private IUserService UserServiceImpl;
	
	@Inject
	private IBookService BookServiceImpl;
	
	@Inject
	private ICategoryService iCategoryService;
	
	ResourceBundle messageBundle = ResourceBundle.getBundle("messageResource");
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		String path = "";
		if(action != null) {
			String message = request.getParameter("message");
			String alertStatus = request.getParameter("alertstatus");
			if(message != null && alertStatus != null) {
				request.setAttribute("message",messageBundle.getString(message));
				request.setAttribute("alertstatus", alertStatus);
			}
			
			if(action.equalsIgnoreCase("login")) {
				path = "/views/login.jsp";
			}else if(action.equalsIgnoreCase("logout")) {
				SessionUtils.getIntance().deleteValue(request, SystemConstants.USER_MODEL);
				path = "/views/login.jsp";
			}else if(action.equalsIgnoreCase("registry")) {
				path = "/views/registry.jsp";
			}
		}else {
			path = "/views/web/home.jsp";
			List<BookModel> listBook = BookServiceImpl.findAll();
			request.setAttribute(SystemConstants.LIST_BOOK, listBook);
			request.setAttribute(SystemConstants.LIST_CATEGORY, iCategoryService.findALL());
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		if(action != null) {
			if(action.equalsIgnoreCase("login")) {
				UserModel userModel = FormUtils.toModel(UserModel.class, request);
				userModel = UserServiceImpl.findOneByUserNameAndPassWord(userModel);
				if(userModel != null) {
					
					SessionUtils.getIntance().putValue(request, SystemConstants.USER_MODEL, userModel);
					
					//thêm giỏ hàng vào trong Sesion
					CartModel cartModel = (CartModel) SessionUtils.getIntance().getValue(request, SystemConstants.MY_CART);     // kiểm tra xem đã từng tạo giỏ hàng trước khi đăng nhâp chưa 
					cartModel = new CartModel();																				// (nếu chưa thì khởi tạo giỏ hàng mới)
					if(cartModel != null) {																						 
					}
					cartModel.setUser(userModel);
					SessionUtils.getIntance().putValue(request, SystemConstants.MY_CART, cartModel);
					
					if(userModel.getRole().getCode().equalsIgnoreCase(SystemConstants.ADMIN_ROLE)) {
						response.sendRedirect(request.getContextPath()+"/admin-home");
					}else if(userModel.getRole().getCode().equalsIgnoreCase(SystemConstants.USER_ROLE)) {
						response.sendRedirect(request.getContextPath()+"/trang-chu");
					}
				}else {
					response.sendRedirect(request.getContextPath()+"/dang-nhap?action=login&message=login_false&alertstatus=danger");
				}
			}else if(action.equalsIgnoreCase("logout")) {
				response.sendRedirect(request.getContextPath()+"/dang-xuat?action=logout&message=logout_success&alertstatus=success");
			}
		}else {
			
		}
	}
}
