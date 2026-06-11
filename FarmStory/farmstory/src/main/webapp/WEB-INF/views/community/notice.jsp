<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
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
				<li class="on"><a
					href="<%=request.getContextPath()%>/community/notice.do">공지사항</a></li>
				<li><a href="<%=request.getContextPath()%>/community/meal.do">오늘의식단</a></li>
				<li><a href="<%=request.getContextPath()%>/community/chef.do">나도요리사</a></li>
				<li><a href="<%=request.getContextPath()%>/community/qna.do">1:1고객문의</a></li>
				<li><a href="<%=request.getContextPath()%>/community/faq.do">자주묻는질문</a></li>
			</ul>
		</aside>

		<article id="board">
			<nav>
				<img
					src="<%=request.getContextPath()%>/images/sub_nav_tit_cate5_tit1.png"
					alt="공지사항" />
				<p>
					HOME > 커뮤니티 > <em>공지사항</em>
				</p>
			</nav>

			<section class="list">
				<nav>
					<h1>글목록</h1>

					<form class="searchForm"
						action="<%=request.getContextPath()%>/community/notice.do" method="get">
						<input type="text" name="search" value="<%=search%>"
							placeholder="제목 키워드, 글쓴이 검색"> <input type="submit"
							value="검색">
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
						int num = communities.size();

						for (CommunityDTO community : communities) {
					%>
					<tr>
						<td><%=community.getBoardpostno()%></td>
						<td><a
							href="<%=request.getContextPath()%>/community/view.do?commno=<%=community.getCommno()%>">
								<%=community.getTitle()%> <%
 if (community.getCommentcount() > 0) {
 %> [<%=community.getCommentcount()%>] <%
 }
 %>
						</a></td>
						<td><%=community.getWriter()%></td>
						<td><%=community.getWdate()%></td>
						<td><%=community.getHit()%></td>
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
        
                    <%
				Integer pageNumObj = (Integer) request.getAttribute("page");
				Integer lastPageObj = (Integer) request.getAttribute("lastPage");
				Integer startPageObj = (Integer) request.getAttribute("startPage");
				Integer endPageObj = (Integer) request.getAttribute("endPage");
				
				int pageNum = (pageNumObj != null) ? pageNumObj : 1;
				int lastPage = (lastPageObj != null) ? lastPageObj : 1;
				int startPage = (startPageObj != null) ? startPageObj : 1;
				int endPage = (endPageObj != null) ? endPageObj : 1;
				
				String listUrl = (String) request.getAttribute("listUrl");
				String searchParam = (String) request.getAttribute("search");
				
				if(listUrl == null){
				    listUrl = request.getContextPath() + "/community/notice.do";
				}
				
				String queryString = "";
				
				if (searchParam != null && !searchParam.trim().isEmpty()) {
				    queryString = "&search=" + java.net.URLEncoder.encode(searchParam, "UTF-8");
				}
				%>

				<div class="page">
					<% if (pageNum > 1) { %>
					<a href="<%= listUrl %>?pg=<%= pageNum - 1 %><%= queryString %>"
						class="prev">이전</a>
					<% } else { %>
					<a href="#" class="prev">이전</a>
					<% } %>

					<% for (int i = startPage; i <= endPage; i++) { %>
					<a href="<%= listUrl %>?pg=<%= i %><%= queryString %>"
						class="num <%= pageNum == i ? "current" : "" %>"><%= i %></a>
					<% } %>

					<% if (pageNum < lastPage) { %>
					<a href="<%= listUrl %>?pg=<%= pageNum + 1 %><%= queryString %>"
						class="next">다음</a>
					<% } else { %>
					<a href="#" class="next">다음</a>
					<% } %>
				</div>

        
                        <a href="/farmstory/community/write.do?boardno=4"
						   class="btn btnWrite">
						    글쓰기
						</a>                        
                    </section>
                    <!-- 내용 끝 -->

                </article>
            </section>

        </div>
		<jsp:include page="/WEB-INF/views/common/_tail.jsp" />
    </div>    
</body>
</html>