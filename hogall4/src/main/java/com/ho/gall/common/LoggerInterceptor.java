package com.ho.gall.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoggerInterceptor extends HandlerInterceptorAdapter{
	
	private Logger logger=LoggerFactory.getLogger(LoggerInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{
		System.out.println("오긴옴?");
		logger.info("오긴옴?");
		logger.debug("===strt===");
		logger.debug(request.getRequestURI());
		
		
		if(request.getSession().getAttribute("loggedMember")==null) {
			System.out.println("오긴옴?");
			request.setAttribute("msg", "로그인");
			request.setAttribute("loc", "/");
			request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);;
			return false;
		} else {
			return super.preHandle(request, response, handler);
		}
		
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView mv) throws Exception {
		logger.debug("===view===");
		super.postHandle(request, response, handler, mv);
	}
	
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
		logger.debug("===end===");
		super.afterCompletion(request, response, handler, ex);
	}
}
