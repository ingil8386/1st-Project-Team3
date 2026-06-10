<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
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

                    <p class="sort">
                        <a href="#" class="on">장바구니 전체(10)</a>
                    </p>
                    
                    <table border="0" class="cart-table">
                        <thead>
                            <tr>
                                <th><input type="checkbox" name="all"></th>
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
                            <tr>
                                <td><input type="checkbox" name=""></td>
                                <td>
                                    <a href="/farmstory/market/detail.do"><img src="/farmstory/images/market_item1.jpg" class="thumb" alt="사과 500g"></a>
                                </td>
                                <td>과일</td>
                                <td><a href="/farmstory/market/detail.do">사과 500g</a></td>
                                <td>1</td>
                                <td>10%</td>
                                <td>40P</td>
                                <td>4,000</td>
                                <td><strong>3,600</strong>원</td>    
                            </tr>
                            <tr>
                                <td><input type="checkbox" name=""></td>
                                <td>
                                    <a href="/farmstory/market/detail.do"><img src="/farmstory/images/market_item1.jpg" class="thumb" alt="사과 500g"></a>
                                </td>
                                <td>과일</td>
                                <td><a href="/farmstory/market/detail.do">사과 500g</a></td>
                                <td>1</td>
                                <td>10%</td>
                                <td>40P</td>
                                <td>4,000</td>
                                <td><strong>3,600</strong>원</td>    
                            </tr>
                        </tbody>        
                    </table>
                    
                    <input type="button" name="del" value="선택삭제" class="btnDel">

                    <div class="cart-total-box">        
                        <table border="0" class="total-table">
                            <caption>전체합계</caption>            
                            <tbody>
                                <tr>
                                    <th>상품수</th>
                                    <td>1개</td>
                                </tr>
                                <tr>
                                    <th>상품금액</th>
                                    <td>27,000원</td>
                                </tr>
                                <tr>
                                    <th>할인금액</th>
                                    <td>5,000원</td>
                                </tr>
                                <tr>
                                    <th>배송비</th>
                                    <td class="delivery">0원</td>
                                </tr>
                                <tr>
                                    <th>포인트</th>
                                    <td>400원</td>
                                </tr>
                                <tr class="final-row">
                                    <th>전체주문금액</th>
                                    <td class="total">22,000원</td>
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
</body>
</html>