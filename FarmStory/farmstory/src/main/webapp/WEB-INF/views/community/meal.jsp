<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="DTO.CommunityDTO"%>

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
      <img src="<%=request.getContextPath()%>/images/sub_top_tit5.png"
         alt="COMMUNITY">
   </div>

   <section class="community">
      <aside>
         <img
            src="<%=request.getContextPath()%>/images/sub_aside_cate5_tit.png"
            alt="커뮤니티" />

         <ul class="lnb">
            <li><a href="<%=request.getContextPath()%>/community/notice.do">공지사항</a></li>
            <li class="on"><a href="<%=request.getContextPath()%>/community/meal.do">오늘의식단</a></li>
            <li><a href="<%=request.getContextPath()%>/community/chef.do">나도요리사</a></li>
            <li><a href="<%=request.getContextPath()%>/community/qna.do">1:1고객문의</a></li>
            <li><a href="<%=request.getContextPath()%>/community/faq.do">자주묻는질문</a></li>
         </ul>
      </aside>

                <article id="board">
                    <nav>
                        <img src="/farmstory/images/sub_nav_tit_cate5_tit2.png" alt="오늘의식단"/>
                        <p>
                            HOME > 커뮤니티 > <em>오늘의식단</em>
                        </p>
                    </nav>

                     <section class="list">
            <nav>
               <h1>글목록</h1>

               <form class="searchForm"
                  action="<%=request.getContextPath()%>/community/meal.do" method="get">
                  <input type="text" name="search" value="<%=search%>"
                     placeholder="제목 키워드, 글쓴이 검색"> <input type="submit"
                     value="검색">
               </form>
            </nav>
            <h1>글목록</h1>        
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
    int pageNum = (Integer) request.getAttribute("page");
    int lastPage = (Integer) request.getAttribute("lastPage");
    int startPage = (Integer) request.getAttribute("startPage");
    int endPage = (Integer) request.getAttribute("endPage");
    String listUrl = (String) request.getAttribute("listUrl");
    String searchParam = (String) request.getAttribute("search");

    String queryString = "";
    if (searchParam != null && !searchParam.trim().isEmpty()) {
        queryString = "&search=" + java.net.URLEncoder.encode(searchParam, "UTF-8");
    }
%>

            <div class="page">
               <% if (pageNum > 1) { %>
               <a href="<%= listUrl %>?page=<%= pageNum - 1 %><%= queryString %>"
                  class="prev">이전</a>
               <% } else { %>
               <a href="#" class="prev">이전</a>
               <% } %>

               <% for (int i = startPage; i <= endPage; i++) { %>
               <a href="<%= listUrl %>?page=<%= i %><%= queryString %>"
                  class="num <%= pageNum == i ? "current" : "" %>"><%= i %></a>
               <% } %>

               <% if (pageNum < lastPage) { %>
               <a href="<%= listUrl %>?page=<%= pageNum + 1 %><%= queryString %>"
                  class="next">다음</a>
               <% } else { %>
               <a href="#" class="next">다음</a>
               <% } %>
            </div>

        
                        <a href="/farmstory/community/write.do?boardno=5"
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