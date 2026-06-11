<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    String boardno = (String) request.getAttribute("boardno");

    if (boardno == null || boardno.trim().isEmpty()) {
        boardno = request.getParameter("boardno");
    }

    if (boardno == null || boardno.trim().isEmpty()) {
        boardno = "4";
    }

    String boardTitle = "공지사항";
    String listUrl = request.getContextPath() + "/community/notice.do";

    if ("4".equals(boardno)) {
        boardTitle = "공지사항";
        listUrl = request.getContextPath() + "/community/notice.do";
    } else if ("5".equals(boardno)) {
        boardTitle = "오늘의식단";
        listUrl = request.getContextPath() + "/community/meal.do";
    } else if ("6".equals(boardno)) {
        boardTitle = "나도요리사";
        listUrl = request.getContextPath() + "/community/chef.do";
    } else if ("7".equals(boardno)) {
        boardTitle = "1:1고객문의";
        listUrl = request.getContextPath() + "/community/qna.do";
    } else if ("8".equals(boardno)) {
        boardTitle = "자주묻는질문";
        listUrl = request.getContextPath() + "/community/faq.do";
    }
%>

<jsp:include page="/WEB-INF/views/common/_head.jsp" />

<div id="sub">
	<div>
		<img src="<%=request.getContextPath()%>/images/sub_top_tit3.png"
			alt="COMMUNITY">
	</div>

	<section class="community">
		<aside>
			<img
				src="<%=request.getContextPath()%>/images/sub_aside_cate3_tit.png"
				alt="커뮤니티" />

			<ul class="lnb">
				<li class="<%= "4".equals(boardno) ? "on" : "" %>"><a
					href="<%= request.getContextPath() %>/community/notice.do">공지사항</a></li>
				<li class="<%= "5".equals(boardno) ? "on" : "" %>"><a
					href="<%= request.getContextPath() %>/community/meal.do">오늘의식단</a></li>
				<li class="<%= "6".equals(boardno) ? "on" : "" %>"><a
					href="<%= request.getContextPath() %>/community/chef.do">나도요리사</a></li>
				<li class="<%= "7".equals(boardno) ? "on" : "" %>"><a
					href="<%= request.getContextPath() %>/community/qna.do">1:1고객문의</a></li>
				<li class="<%= "8".equals(boardno) ? "on" : "" %>"><a
					href="<%= request.getContextPath() %>/community/faq.do">자주묻는질문</a></li>
			</ul>
		</aside>

		<article id="board">
			<nav>
				<%
				if ("4".equals(boardno)) {
				%>
				<img
					src="<%=request.getContextPath()%>/images/sub_nav_tit_cate5_tit1.png"
					alt="공지사항" />
				<%
				} else if ("5".equals(boardno)) {
				%>
				<img
					src="<%=request.getContextPath()%>/images/sub_nav_tit_cate5_tit2.png"
					alt="오늘의식단" />
				<%
				} else if ("6".equals(boardno)) {
					%>
					<img
						src="<%=request.getContextPath()%>/images/sub_nav_tit_cate3_tit2.png"
						alt="나도요리사" />
					<%
				} else if ("7".equals(boardno)) {
					%>
					<img
						src="<%=request.getContextPath()%>/images/sub_nav_tit_cate5_tit4.png"
						alt="1:1고객문의" />
					<%
				} else {
				%>
				<img
					src="<%=request.getContextPath()%>/images/sub_nav_tit_cate5_tit5.png"
					alt="자주묻는질문" />
				<%
				}
				%>

				<p>
					HOME > 농작물이야기 > <em><%=boardTitle%></em>
				</p>
			</nav>

			<section class="write">
				<form action="<%= request.getContextPath() %>/community/write.do"
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