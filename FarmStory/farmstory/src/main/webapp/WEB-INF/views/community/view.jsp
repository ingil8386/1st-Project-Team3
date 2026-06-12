<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="DTO.CommunityDTO"%>
<%@ page import="DTO.CommentDTO"%>
<%@ page import="java.util.List"%>
<%@ page import="DTO.FileDTO"%>


<%
CommunityDTO community = (CommunityDTO) request.getAttribute("community");
List<CommentDTO> comments = (List<CommentDTO>) request.getAttribute("comments");
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
		<img src="<%=request.getContextPath()%>/images/sub_top_tit5.png"
			alt="COMMUNITY">
	</div>

	<section class="community">
		<aside>
			<img
				src="<%=request.getContextPath()%>/images/sub_aside_cate5_tit.png"
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
						src="<%=request.getContextPath()%>/images/sub_nav_tit_cate5_tit3.png"
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

				<p>
					HOME > 커뮤니티 > <em><%=boardTitle%></em>
				</p>
			</nav>

			<section class="view">
				<h1>글보기</h1>

				<table border="0">
					<tr>
						<th>제목</th>
						<td><%=community.getTitle()%></td>
					</tr>

					<tr>
						<th>글쓴이</th>
						<td><%=community.getWriter()%></td>
					</tr>

					<tr>
						<th>날짜</th>
						<td><%=community.getWdate()%></td>
					</tr>

					<tr>
						<th>조회</th>
						<td><%=community.getHit()%></td>
					</tr>

					<tr>
						<th>첨부파일</th>
						<td>
							<%
            if (files == null || files.size() == 0) {
        %> 첨부파일 없음 <%
            } else {
                for (FileDTO file : files) {
        %>
							<p>
								<a
									href="<%= request.getContextPath() %>/community/file/download.do?fileno=<%= file.getFileno() %>">
									<%= file.getOfname() %>
								</a> 다운로드
								<%= file.getDownload() %>회
							</p> <%
                }
            }
        %>
						</td>
					</tr>


					<tr>
						<td colspan="2" class="content"><%=community.getContent() == null ? "" : community.getContent().replace("\n", "<br>")%>
						</td>
					</tr>

				</table>

				<div class="btnGroup">
					<a href="<%=listUrl%>" class="btn btnList">목록</a> 
					<a href="<%=request.getContextPath()%>/community/modify.do?commno=<%=community.getCommno()%>&boardno=<%=boardno%>" class="btn btnModify">수정</a>					
					<a href="<%=request.getContextPath()%>/community/delete.do?commno=<%=community.getCommno()%>&boardno=<%=boardno%>"
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

						<div class="commentInfo">
							<span class="writer"><%= comment.getWriter() %></span> <span
								class="date"><%= comment.getWdate() %></span>
						</div>

						<!-- 기본 댓글 내용 -->
						<p class="commentContentText"
							id="commentContent<%= comment.getCommentno() %>">
							<%= comment.getContent() == null
                        ? ""
                        : comment.getContent().replace("\n", "<br>") %>
						</p>

						<%
                DTO.MemberDTO sessMemberForComment =
                    (DTO.MemberDTO) session.getAttribute("sessMember");

                if (sessMemberForComment != null
                        && sessMemberForComment.getMemberid().equals(comment.getWriter())) {
            %>

						<!-- 수정 / 삭제 버튼 -->
						<div class="commentBtnGroup"
							id="commentBtnGroup<%= comment.getCommentno() %>">
							<a href="javascript:void(0);" class="btnCommentModify"
								onclick="showCommentModify(<%= comment.getCommentno() %>)">수정</a>

							<a
								href="<%= request.getContextPath() %>/community/comment/delete.do?commentno=<%= comment.getCommentno() %>"
								class="btnCommentDelete"
								onclick="return confirm('댓글을 삭제하시겠습니까?');">삭제</a>
						</div>

						<!-- 댓글 수정 폼 -->
						<form
							action="<%= request.getContextPath() %>/community/comment/modify.do"
							method="post" class="commentModifyForm"
							id="commentModifyForm<%= comment.getCommentno() %>"
							style="display: none;">

							<input type="hidden" name="commentno"
								value="<%= comment.getCommentno() %>">

							<textarea name="content" required><%= comment.getContent() %></textarea>

							<div class="commentModifyBtnGroup">
								<input type="submit" value="수정완료"
									class="btnCommentModifyComplete">

								<button type="button" class="btnCommentCancel"
									onclick="hideCommentModify(<%= comment.getCommentno() %>)">
									취소</button>
							</div>
						</form>

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
						댓글을 작성하려면 <a href="<%=request.getContextPath()%>/user/login.do">로그인</a>
						이 필요합니다.
					</p>
					<%
					} else {
					%>
					<form action="<%=request.getContextPath()%>/community/comment/write.do"
						method="post">
						<input type="hidden" name="commno"
							value="<%=community.getCommno()%>">

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

<script>
    function showCommentModify(commentno) {
        document.getElementById("commentContent" + commentno).style.display = "none";
        document.getElementById("commentBtnGroup" + commentno).style.display = "none";
        document.getElementById("commentModifyForm" + commentno).style.display = "block";
    }

    function hideCommentModify(commentno) {
        document.getElementById("commentContent" + commentno).style.display = "block";
        document.getElementById("commentBtnGroup" + commentno).style.display = "block";
        document.getElementById("commentModifyForm" + commentno).style.display = "none";
    }
</script>



<jsp:include page="/WEB-INF/views/common/_tail.jsp" />