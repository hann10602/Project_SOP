package com.laptrinhjavaweb.Filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.laptrinhjavaweb.Constants.SystemConstants;
import com.laptrinhjavaweb.Utils.SessionUtils;
import com.laptrinhjavaweb.model.UserModel;

public class authorizationFilter implements Filter{

	ServletContext context;
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		this.context = filterConfig.getServletContext();
	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) res;
		String path = request.getRequestURI();
		String path1= request.getServletPath();
		if(path1.startsWith("/admin")) {
			UserModel userModel = (UserModel) SessionUtils.getIntance().getValue(request, SystemConstants.USER_MODEL);
			if(userModel != null) {
				if(userModel.getRole().getCode().equalsIgnoreCase(SystemConstants.ADMIN_ROLE)) {
					chain.doFilter(req, res);
				}else {
					response.sendRedirect(request.getContextPath()+"/dang-nhap?action=login&message=not_permission&alertstatus=danger");
				}
			}else {
				response.sendRedirect(request.getContextPath()+"/dang-nhap?action=login&message=not_login&alertstatus=danger");
			}
		}else {
			chain.doFilter(req, res);
		}
	}

	@Override
	public void destroy() {
	}
	
}
