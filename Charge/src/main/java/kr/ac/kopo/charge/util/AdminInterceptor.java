package kr.ac.kopo.charge.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.kopo.charge.model.Member;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AdminInterceptor extends HandlerInterceptorAdapter {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{
		HttpSession session =request.getSession();
		
		Member member =  (Member) session.getAttribute("member");
		
		if(member != null && "admin".equals(member.getId())) {
			return true;
		}
		if(member != null)
			response.sendRedirect("/");
		else {
			String query = request.getQueryString();
			session.setAttribute("target", request.getRequestURL() + (query != null ? "?" + query : ""));
			response.sendRedirect("/login");
		}
		return false;
		
	}
}
