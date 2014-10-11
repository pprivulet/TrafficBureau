package com.tb.web.common;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tb.common.Constant;

public class AuthFilter implements Filter {

	public void doFilter(ServletRequest servletRequest,
			ServletResponse servletResponse, FilterChain filterChain)
			throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) servletRequest;
		HttpServletResponse response = (HttpServletResponse) servletResponse;
		response.setContentType("text/html;charset=UTF-8");
		String uri = request.getRequestURI();
		if ((uri.indexOf("admin/") > -1)) {
			if (request.getSession().getAttribute(Constant.RUN_DATA) == null) {
				redirectToLogin(request, response, uri);
				return;
			}
		}
		filterChain.doFilter(request, response);
	}

	public void redirectToLogin(HttpServletRequest request,
			HttpServletResponse response, String oldUrl) throws IOException,
			ServletException {
		String basePath = request.getContextPath();
		String url = basePath + "/login.html";
		request.setAttribute("oldurl", oldUrl);
		response.sendRedirect(url);
	}

	public void init(FilterConfig filterConfig) throws ServletException {
		this.filterConfig = filterConfig;
	}

	public void setFilterConfig(FilterConfig filterConfig) {
		this.filterConfig = filterConfig;
	}

	protected FilterConfig filterConfig;

	public void destroy() {
		filterConfig = null;
	}

}
