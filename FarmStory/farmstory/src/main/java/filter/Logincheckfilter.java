package filter;

import java.io.IOException;

import DTO.MemberDTO;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebFilter(urlPatterns = {"/admin/*"})
public class Logincheckfilter implements Filter {

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) req;
		
		HttpSession session = request.getSession();
		MemberDTO sessUser = (MemberDTO) session.getAttribute("sessUser");
	
		if(sessUser == null) {
			HttpServletResponse response = (HttpServletResponse) resp;
			response.sendRedirect("/farmstory/user/login.do?login=required");
		}else {
			chain.doFilter(req, resp);
		}
	}

}
