<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>팜스토리::상품상세</title>
    <link rel="stylesheet" href="/farmstory/css/detail.css">
</head>
<body>
    <div id="container">
        <header>
            <a href="/farmstory/index.do" class="logo"><img src="/farmstory/images/logo.png" alt="로고"></a>
            <p>
                <a href="/farmstory/index.do">HOME |</a>
                <a href="/farmstory/user/login.do">로그인 |</a>
                <a href="/farmstory/user/terms.do">회원가입 |</a>        
                <a href="#">나의정보 |</a>
                <a href="#">로그아웃 |</a>
                <a href="/farmstory/admin/admin.do">관리자 |</a>
                <a href="#">고객센터</a>
            </p>
            <img src="/farmstory/images/head_txt_img.png" alt="3만원 이상 무료배송" class="text">
            
            <ul class="gnb">
               <li><a href="/farmstory/about/greeting.do">팜스토리소개</a></li>
                <li><a href="/farmstory/market/detail.do">장보기</a></li>
                <li><a href="/farmstory/story/intro.do">농작물이야기</a></li>
                <li><a href="/farmstory/event/calendar.do">이벤트</a></li>
                <li><a href="/farmstory//community/notice.do">커뮤니티</a></li>
            </ul>
        </header>

        <div id="sub">
            <div><img src="/farmstory/images/sub_top_tit2.png" alt="MARKET"></div>
            <section class="market">
                <aside>
                    <img src="/farmstory/images/sub_aside_cate2_tit.png" alt="장보기">
                    <ul class="lnb">
                        <li class="on"><a href="/farmstory/market/list.do">장보기</a></li>
                    </ul>
                </aside>

                <article class="view">
                    <nav>
                        <img src="/farmstory/images/sub_nav_tit_cate2_tit1.png" alt="장보기">
                        <p>
                            HOME &gt; 장보기 &gt; <em>장보기</em>
                        </p>
                    </nav>

                    <h3>기본정보</h3>
                    <div class="basic">
                        <img src="/farmstory/images/market_item_thumb.jpg" alt="딸기 500g">

                        <table border="0">                            
                            <tbody>
                                <tr>
                                    <td>상품명</td>
                                    <td>딸기 500g</td>
                                </tr>
                                <tr>
                                    <td>상품코드</td>
                                    <td>01</td>
                                </tr>
                                <tr>
                                    <td>배송비</td>
                                    <td>
                                        <span>5,000</span>원
                                        <em>3만원 이상 무료배송</em>
                                    </td>
                                </tr>
                                <tr>
                                    <td>판매가격</td>
                                    <td>4,000원</td>
                                </tr>
                                <tr>
                                    <td>구매수량</td>
                                    <td>
                                        <input type="number" name="count" min="1" value="1">
                                    </td>
                                </tr>
                                <tr>
                                    <td>합계</td>
                                    <td class="total">4,000원</td>
                                </tr>
                            </tbody>
                        </table>

                        <div class="btn-group">
                            <a href="/farmstory/market/cart.jsp" id="btnCart" class="btn btnCart">장바구니</a>
                            <a href="/farmstory/market/order.jsp" id="btnOrder" class="btn btnOrder">바로구매</a>
                        </div>
                    </div>

                    <h3>상품설명</h3>
                    <div class="detail">
                        <img src="/farmstory/images/market_detail_sample.jpg" alt="상품 상세 설명">
                    </div>

                    <h3>배송정보</h3>
                    <div class="delivery">
                        <p>
                            입금하신 이후 택배송장번호는 SMS(문자서비스)를 통해 고객님께 안내해드립니다.
                        </p>
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
        
        <footer>
            <img src="/farmstory/images/footer_logo.png" alt="로고">
            <div>
                <p>
                    (주)팜스토리 / 사업자등록번호 123-45-67890 / 통신판매업신고 제 2013-팜스토리구-123호 / 벤처기업확인 서울지방중소기업청 제 012345678-9-01234호<br>
                    등록번호 팜스토리01234 (2013.04.01) / 발행인 : 홍길동<br>
                    대표 : 홍길동 / 이메일 : email@mail.mail / 전화 : 01) 234-5678 / 경기도 성남시 잘한다구 신난다동 345
                </p>
                <span class="copyright">Copyright(C)홍길동 All rights reserved.</span>
            </div>
        </footer>
    </div>    
</body>
</html>