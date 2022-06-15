package kr.ac.kopo.charge.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import kr.ac.kopo.charge.model.Member;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class UserInterceptor extends HandlerInterceptorAdapter {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handlere) throws Exception{
		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("member");
		
		if(member != null) {
			return true;
		}
		
		String query = request.getQueryString();
		session.setAttribute("target", request.getRequestURL() + (query != null ? "?" + query : ""));
		response.sendRedirect("/login");
		session.setAttribute("msg", "로그인 후 사용 가능합니다.");
		return false;
		
		
	}
}
