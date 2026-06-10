<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="DTO.CommunityDTO" %>

<%
    List<CommunityDTO> communities = (List<CommunityDTO>) request.getAttribute("communities");
    String search = (String) request.getAttribute("search");

    if (search == null) {
        search = "";
    }
%>

<jsp:include page="/WEB-INF/views/common/_head.jsp" />

<div id="sub">
    <div>
        <img src="<%= request.getContextPath() %>/images/sub_top_tit3.png" alt="CROP TALK">
    </div>

    <section class="croptalk">
        <aside>
            <img src="<%= request.getContextPath() %>/images/sub_aside_cate3_tit.png" alt="농작물이야기"/>

            <ul class="lnb">
                <li class="on"><a href="<%= request.getContextPath() %>/story/intro.do">농작물이야기</a></li>
                <li><a href="<%= request.getContextPath() %>/story/garden.do">텃밭가꾸기</a></li>
                <li><a href="<%= request.getContextPath() %>/story/school.do">귀농학교</a></li>
            </ul>
        </aside>

        <article id="board">
            <nav>
                <img src="<%= request.getContextPath() %>/images/sub_nav_tit_cate3_tit1.png" alt="농작물이야기"/>
                <p>
                    HOME > 농작물이야기 > <em>농작물이야기</em>
                </p>
            </nav>

            <section class="list">
                <nav>
                    <h1>글목록</h1>

                    <form action="<%= request.getContextPath() %>/story/intro.do" method="get">
                        <input type="text" name="search" value="<%= search %>" placeholder="제목 키워드, 글쓴이 검색">
                        <input type="submit" value="검색">
                    </form>
                </nav>

                <table border="0">
                    <tr>
                        <th>번호</th>
                        <th>제목</th>
                        <th>글쓴이</th>
                        <th>날짜</th>
                        <th>조회</th>
                    </tr>

                    <%
                        if (communities != null && !communities.isEmpty()) {
                            for (CommunityDTO community : communities) {
                    %>
                                <tr>
                                    <td><%= community.getCommno() %></td>
                                    <td>
                                        <a href="<%= request.getContextPath() %>/story/view.do?commno=<%= community.getCommno() %>">
                                            <%= community.getTitle() %>
                                            <% if (community.getCommentcount() > 0) { %>
                                                [<%= community.getCommentcount() %>]
                                            <% } %>
                                        </a>
                                    </td>
                                    <td><%= community.getWriter() %></td>
                                    <td><%= community.getWdate() %></td>
                                    <td><%= community.getHit() %></td>
                                </tr>
                    <%
                            }
                        } else {
                    %>
                            <tr>
                                <td colspan="5">등록된 게시글이 없습니다.</td>
                            </tr>
                    <%
                        }
                    %>
                </table>

                <div class="page">
                    <a href="#" class="prev">이전</a>
                    <a href="#" class="num current">1</a>
                    <a href="#" class="next">다음</a>
                </div>

                <a href="<%= request.getContextPath() %>/story/write.do?boardno=1" class="btn btnWrite">글쓰기</a>
            </section>
        </article>
    </section>
</div>

<jsp:include page="/WEB-INF/views/common/_tail.jsp" />