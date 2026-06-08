<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>팜스토리 :: 장바구니</title>
    <link rel="stylesheet" href="/FarmStory/farmstory/src/main/webapp/css/cart.css">
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
                <li><a href="/farmstory/market/cart.do">장보기</a></li>
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