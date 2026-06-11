<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="DTO.CommunityDTO"%>
<%@ page import="java.util.List"%>
<%@ page import="DTO.FileDTO"%>


<%
CommunityDTO community = (CommunityDTO) request.getAttribute("community");
List<FileDTO> files = (List<FileDTO>) request.getAttribute("files");

if (community == null) {
	response.sendRedirect(request.getContextPath() + "/community/notice.do");
	return;
}

int boardno = community.getBoardno();

String boardTitle = "커뮤니티";
String listUrl = request.getContextPath() + "/community/notice.do";

if (boardno == 4) {
	boardTitle = "공지사항";
	listUrl = request.getContextPath() + "/community/notice.do";
} else if (boardno == 5) {
	boardTitle = "오늘의식단";
	listUrl = request.getContextPath() + "/community/meal.do";
} else if (boardno == 6) {
	boardTitle = "나도요리사";
	listUrl = request.getContextPath() + "/community/chef.do";
} else if (boardno == 7) {
	boardTitle = "1:1고객문의";
	listUrl = request.getContextPath() + "/community/qna.do";
} else if (boardno == 8) {
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
				<li class="<%=boardno == 4 ? "on" : ""%>"><a
					href="<%=request.getContextPath()%>/community/notice.do">공지사항</a></li>
				<li class="<%=boardno == 5 ? "on" : ""%>"><a
					href="<%=request.getContextPath()%>/community/meal.do">오늘의식단</a></li>
				<li class="<%=boardno == 6 ? "on" : ""%>"><a
					href="<%=request.getContextPath()%>/community/chef.do">나도요리사</a></li>
				<li class="<%=boardno == 7 ? "on" : ""%>"><a
					href="<%=request.getContextPath()%>/community/qna.do">1:1고객문의</a></li>
				<li class="<%=boardno == 8 ? "on" : ""%>"><a
					href="<%=request.getContextPath()%>/community/faq.do">자주묻는질문</a></li>
			</ul>
		</aside>

		<article id="board">
			<nav>
				<%
				if (boardno == 4) {
				%>
				<img
					src="<%=request.getContextPath()%>/images/sub_nav_tit_cate5_tit1.png"
					alt="공지사항" />
				<%
				} else if (boardno == 5) {
				%>
				<img
					src="<%=request.getContextPath()%>/images/sub_nav_tit_cate5_tit2.png"
					alt="오늘의식단" />
				<%
				} else if (boardno == 6) {
					%>
					<img
						src="<%=request.getContextPath()%>/images/sub_nav_tit_cate3_tit2.png"
						alt="나도요리사" />
					<%
				} else if (boardno == 7) {
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

			<section class="write">
				<h1>글수정</h1>

				<form action="<%=request.getContextPath()%>/community/modify.do"
					method="post" enctype="multipart/form-data">

					<input type="hidden" name="commno"
						value="<%=community.getCommno()%>">
					<table border="0">
						<tr>
							<th>제목</th>
							<td><input type="text" name="title"
								value="<%=community.getTitle()%>" required></td>
						</tr>

						<tr>
							<th>내용</th>
							<td><textarea name="content" required><%=community.getContent()%></textarea>
							</td>
						</tr>
						<tr>
							<th>기존 첨부파일</th>
							<td>
								<%
								if (files == null || files.size() == 0) {
								%> 첨부파일 없음 <%
								} else {
								for (FileDTO file : files) {
								%>
								<p>
									<%=file.getOfname()%>
									<label> <input type="checkbox" name="deleteFile"
										value="<%=file.getFileno()%>"> 삭제
									</label>
								</p> <%
 }
 }
 %>
							</td>
						</tr>

						<tr>
							<th>새 첨부파일</th>
							<td><input type="file" name="file">
								<p style="font-size: 12px; color: #777; margin-top: 5px;">
									첨부파일은 최대 10MB까지 가능합니다.</p></td>
						</tr>
					</table>

					<div class="btnGroup">
						<a
							href="<%=request.getContextPath()%>/story/view.do?commno=<%=community.getCommno()%>"
							class="btn btnCancel">취소</a> <input type="submit"
							class="btn btnComplete" value="수정완료">
					</div>
				</form>
			</section>
		</article>
	</section>
</div>

<jsp:include page="/WEB-INF/views/common/_tail.jsp" />