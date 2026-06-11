<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="DTO.MemberDTO"%>
<%@ page import="DTO.CommunityDTO"%>
<%@ page import="java.util.List"%>

<%
    MemberDTO sessMember = (MemberDTO) session.getAttribute("sessMember");
    List<CommunityDTO> articles = (List<CommunityDTO>) request.getAttribute("articles");

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
                <li class="on"><a href="<%=request.getContextPath()%>/user/myarticle.do">내가 쓴 글</a></li>
                <li><a href="<%=request.getContextPath()%>/user/mycomment.do">내가 쓴 댓글</a></li>
                <li><a href="<%=request.getContextPath()%>/user/modify.do">정보수정</a></li>
                <li><a href="<%=request.getContextPath()%>/user/leave.do">회원탈퇴</a></li>
            </ul>
        </aside>

        <article id="board">
            <nav>
                <h1>내가 쓴 글</h1>
                <p>HOME > 마이페이지 > <em>내가 쓴 글</em></p>
            </nav>

            <section class="list">
                <h3>내가 작성한 게시글</h3>

                <table border="0">
                    <tr>
                        <th>번호</th>
                        <th>게시판</th>
                        <th>제목</th>
                        <th>날짜</th>
                        <th>조회</th>
                    </tr>

                    <%
                        if (articles == null || articles.size() == 0) {
                    %>
                        <tr>
                            <td colspan="5">작성한 게시글이 없습니다.</td>
                        </tr>
                    <%
                        } else {
                            for (CommunityDTO article : articles) {
                                String boardName = "기타";

                                if (article.getBoardno() == 1) {
                                    boardName = "농작물이야기";
                                } else if (article.getBoardno() == 2) {
                                    boardName = "텃밭가꾸기";
                                } else if (article.getBoardno() == 3) {
                                    boardName = "귀농학교";
                                } else if (article.getBoardno() == 4) {
                                    boardName = "공지사항";
                                } else if (article.getBoardno() == 5) {
                                    boardName = "오늘의식단";
                                } else if (article.getBoardno() == 6) {
                                    boardName = "나도요리사";
                                } else if (article.getBoardno() == 7) {
                                    boardName = "1:1고객문의";
                                } else if (article.getBoardno() == 8) {
                                    boardName = "자주묻는질문";
                                }
                    %>
                        <tr>
                            <td><%=article.getBoardpostno()%></td>
                            <td><%=boardName%></td>
                            <td>
                                <a href="<%=request.getContextPath()%>/story/view.do?commno=<%=article.getCommno()%>">
                                    <%=article.getTitle()%>
                                    <% if (article.getCommentcount() > 0) { %>
                                        [<%=article.getCommentcount()%>]
                                    <% } %>
                                </a>
                            </td>
                            <td><%=article.getWdate()%></td>
                            <td><%=article.getHit()%></td>
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