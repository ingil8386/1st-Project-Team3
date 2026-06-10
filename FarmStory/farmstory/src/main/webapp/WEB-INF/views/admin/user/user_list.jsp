<%@ page contentType="text/html;charset=UTF-8" language="java"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="DTO.MemberDTO"%>

<%
    List<MemberDTO> members = (List<MemberDTO>) request.getAttribute("members");
%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<title>관리자::회원목록</title>
<link rel="stylesheet" href="/farmstory/css/admin.css">
</head>

<body>

	<div id="wrapper">

		<!-- 헤더 -->
		<header>
			<div class="header_inner">
				<a href="/farmstory/admin/admin.do"> <img
					src="https://farmstory.vercel.app/admin/images/admin_logo.jpg"
					alt="관리자 로고">
				</a>

				<div class="top_menu">
					<a href="/farmstory/admin/admin.do">HOME</a> <span>|</span> <a
						href="#">로그아웃</a> <span>|</span> <a href="#">고객센터</a>
				</div>
			</div>
		</header>

		<!-- 메인 -->
		<main>
			<div class="main_inner">

				<!-- 사이드 메뉴 -->
				<aside>
					<h3>주요기능</h3>

					<div class="menu">
						<strong>관리자</strong>
						<ul>
							<li><a href="<%= request.getContextPath() %>/admin/admin.do">
									메인목록</a></li>
						</ul>
					</div>



					<div class="menu">
						<h4>상품관리</h4>
						<ul>
							<li><a href="/farmstory/admin/product/product_list.do">상품목록</a></li>
							<li><a href="/farmstory/admin/product/product_register.do">상품등록</a></li>
						</ul>
					</div>

					<div class="menu">
						<h4>회원관리</h4>
						<ul>
							<li><a href="/farmstory/admin/user/user_list.do">회원목록</a></li>
						</ul>
					</div>
				</aside>

				<!-- 콘텐츠 -->
				<section class="content">
					<h3>회원목록</h3>

					<table>
						<thead>
							<tr>
								<th><input type="checkbox"></th>
								<th>아이디</th>
								<th>이름</th>
								<th>별명</th>
								<th>이메일</th>
								<th>휴대폰</th>
								<th>등급</th>
								<th>가입일</th>
								<th>확인</th>
							</tr>
						</thead>

						<tbody>
							<%
                            if (members != null && !members.isEmpty()) {
                                for (MemberDTO member : members) {
                        %>
							<tr>
								<td><input type="checkbox" name="memberid"
									value="<%= member.getMemberid() %>"></td>

								<td><%= member.getMemberid() %></td>
								<td><%= member.getMembername() %></td>
								<td><%= member.getMembernick() %></td>
								<td><%= member.getMemberemail() %></td>
								<td><%= member.getMemberhp() %></td>


								<td>
									<form
										action="<%= request.getContextPath() %>/admin/user/update_role.do"
										method="post">
										<input type="hidden" name="memberid"
											value="<%= member.getMemberid() %>"> <select
											name="memberrole" onchange="this.form.submit()">
											<option value="member"
												<%= "member".equals(member.getMemberrole()) ? "selected" : "" %>>member</option>
											<option value="admin"
												<%= "admin".equals(member.getMemberrole()) ? "selected" : "" %>>admin</option>
										</select>
									</form>
								</td>

								<td><%= member.getRdate() %></td>
								<td><a href="#">[상세확인]</a></td>
							</tr>
							<%
                                }
                            } else {
                        %>
							<tr>
								<td colspan="9">등록된 회원이 없습니다.</td>
							</tr>
							<%
                            }
                        %>
						</tbody>
					</table>

					<!-- 페이지 번호 -->
					<div class="pagination">
						<a href="#">&lt;</a> <a href="#" class="on">1</a> <a href="#">2</a>
						<a href="#">3</a> <a href="#">4</a> <a href="#">5</a> <a href="#">&gt;</a>
					</div>
				</section>

			</div>
		</main>

		<!-- 푸터 -->
		<footer>
			<p>Copyright(C)Farmstory All rights reserved.</p>
			<p>FARMSTORY ADMINISTRATOR Version 1.0.1</p>
		</footer>

	</div>

</body>

</html>