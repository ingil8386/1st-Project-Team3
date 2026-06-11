<%@ page contentType="text/html;charset=UTF-8" language="java"
	pageEncoding="UTF-8"%>
<%@ page import="DTO.ProductDTO"%>
<%@ page import="java.text.DecimalFormat"%>

<%
    ProductDTO product = (ProductDTO) request.getAttribute("product");
    DecimalFormat df = new DecimalFormat("#,###");

    if (product == null) {
        response.sendRedirect(request.getContextPath() + "/market/list.do");
        return;
    }

    String img = product.getProductimg();
    if (img == null || img.trim().isEmpty()) {
        img = request.getContextPath() + "/images/market_item1.jpg";
    }

    int finalPrice = product.getProductfinalprice();
    if (finalPrice <= 0) {
        finalPrice = product.getProductprice() - (product.getProductprice() * product.getProductdiscount() / 100);
    }
%>
<!DOCTYPE html>
<html lang="ko">
<jsp:include page="/WEB-INF/views/common/_head.jsp" />
<head>
<meta charset="UTF-8">
<title>팜스토리::상품상세</title>
<link rel="stylesheet"
	href="<%= request.getContextPath() %>/css/detail.css">
<script>
        function updateTotal() {
            const countInput = document.querySelector('input[name="count"]');
            const totalEl = document.querySelector('.total');
            const price = <%= finalPrice %>;
            let count = parseInt(countInput.value);
            if (isNaN(count) || count < 1) {
                count = 1;
                countInput.value = 1;
            }
            totalEl.innerText = (price * count).toLocaleString() + '원';
        }

        document.addEventListener('DOMContentLoaded', function () {
            const countInput = document.querySelector('input[name="count"]');
            if (countInput) {
                countInput.addEventListener('input', updateTotal);
                countInput.addEventListener('change', updateTotal);
            }

            // 장바구니 버튼
            document.getElementById('btnCart').addEventListener('click', function (e) {
                e.preventDefault();
                const count = parseInt(document.querySelector('input[name="count"]').value) || 1;
                const form = document.getElementById('cartForm');
                form.querySelector('input[name="cartcount"]').value = count;
                form.submit();
            });

            // 바로구매 버튼
            document.getElementById('btnOrder').addEventListener('click', function (e) {
                e.preventDefault();
                const count = parseInt(document.querySelector('input[name="count"]').value) || 1;
                const form = document.getElementById('orderDirectForm');
                form.querySelector('input[name="cartcount"]').value = count;
                form.submit();
            });
        });
    </script>
</head>
<body>
	<div id="container">
		<div id="sub">
			<div>
				<img src="<%= request.getContextPath() %>/images/sub_top_tit2.png"
					alt="MARKET">
			</div>
			<section class="market">
				<aside>
					<img
						src="<%= request.getContextPath() %>/images/sub_aside_cate2_tit.png"
						alt="장보기">
					<ul class="lnb">
						<li class="on"><a
							href="<%= request.getContextPath() %>/market/list.do">장보기</a></li>
					</ul>
				</aside>

				<article class="view">
					<nav>
						<img
							src="<%= request.getContextPath() %>/images/sub_nav_tit_cate2_tit1.png"
							alt="장보기">
						<p>
							HOME &gt; 장보기 &gt; <em>장보기</em>
						</p>
					</nav>

					<h3>기본정보</h3>

					<div class="basic">
						<%-- 이미지에 고정 크기 강제 --%>
						<img src="<%= img %>" alt="<%= product.getProductname() %>"
							style="float: left; width: 270px; height: auto; border: 1px solid #eee; padding: 8px;  background: #fff;">

						<table border="0" style="float:right; width:454px; table-layout:fixed; word-break:break-all;">
							<tbody>
								<tr>
									<td>상품명</td>
									<td><%= product.getProductname() %></td>
								</tr>
								<tr>
									<td>상품코드</td>
									<td><%= product.getProductno() %></td>
								</tr>
								<tr>
									<td>상품종류</td>
									<td><%= product.getProductcate() %></td>
								</tr>
								<tr>
									<td>배송비</td>
									<td><span>무료</span> <em>3만원 이상 무료배송</em></td>
								</tr>
								<tr>
									<td>정상가격</td>
									<td><del><%= df.format(product.getProductprice()) %>원
										</del></td>
								</tr>
								<tr>
									<td>할인율</td>
									<td><%= product.getProductdiscount() %>%</td>
								</tr>
								<tr>
									<td>포인트</td>
									<td><%= df.format(product.getProductpoint()) %>P</td>
								</tr>
								<tr>
									<td>판매가격</td>
									<td><%= df.format(finalPrice) %>원</td>
								</tr>
								<tr>
									<td>재고</td>
									<td><%= product.getProductstock() %>개</td>
								</tr>
								<tr>
									<td>구매수량</td>
									<td><input type="number" name="count" min="1" value="1"></td>
								</tr>
								<tr>
									<td>합계</td>
									<td class="total"><%= df.format(finalPrice) %>원</td>
								</tr>
								<tr>
									<td colspan="2" style="padding-top: 10px; text-align: left;">
										<a href="#" id="btnCart" class="btn btnCart">장바구니</a> <a
										href="#" id="btnOrder" class="btn btnOrder"
										style="margin-left: 5px;">바로구매</a>
									</td>
								</tr>
							</tbody>
						</table>

						<div style="clear: both;"></div>

						<form id="cartForm"
							action="<%= request.getContextPath() %>/market/cart.do"
							method="post">
							<input type="hidden" name="action" value="add"> <input
								type="hidden" name="productno"
								value="<%= product.getProductno() %>"> <input
								type="hidden" name="cartcount" value="1">
						</form>
						<form id="orderDirectForm"
							action="<%= request.getContextPath() %>/market/cart.do"
							method="post">
							<input type="hidden" name="action" value="addAndOrder"> <input
								type="hidden" name="productno"
								value="<%= product.getProductno() %>"> <input
								type="hidden" name="cartcount" value="1">
						</form>
					</div>

					<h3>상품설명</h3>
					<div class="detail">
						<p style="line-height: 1.8;">
							<%= product.getProductcontent() == null || product.getProductcontent().trim().isEmpty()
                                ? "등록된 상품설명이 없습니다."
                                : product.getProductcontent().replace("\n", "<br>") %>
						</p>
					</div>

					<h3>배송정보</h3>
					<div class="delivery">
						<p>입금하신 이후 택배송장번호는 SMS(문자서비스)를 통해 고객님께 안내해드립니다.</p>
					</div>

					<h3>교환/반품</h3>
					<div class="exchange">
						<table border="0">
							<tbody>
								<tr>
									<td>교환 반품이 가능한 경우</td>
									<td>
										<ul>
											<li>팜스토리 상품에 하자가 있거나 불량인 경우</li>
											<li>채소, 과일, 양곡등의 식품은 만1일 이내</li>
											<li>기타 상품은 수령일로부터 영업일 기준 일주일 이내</li>
											<li>받으신 상품이 표시사항과 다른 경우에는 받으신 날로부터 일주일 이내</li>
										</ul>
									</td>
								</tr>
								<tr>
									<td>교환 반품이 불가능한 경우</td>
									<td>
										<ul>
											<li>신선 식품의 경우 단순히 마음에 들지 않는 경우</li>
											<li>단순 변심으로 상품이 가치가 훼손돼서 판매가 어려운 경우</li>
										</ul>
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