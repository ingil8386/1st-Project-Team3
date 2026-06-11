<%@ page contentType="text/html;charset=UTF-8" language="java"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<%@ page import="java.util.List"%>
<%@ page import="DTO.ProductDTO"%>
<%@ page import="java.text.DecimalFormat"%>

<%
List<ProductDTO> products = (List<ProductDTO>) request.getAttribute("products");
DecimalFormat df = new DecimalFormat("#,###");
%>

<!DOCTYPE html>
<html lang="ko">
<jsp:include page="/WEB-INF/views/common/_head.jsp" />
<head>
<meta charset="UTF-8">
<title>팜스토리 :: 장바구니</title>
<link rel="stylesheet" href="/farmstory/css/cart.css">
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

				<article class="cart">
					<nav>
						<img src="/farmstory/images/sub_nav_tit_cate2_tit1.png" alt="장보기">
						<p>
							HOME &gt; 장보기 &gt; <em>장보기</em>
						</p>
					</nav>

					<c:set var="totalCount" value="0" />
					<c:forEach var="cart" items="${cartList}">
						<c:set var="totalCount" value="${totalCount + cart.cartcount}" />
					</c:forEach>

					<p class="sort">
						<a href="#" class="on">장바구니 전체(${totalCount})</a>
					</p>

					<%-- 기존 deleteForm 교체 --%>
					<form id="deleteForm"
						action="${pageContext.request.contextPath}/market/cart.do"
						method="post">
						<input type="hidden" name="action" value="deleteSelected">
						<%-- 체크된 cartno들이 JS로 여기에 추가됨 --%>
					</form>

					<%-- 주문 form : 체크박스 name="cartno" 가 이 안에 있으므로 submit 시 자동 전송 --%>
					<form id="orderForm"
						action="${pageContext.request.contextPath}/market/order.do"
						method="post">

						<table border="0" class="cart-table">
							<thead>
								<tr>
									<th><input type="checkbox" id="checkAll"></th>
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
							<tbody>
								<%
								if (products != null && !products.isEmpty()) {
									for (int i = 0; i < products.size(); i++) {
										ProductDTO product = products.get(i);
										System.out.println(product.getProductimg());
										String img = product.getProductimg();
										if (img == null || img.trim().isEmpty()) {
									img = request.getContextPath() + "/images/market_item1.jpg";
										}
										request.setAttribute("currentImg", img);
										request.setAttribute("currentIndex", i);
								%>
								<c:set var="idx" value="${currentIndex}" />
								<c:forEach var="cart" items="${cartList}" varStatus="status">
									<c:if test="${status.index == idx}">
										<tr>
											<td><input type="checkbox" class="cartCheck"
												name="cartno" value="${cart.cartno}"></td>
											<td><a
												href="/farmstory/market/detail.do?productno=${cart.productno}">
													<img src="${currentImg}" class="thumb"
													alt="${cart.productname}">
											</a></td>
											<td>${cart.productcate}</td>
											<td><a
												href="/farmstory/market/detail.do?productno=${cart.productno}">
													${cart.productname} </a></td>
											<td>${cart.cartcount}</td>
											<td>-</td>
											<td>-</td>
											<td><fmt:formatNumber value="${cart.productprice}"
													pattern="#,###" />원</td>
											<td><strong><fmt:formatNumber
														value="${cart.totalprice}" pattern="#,###" /></strong>원</td>
										</tr>
									</c:if>
								</c:forEach>
								<%
									}
								} else {
								%>
								<tr>
									<td colspan="9">등록된 상품이 없습니다.</td>
								</tr>
								<%
								}
								%>
							</tbody>
						</table>

						<input type="button" value="선택삭제" class="btnDel"
							onclick="deleteSelected()">

						<div class="cart-total-box">
							<table border="0" class="total-table">
								<caption>전체합계</caption>
								<tbody>
									<tr>
										<th>상품수</th>
										<td>${totalCount}개</td>
									</tr>
									<c:set var="totalAmount" value="0" />
									<c:forEach var="cart" items="${cartList}">
										<c:set var="totalAmount"
											value="${totalAmount + cart.totalprice}" />
									</c:forEach>
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
										<th>배송비</th>
										<td class="delivery">0원</td>
									</tr>
									<tr>
										<th>포인트</th>
										<td>0원</td>
									</tr>
									<tr class="final-row">
										<th>전체주문금액</th>
										<td class="total"><fmt:formatNumber
												value="${totalAmount}" pattern="#,###" />원</td>
									</tr>
								</tbody>
							</table>
							<input type="button" class="btnOrder" value="주문하기"
								onclick="submitOrder()">
						</div>

					</form>

				</article>
			</section>
		</div>
		<jsp:include page="/WEB-INF/views/common/_tail.jsp" />
	</div>

	<script>
    document.getElementById('checkAll').addEventListener('change', function () {
        document.querySelectorAll('.cartCheck').forEach(cb => cb.checked = this.checked);
    });

    function submitOrder() {
        const checked = document.querySelectorAll('.cartCheck:checked');
        if (checked.length === 0) {
            alert('주문할 상품을 선택해주세요.');
            return;
        }
        document.getElementById('orderForm').submit();
    }

    let deleteQueue = [];

    function deleteSelected() {
        const checked = document.querySelectorAll('.cartCheck:checked');
        if (checked.length === 0) {
            alert('삭제할 항목을 선택해주세요.');
            return;
        }
        if (!confirm(checked.length + '개 항목을 삭제하시겠습니까?')) return;

        const form = document.getElementById('deleteForm');

        // 기존에 추가된 cartno input 제거
        form.querySelectorAll('input[name="cartno"]').forEach(el => el.remove());

        // 체크된 cartno 전부 hidden으로 추가
        checked.forEach(cb => {
            const input = document.createElement('input');
            input.type = 'hidden';
            input.name = 'cartno';
            input.value = cb.value;
            form.appendChild(input);
        });

        form.submit();
    }

    function processDelete() {
        if (deleteQueue.length === 0) return;
        document.getElementById('deleteCartno').value = deleteQueue.shift();
        document.getElementById('deleteForm').submit();
    }
</script>
</body>
</html>