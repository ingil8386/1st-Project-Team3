<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="DTO.MemberDTO"%>
<%@ page import="DTO.CommentDTO"%>
<%@ page import="java.util.List"%>

<%
    MemberDTO sessMember = (MemberDTO) session.getAttribute("sessMember");
    List<CommentDTO> comments = (List<CommentDTO>) request.getAttribute("comments");

    if (sessMember == null) {
        response.sendRedirect(request.getContextPath() + "/user/login.do");
        return;
    }
%>

<jsp:include page="/WEB-INF/views/common/_head.jsp" />

<div id="sub">
    <section class="myinfo">
        <aside>
            <h2>마이페이지</h2>

            <ul class="myinfoLnb">
                <li><a href="<%=request.getContextPath()%>/user/myinfo.do">내 정보</a></li>
                <li><a href="<%=request.getContextPath()%>/market/cart.do">장바구니</a></li>
                <li><a href="<%=request.getContextPath()%>/user/myarticle.do">내가 쓴 글</a></li>
                <li class="on"><a href="<%=request.getContextPath()%>/user/mycomment.do">내가 쓴 댓글</a></li>
                <li><a href="<%=request.getContextPath()%>/user/modify.do">정보수정</a></li>
                <li><a href="<%=request.getContextPath()%>/user/leave.do">회원탈퇴</a></li>
            </ul>
        </aside>

        <article id="board">
            <nav>
                <h1>내가 쓴 댓글</h1>
                <p>HOME > 마이페이지 > <em>내가 쓴 댓글</em></p>
            </nav>

            <section class="list">
                <h3>내가 작성한 댓글</h3>

                <table border="0">
                    <tr>
                        <th>번호</th>
                        <th>게시글 제목</th>
                        <th>댓글 내용</th>
                        <th>작성일</th>
                    </tr>

                    <%
                        if (comments == null || comments.size() == 0) {
                    %>
                        <tr>
                            <td colspan="4">작성한 댓글이 없습니다.</td>
                        </tr>
                    <%
                        } else {
                            int num = comments.size();

                            for (CommentDTO comment : comments) {
                    %>
                        <tr>
                            <td><%=num--%></td>
                            <td>
                                <a href="<%=request.getContextPath()%>/story/view.do?commno=<%=comment.getCommno()%>">
                                    <%=comment.getTitle()%>
                                </a>
                            </td>
                            <td><%=comment.getContent()%></td>
                            <td><%=comment.getWdate()%></td>
                        </tr>
                    <%
                            }
                        }
                    %>
                </table>
            </section>
        </article>
    </section>
</div>

<jsp:include page="/WEB-INF/views/common/_tail.jsp" />