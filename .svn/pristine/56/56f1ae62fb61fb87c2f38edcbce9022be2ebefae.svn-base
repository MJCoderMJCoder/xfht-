package com.cxgc.front.application;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

/**
 * 登录权限验证
 * 
 * @author Ghoul
 *
 */
public class LogonInterceptor extends HandlerInterceptorAdapter {

	private static final String[] Urls = { "cm_"};

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String url = request.getRequestURL().toString();
		int tempint = 0;
        boolean flag=false;
		for (String s : Urls) {
            if (url.contains(s)) {
            	tempint++;
            }
        }
		/*if(url.contains(StacticVariable.getDoMain()) && request.getSession().getAttribute("user") != null){
    		request.getRequestDispatcher("/cm_index").forward(request, response);
	     	return true;
        }*/
		if(tempint==0){
     	   return true;
		} else {
			if (request.getSession().getAttribute("user") != null) {
				flag=true;
			} 
			if(!flag)  {
	        	//response.sendRedirect(request.getContextPath());
        		request.getRequestDispatcher("/").forward(request, response);
	        	return  flag;
	        }
	        else  {
	        	return flag;
	        }

		}
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		try {
			Object o = null;
			if (request.getSession().getAttribute("userSession") != null) {
				o = request.getSession().getAttribute("userSession");
			} else {
				o = null;
			}
			modelAndView.addObject("session", o);
		} catch (Exception e) {
		}
	}
}