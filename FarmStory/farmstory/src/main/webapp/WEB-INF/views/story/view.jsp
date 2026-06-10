<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="DTO.CommunityDTO" %>
<%@ page import="DTO.CommentDTO" %>
<%@ page import="java.util.List" %>

<%
    CommunityDTO community = (CommunityDTO) request.getAttribute("community");
    List<CommentDTO> comments = (List<CommentDTO>) request.getAttribute("comments");

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
		<img src="<%= request.getContextPath() %>/images/sub_top_tit3.png"
			alt="CROP TALK">
	</div>

	<section class="croptalk">
		<aside>
			<img
				src="<%= request.getContextPath() %>/images/sub_aside_cate3_tit.png"
				alt="농작물이야기" />

			<ul class="lnb">
				<li class="<%= boardno == 1 ? "on" : "" %>"><a
					href="<%= request.getContextPath() %>/story/intro.do">농작물이야기</a></li>
				<li class="<%= boardno == 2 ? "on" : "" %>"><a
					href="<%= request.getContextPath() %>/story/garden.do">텃밭가꾸기</a></li>
				<li class="<%= boardno == 3 ? "on" : "" %>"><a
					href="<%= request.getContextPath() %>/story/school.do">귀농학교</a></li>
			</ul>
		</aside>

		<article id="board">
			<nav>
				<%
                    if (boardno == 1) {
                %>
				<img
					src="<%= request.getContextPath() %>/images/sub_nav_tit_cate3_tit1.png"
					alt="농작물이야기" />
				<%
                    } else if (boardno == 2) {
                %>
				<img
					src="<%= request.getContextPath() %>/images/sub_nav_tit_cate3_tit2.png"
					alt="텃밭가꾸기" />
				<%
                    } else {
                %>
				<img
					src="<%= request.getContextPath() %>/images/sub_nav_tit_cate3_tit3.png"
					alt="귀농학교" />
				<%
                    }
                %>

				<p>
					HOME > 농작물이야기 > <em><%= boardTitle %></em>
				</p>
			</nav>

			<section class="view">
				<h1>글보기</h1>

				<table border="0">
					<tr>
						<th>제목</th>
						<td><%= community.getTitle() %></td>
					</tr>

					<tr>
						<th>글쓴이</th>
						<td><%= community.getWriter() %></td>
					</tr>

					<tr>
						<th>날짜</th>
						<td><%= community.getWdate() %></td>
					</tr>

					<tr>
						<th>조회</th>
						<td><%= community.getHit() %></td>
					</tr>

					<tr>
						<td colspan="2" class="content"><%= community.getContent() == null 
                                    ? "" 
                                    : community.getContent().replace("\n", "<br>") %>
						</td>
					</tr>
				</table>

				<div class="btnGroup">
					<a href="<%= listUrl %>" class="btn btnList">목록</a> <a
						href="<%= request.getContextPath() %>/story/modify.do?commno=<%= community.getCommno() %>"
						class="btn btnModify">수정</a> <a
						href="<%= request.getContextPath() %>/story/delete.do?commno=<%= community.getCommno() %>&boardno=<%= boardno %>"
						class="btn btnDelete" onclick="return confirm('정말 삭제하시겠습니까?');">삭제</a>
				</div>
				
				<!-- 댓글 목록 -->
<section class="commentList">
    <h3>댓글목록</h3>

    <%
        if (comments == null || comments.size() == 0) {
    %>
        <p class="empty">등록된 댓글이 없습니다.</p>
    <%
        } else {
            for (CommentDTO comment : comments) {
    %>
        <article class="comment">
            <span class="writer"><%= comment.getWriter() %></span>
            <span class="date"><%= comment.getWdate() %></span>

            <p class="content">
                <%= comment.getContent() == null 
                        ? "" 
                        : comment.getContent().replace("\n", "<br>") %>
            </p>

            <%
                DTO.MemberDTO sessMember = (DTO.MemberDTO) session.getAttribute("sessMember");

                if (sessMember != null && sessMember.getMemberid().equals(comment.getWriter())) {
            %>
                <a href="<%= request.getContextPath() %>/story/comment/delete.do?commentno=<%= comment.getCommentno() %>"
                   class="btnCommentDelete"
                   onclick="return confirm('댓글을 삭제하시겠습니까?');">삭제</a>
            <%
                }
            %>
        </article>
    <%
            }
        }
    %>
</section>

<!-- 댓글 작성 -->
<section class="commentWrite">
    <h3>댓글쓰기</h3>

    <%
        DTO.MemberDTO sessMember = (DTO.MemberDTO) session.getAttribute("sessMember");

        if (sessMember == null) {
    %>
        <p>
            댓글을 작성하려면 
            <a href="<%= request.getContextPath() %>/user/login.do">로그인</a>
            이 필요합니다.
        </p>
    <%
        } else {
    %>
        <form action="<%= request.getContextPath() %>/story/comment/write.do" method="post">
            <input type="hidden" name="commno" value="<%= community.getCommno() %>">

            <textarea name="content" required placeholder="댓글을 입력하세요."></textarea>

            <div class="btnGroup">
                <input type="submit" class="btn btnComplete" value="댓글등록">
            </div>
        </form>
    <%
        }
    %>
</section>

			</section>
		</article>
	</section>
</div>

<jsp:include page="/WEB-INF/views/common/_tail.jsp" />