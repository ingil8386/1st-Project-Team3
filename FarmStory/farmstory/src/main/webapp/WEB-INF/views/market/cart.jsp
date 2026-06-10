<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
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
            <div><img src="/farmstory/images/sub_top_tit2.png" alt="MARKET"></div>
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

                   <%-- 총 수량 - 수량 합계로 변경 --%>
					<c:set var="totalCount" value="0"/>
							<c:forEach var="cart" items="${cartList}">
							    <c:set var="totalCount" value="${totalCount + cart.cartcount}"/>
							</c:forEach>
						<p class="sort">
						    <a href="#" class="on">장바구니 전체(${totalCount})</a>
						</p>
                    
                    <%-- 삭제 form - action=delete로 컨트롤러 연동 --%>
					<form id="deleteForm" action="${pageContext.request.contextPath}/market/cart.do" method="post">
					    <input type="hidden" name="action" value="delete">
					    <input type="hidden" name="cartno" id="deleteCartno">
					</form>
                    
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
					        <c:forEach var="cart" items="${cartList}">
					        <tr>
					        	<td><input type="checkbox" class="cartCheck" name="cartno" value="${cart.cartno}"></td>
					           
					            <td>
					                <a href="/farmstory/market/detail.do?productno=${cart.productno}">
					                    <img src="/farmstory/images/${cart.productimg}" class="thumb" alt="${cart.productname}">
					                </a>
					            </td>
					            <td>${cart.productcate}</td>
					            <td><a href="/farmstory/market/detail.do?productno=${cart.productno}">${cart.productname}</a></td>
					            <td>${cart.cartcount}</td>
					            <td>-</td>
					            <td>-</td>
					            <td><fmt:formatNumber value="${cart.productprice}" pattern="#,###"/>원</td>
					            <td><strong><fmt:formatNumber value="${cart.totalprice}" pattern="#,###"/></strong>원</td>
					        </tr>
					        </c:forEach>
    					</tbody>     
                    </table>
                    
                     <%-- 선택삭제 버튼 --%>
                    <input type="button" value="선택삭제" class="btnDel" onclick="deleteSelected()">

                    <div class="cart-total-box">        
				    <table border="0" class="total-table">
				        <caption>전체합계</caption>            
				        <tbody>
				            <tr>
				                <th>상품수</th>
				                <td>${cartList.size()}개</td>
					        </tr>
					            <tr>
				                <th>상품금액</th>
				                <c:set var="totalAmount" value="0"/>
				                <c:forEach var="cart" items="${cartList}">
				                    <c:set var="totalAmount" value="${totalAmount + cart.totalprice}"/>
				                </c:forEach>
				                <td><fmt:formatNumber value="${totalAmount}" pattern="#,###"/>원</td>
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
								<td class="total"><fmt:formatNumber value="${totalAmount}" pattern="#,###"/>원</td>
						            </tr>
						        </tbody>
						    </table>        
						    <input type="submit" class="btnOrder" value="주문하기">
						</div>
                    </article>
            </section>
        </div>
	<jsp:include page="/WEB-INF/views/common/_tail.jsp" />
    </div>    
     <script>
    // 전체 체크박스
    document.getElementById('checkAll').addEventListener('change', function() {
        document.querySelectorAll('.cartCheck').forEach(cb => cb.checked = this.checked);
    });

    // 개별 삭제 - action=delete로 cartno 넘김
    function deleteOne(cartno) {
        if (!confirm('삭제하시겠습니까?')) return;
        document.getElementById('deleteCartno').value = cartno;
        document.getElementById('deleteForm').submit();
    }

    // 선택삭제 - 체크된 항목 순서대로 하나씩 삭제
    const deleteQueue = [];
    function deleteSelected() {
        const checked = document.querySelectorAll('.cartCheck:checked');
        if (checked.length === 0) {
            alert('삭제할 항목을 선택해주세요.');
            return;
        }
        if (!confirm(checked.length + '개 항목을 삭제하시겠습니까?')) return;

        checked.forEach(cb => deleteQueue.push(cb.value));
        processDelete();
    }

    function processDelete() {
        if (deleteQueue.length === 0) return;
        document.getElementById('deleteCartno').value = deleteQueue.shift();
        document.getElementById('deleteForm').submit();
    }
</script>
</body>
</html>