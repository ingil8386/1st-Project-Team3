<%@page import="DTO.ProductDTO"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<%@ page import="java.util.List"%>
<%@ page import="java.text.DecimalFormat"%>

<%@ page import="DTO.CartDTO"%>
<%
List<CartDTO> orderList = (List<CartDTO>) request.getAttribute("orderList");
DecimalFormat df = new DecimalFormat("#,###");
%>
<!DOCTYPE html>
<html lang="ko">
<jsp:include page="/WEB-INF/views/common/_head.jsp" />
<head>
<meta charset="UTF-8">
<title>팜스토리 :: 상품주문</title>
<link rel="stylesheet" href="/farmstory/css/order.css">
</head>
<body>
	<div id="container">


		<div id="sub">
			<div>
				<img src="/farmstory/images/sub_top_tit2.png" alt="MARKET">
			</div>
			<section class="market">
				<aside>
					<img src="/farmstory/images/sub_aside_cate2_tit.png" alt="장보기">
					<ul class="lnb">
						<li class="on"><a href="/farmstory/market/cart.do">장보기</a></li>
					</ul>
				</aside>

				<article class="order">
					<nav>
						<img src="/farmstory/images/sub_nav_tit_cate2_tit1.png" alt="장보기">
						<p>
							HOME &gt; 장보기 &gt; <em>장보기</em>
						</p>
					</nav>

					<p class="sort">
						<a href="#" class="on">주문상품 전체(${totalCount})</a>
					</p>

					<table border="0" class="order-table">
						<thead>
							<tr>
								<th>이미지</th>
								<th>종류</th>
								<th>상품명</th>
								<th>수량</th>
								<th>할인</th>
								<th>포인트</th>
								<th>가격</th>
								<th>소계</th>
							</tr>
						</thead>
						<tbody>
							<%
							if (orderList != null && !orderList.isEmpty()) {
								for (CartDTO cart : orderList) {
									String img = cart.getProductimg();
									if (img == null || img.trim().isEmpty()) {
								img = request.getContextPath() + "/images/market_item1.jpg";
									}
							%>
							<tr>
								<td><a
									href="/farmstory/market/detail.do?productno=<%=cart.getProductno()%>">
										<img src="<%=img%>" class="thumb"
										alt="<%=cart.getProductname()%>">
								</a></td>
								<td><%=cart.getProductcate()%></td>
								<td><a
									href="/farmstory/market/detail.do?productno=<%=cart.getProductno()%>">
										<%=cart.getProductname()%>
								</a></td>
								<td><%=cart.getCartcount()%></td>
								<td>-</td>
								<td>-</td>
								<td><%=df.format(cart.getProductprice())%>원</td>
								<td><strong><%=df.format(cart.getTotalprice())%></strong>원</td>
							</tr>
							<%
							}
							} else {
							%>
							<tr>
								<td colspan="8">등록된 상품이 없습니다.</td>
							</tr>
							<%
							}
							%>
						</tbody>
					</table>

					<div class="final">
						<table border="0" class="final-table" style="width: 320px;">
							<caption>최종결제정보</caption>
							<tbody>
								<tr>
									<th>상품수</th>
									<td>${totalCount}개</td>
								</tr>
								<tr>
									<th>상품금액</th>
									<td><fmt:formatNumber value="${totalAmount}"
											pattern="#,###" />원</td>
								</tr>
								<tr>
									<th>할인금액</th>
									<td>0원</td>
								</tr>
								<tr>
									<th>포인트사용</th>
									<td>0P</td>
								</tr>
								<tr>
									<th>배송비</th>
									<td class="delivery">0원</td>
								</tr>
								<tr>
									<th>포인트적립</th>
									<td>0P</td>
								</tr>
								<tr class="final-row">
									<th>전체주문금액</th>
									<td class="total"><fmt:formatNumber value="${totalAmount}"
											pattern="#,###" />원</td>
								</tr>
							</tbody>
						</table>
						<input type="submit" class="btnOrder" value="결제하기"
							style="width: 320px;">
					</div>

					<h3 class="order-title">주문정보 입력</h3>
					<div class="shipping">
						<table border="0">
							<tbody>
								<tr>
									<th>주문자</th>
									<td><input type="text" name="orderer" value="홍길동" readonly
										class="chk-input"></td>
								</tr>
								<tr>
									<th>휴대폰</th>
									<td><input type="text" name="orderer"
										value="010-1234-1001" readonly class="chk-input"></td>
								</tr>
								<tr>
									<th>포인트사용</th>
									<td class="point-td"><input type="text" name="pointUse"
										value="" class="short-input">
										<button type="button" class="btnInside">사용하기</button>
										<p class="point-desc">
											사용가능 <span>2,000</span> P
										</p></td>
								</tr>
								<tr>
									<th>받는분</th>
									<td><input type="text" name="receiver"
										class="normal-input"></td>
								</tr>
								<tr>
									<th>연락처</th>
									<td><input type="text" name="hp" class="normal-input"></td>
								</tr>
								<tr>
									<th>배송주소</th>
									<td class="addr-td">
										<div class="addr-row">
											<input type="text" name="zip" readonly class="short-input">
											<button type="button" id="btnZip" class="btnInside">우편번호
												검색</button>
										</div> <input type="text" name="addr1" placeholder="기본주소 검색"
										class="long-input"> <input type="text" name="addr2"
										placeholder="상세주소 입력" class="long-input">
									</td>
								</tr>
								<tr>
									<th>결제방법</th>
									<td class="pay-method"><label><input type="radio"
											name="payment">계좌이체</label> <label><input
											type="radio" name="payment">신용카드</label> <label><input
											type="radio" name="payment">체크카드</label> <label><input
											type="radio" name="payment">휴대폰</label></td>
								</tr>
								<tr>
									<th>기타</th>
									<td><textarea name="etc" class="etc-textarea"></textarea>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</article>
			</section>
		</div>
		<jsp:include page="/WEB-INF/views/common/_tail.jsp" />
	</div>
</body>
</html>