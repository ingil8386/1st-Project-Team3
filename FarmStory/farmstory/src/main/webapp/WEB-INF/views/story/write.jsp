<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    String boardno = (String) request.getAttribute("boardno");

    if (boardno == null || boardno.trim().isEmpty()) {
        boardno = request.getParameter("boardno");
    }

    if (boardno == null || boardno.trim().isEmpty()) {
        boardno = "1";
    }

    String boardTitle = "농작물이야기";
    String listUrl = request.getContextPath() + "/story/intro.do";

    if ("1".equals(boardno)) {
        boardTitle = "농작물이야기";
        listUrl = request.getContextPath() + "/story/intro.do";
    } else if ("2".equals(boardno)) {
        boardTitle = "텃밭가꾸기";
        listUrl = request.getContextPath() + "/story/garden.do";
    } else if ("3".equals(boardno)) {
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
				<li class="<%= "1".equals(boardno) ? "on" : "" %>"><a
					href="<%= request.getContextPath() %>/story/intro.do">농작물이야기</a></li>
				<li class="<%= "2".equals(boardno) ? "on" : "" %>"><a
					href="<%= request.getContextPath() %>/story/garden.do">텃밭가꾸기</a></li>
				<li class="<%= "3".equals(boardno) ? "on" : "" %>"><a
					href="<%= request.getContextPath() %>/story/school.do">귀농학교</a></li>
			</ul>
		</aside>

		<article id="board">
			<nav>
				<%
                    if ("1".equals(boardno)) {
                %>
				<img
					src="<%= request.getContextPath() %>/images/sub_nav_tit_cate3_tit1.png"
					alt="농작물이야기" />
				<%
                    } else if ("2".equals(boardno)) {
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

			<section class="write">
				<form action="<%= request.getContextPath() %>/story/write.do"
					method="post" enctype="multipart/form-data">
					<input type="hidden" name="boardno" value="<%= boardno %>">

					<table border="0">
						<tr>
							<th>제목</th>
							<td><input type="text" name="title" placeholder="제목을 입력하세요."
								required></td>
						</tr>

						<tr>
							<th>내용</th>
							<td><textarea name="content" placeholder="내용을 입력하세요."
									required></textarea></td>
						</tr>
						<tr>
							<th>첨부파일</th>
							<td><input type="file" name="file">
								<p style="font-size: 12px; color: #777; margin-top: 5px;">
									첨부파일은 최대 10MB까지 가능합니다.</p></td>
						</tr>
					</table>

					<div class="btnGroup">
						<a href="<%= listUrl %>" class="btn btnCancel">취소</a> <input
							type="submit" class="btn btnComplete" value="작성완료">
					</div>
				</form>
			</section>
		</article>
	</section>
</div>

<jsp:include page="/WEB-INF/views/common/_tail.jsp" />