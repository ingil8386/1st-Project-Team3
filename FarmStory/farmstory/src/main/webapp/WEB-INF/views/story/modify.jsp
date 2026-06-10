<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="DTO.CommunityDTO" %>

<%
    CommunityDTO community = (CommunityDTO) request.getAttribute("community");

    if (community == null) {
        response.sendRedirect(request.getContextPath() + "/story/intro.do");
        return;
    }

    int boardno = community.getBoardno();

    String boardTitle = "농작물이야기";
    String listUrl = request.getContextPath() + "/story/intro.do";

    if (boardno == 1) {
        boardTitle = "농작물이야기";
        listUrl = request.getContextPath() + "/story/intro.do";
    } else if (boardno == 2) {
        boardTitle = "텃밭가꾸기";
        listUrl = request.getContextPath() + "/story/garden.do";
    } else if (boardno == 3) {
        boardTitle = "귀농학교";
        listUrl = request.getContextPath() + "/story/school.do";
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
                <li class="<%= boardno == 1 ? "on" : "" %>">
                    <a href="<%= request.getContextPath() %>/story/intro.do">농작물이야기</a>
                </li>
                <li class="<%= boardno == 2 ? "on" : "" %>">
                    <a href="<%= request.getContextPath() %>/story/garden.do">텃밭가꾸기</a>
                </li>
                <li class="<%= boardno == 3 ? "on" : "" %>">
                    <a href="<%= request.getContextPath() %>/story/school.do">귀농학교</a>
                </li>
            </ul>
        </aside>

        <article id="board">
            <nav>
                <%
                    if (boardno == 1) {
                %>
                    <img src="<%= request.getContextPath() %>/images/sub_nav_tit_cate3_tit1.png" alt="농작물이야기"/>
                <%
                    } else if (boardno == 2) {
                %>
                    <img src="<%= request.getContextPath() %>/images/sub_nav_tit_cate3_tit2.png" alt="텃밭가꾸기"/>
                <%
                    } else {
                %>
                    <img src="<%= request.getContextPath() %>/images/sub_nav_tit_cate3_tit3.png" alt="귀농학교"/>
                <%
                    }
                %>

                <p>
                    HOME > 농작물이야기 > <em><%= boardTitle %></em>
                </p>
            </nav>

            <section class="write">
                <h1>글수정</h1>

                <form action="<%= request.getContextPath() %>/story/modify.do" method="post">
                    <input type="hidden" name="commno" value="<%= community.getCommno() %>">

                    <table border="0">
                        <tr>
                            <th>제목</th>
                            <td>
                                <input type="text" name="title" value="<%= community.getTitle() %>" required>
                            </td>
                        </tr>

                        <tr>
                            <th>내용</th>
                            <td>
                                <textarea name="content" required><%= community.getContent() %></textarea>
                            </td>
                        </tr>
                    </table>

                    <div class="btnGroup">
                        <a href="<%= request.getContextPath() %>/story/view.do?commno=<%= community.getCommno() %>" class="btn btnCancel">취소</a>
                        <input type="submit" class="btn btnComplete" value="수정완료">
                    </div>
                </form>
            </section>
        </article>
    </section>
</div>

<jsp:include page="/WEB-INF/views/common/_tail.jsp" />