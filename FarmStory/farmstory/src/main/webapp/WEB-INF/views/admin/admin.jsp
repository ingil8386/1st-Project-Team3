<%@ page contentType="text/html;charset=UTF-8" language="java"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="java.text.DecimalFormat"%>
<%@ page import="DTO.ProductDTO"%>
<%@ page import="DTO.MemberDTO"%>

<%
    List<ProductDTO> products = (List<ProductDTO>) request.getAttribute("products");
    List<MemberDTO> members = (List<MemberDTO>) request.getAttribute("members");

    DecimalFormat df = new DecimalFormat("#,###");
%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<title>관리자::메인</title>
<link rel="stylesheet"
	href="<%= request.getContextPath() %>/css/admin.css">
</head>

<body>

	<div id="wrapper">

		<!-- 헤더 -->
		<header>
			<div class="header_inner">
				<a href="<%= request.getContextPath() %>/admin/admin.do"> <img
					src="https://farmstory.vercel.app/admin/images/admin_logo.jpg"
					alt="관리자 로고">
				</a>

				<div class="top_menu">
					<a href="<%= request.getContextPath() %>/index.do">HOME</a> <span>|</span>
					<a href="<%= request.getContextPath() %>/user/logout.do">로그아웃</a> <span>|</span>
					<a href="<%= request.getContextPath() %>/community/qna.do">고객센터</a>
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
						<strong>상품관리</strong>
						<ul>
							<li><a
								href="<%= request.getContextPath() %>/admin/product/product_list.do">상품목록</a></li>
							<li><a
								href="<%= request.getContextPath() %>/admin/product/product_register.do">상품등록</a></li>
						</ul>
					</div>

					<div class="menu">
						<strong>회원관리</strong>
						<ul>
							<li><a
								href="<%= request.getContextPath() %>/admin/user/user_list.do">회원목록</a></li>
						</ul>
					</div>
				</aside>

				<!-- 관리자 메인 콘텐츠 -->
				<section class="content">
					<h3>관리자 메인</h3>

					<!-- 상품현황 -->
					<article class="status_box">
						<div class="status_title">
							<h4>상품현황</h4>
							<a
								href="<%= request.getContextPath() %>/admin/product/product_list.do">+
								더보기</a>
						</div>

						<table>
							<thead>
								<tr>
									<th>상품번호</th>
									<th>상품명</th>
									<th>구분</th>
									<th>가격</th>
									<th>재고</th>
									<th>등록일</th>
								</tr>
							</thead>

							<tbody>
								<%
                                if (products != null && !products.isEmpty()) {
                                    int productCount = Math.min(products.size(), 5);

                                    for (int i = 0; i < productCount; i++) {
                                        ProductDTO product = products.get(i);
                            %>
								<tr>
									<td><%= product.getProductno() %></td>
									<td><%= product.getProductname() %></td>
									<td><%= product.getProductcate() %></td>
									<td><%= df.format(product.getProductprice()) %>원</td>
									<td><%= product.getProductstock() %></td>
									<td><%= product.getRdate() %></td>
								</tr>
								<%
                                    }
                                } else {
                            %>
								<tr>
									<td colspan="6">등록된 상품이 없습니다.</td>
								</tr>
								<%
                                }
                            %>
							</tbody>
						</table>
					</article>

					<!-- 회원현황 -->
					<article class="status_box">
						<div class="status_title">
							<h4>회원현황</h4>
							<a href="<%= request.getContextPath() %>/admin/user/user_list.do">+
								더보기</a>
						</div>

						<table>
							<thead>
								<tr>
									<th>회원아이디</th>
									<th>이름</th>
									<th>닉네임</th>
									<th>휴대폰</th>
									<th>이메일</th>
									<th>등급</th>
									<th>회원가입일</th>
								</tr>
							</thead>

							<tbody>
								<%
                                if (members != null && !members.isEmpty()) {
                                    int memberCount = Math.min(members.size(), 5);

                                    for (int i = 0; i < memberCount; i++) {
                                        MemberDTO member = members.get(i);
                            %>
								<tr>
									<td><%= member.getMemberid() %></td>
									<td><%= member.getMembername() %></td>
									<td><%= member.getMembernick() %></td>
									<td><%= member.getMemberhp() %></td>
									<td><%= member.getMemberemail() %></td>
									<td><%= member.getMemberrole() %></td>
									<td><%= member.getRdate() %></td>
								</tr>
								<%
                                    }
                                } else {
                            %>
								<tr>
									<td colspan="7">등록된 회원이 없습니다.</td>
								</tr>
								<%
                                }
                            %>
							</tbody>
						</table>
					</article>

				</section>
			</div>
		</main>

		<!-- 푸터 -->
		<footer>
			<p>FARMSTORY ADMINISTRATOR Version 1.0.1</p>
			<p>Copyrightⓒ 김철학(개발에반하다.) All rights reserved.</p>
		</footer>
	</div>

</body>

</html>