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
public class Admincheckfilter implements Filter {

    @Override
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;

        String ctxPath = request.getContextPath();

        HttpSession session = request.getSession(false);

        MemberDTO sessMember = null;

        if (session != null) {
            sessMember = (MemberDTO) session.getAttribute("sessMember");
        }

        // 1. 로그인 안 된 경우
        if (sessMember == null) {
            response.sendRedirect(ctxPath + "/user/login.do?login=required");
            return;
        }

        // 2. 로그인은 했지만 admin이 아닌 경우
        if (!"admin".equals(sessMember.getMemberrole())) {
            response.sendRedirect(ctxPath + "/index.do?admin=denied");
            return;
        }

        // 3. admin이면 통과
        chain.doFilter(req, resp);
    }
}