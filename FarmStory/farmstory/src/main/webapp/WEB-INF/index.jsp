<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>farmstory::main</title>
    <link rel="stylesheet" href="/farmstory/css/common.css">
</head>
<body>
    <div id="container">
        <header>
            <!-- 로고 -->
            <a href="/farmstory/index.do" class="logo"><img src="/farmstory/images/logo.png" alt="메인로고"/></a>
            
            <!-- 오른쪽 상단 메뉴 -->
            <p>
                <a href="/farmstory/index.do">HOME</a>|
                <a href="/farmstory/user/login.do">로그인</a>|
                <a href="/farmstory/user/terms.do">회원가입</a>|
                <a href="/farmstory/admin/admin.do">관리자</a>|
                <a href="#">고객센터</a>
            </p>

            <!-- 오른쪽 텍스트 배너 -->
            <img class="text" src="/farmstory/images/head_txt_img.png" alt="3만원이상 무료배송">

            <!-- 메인 메뉴(GNB) -->
            <ul class="gnb">
                <li><a href="/farmstory/about/greeting.do">팜스토리소개</a></li>
                <li><a href="/farmstory/market/list.do">장보기</a></li>
                <li><a href="/farmstory/story/intro.do">농작물이야기</a></li>
                <li><a href="/farmstory/event/calendar.do">이벤트</a></li>
                <li><a href="/farmstory/community/notice.do">커뮤니티</a></li>
            </ul>
        </header>
        <main>
            <div class="slider">
                <img class="slide-img" src="/farmstory/images/main_slide_img1.jpg" alt="메인 슬라이드 이미지">

                <img class="slide-tit" src="/farmstory/images/main_slide_img_tit.png" alt="사람과 자연을 사랑하는 팜스토리">

                <div class="banner">
                    <img class="banner-bg" src="/farmstory/images/main_banner_bg.jpg" alt="오픈기념 이벤트 배경">
                    <img class="banner-img" src="/farmstory/images/main_banner_img.png" alt="과일 이미지">
                    <img class="banner-tit" src="/farmstory/images/main_banner_tit.png" alt="팜스토리 오픈기념 30% 할인 이벤트">
                    <img class="banner-txt" src="/farmstory/images/main_banner_txt.png" alt="그랜드 오픈">
                </div>
            </div>

            <div class="market">
                <img class="market-tit" src="/farmstory/images/main_market_tit.png" alt="장보기">

                <section>
                    <article>
                        <a href="#"><img src="/farmstory/images/market_item1.jpg" alt="사과"></a>
                        <h4>과일</h4>
                        <h3>사과 500g</h3>
                        <p><del>4,000</del> <span>10%↓</span></p>
                        <strong>3,600원</strong>
                    </article>

                    <article>
                        <a href="#"><img src="/farmstory/images/market_item2.jpg" alt="배"></a>
                        <h4>과일</h4>
                        <h3>사과 500g</h3>
                        <p><del>4,000</del> <span>10%↓</span></p>
                        <strong>3,600원</strong>
                    </article>

                    <article>
                        <a href="#"><img src="/farmstory/images/market_item3.jpg" alt="방울토마토"></a>
                        <h4>과일</h4>
                        <h3>사과 500g</h3>
                        <p><del>4,000</del> <span>10%↓</span></p>
                        <strong>3,600원</strong>
                    </article>

                    <article>
                        <a href="#"><img src="/farmstory/images/market_item4.jpg" alt="딸기"></a>
                        <h4>과일</h4>
                        <h3>사과 500g</h3>
                        <p><del>4,000</del> <span>10%↓</span></p>
                        <strong>3,600원</strong>
                    </article>

                    <article>
                        <a href="#"><img src="/farmstory/images/market_item5.jpg" alt="오렌지"></a>
                        <h4>과일</h4>
                        <h3>사과 500g</h3>
                        <p><del>4,000</del> <span>10%↓</span></p>
                        <strong>3,600원</strong>
                    </article>

                    <article>
                        <a href="#"><img src="/farmstory/images/market_item6.jpg" alt="곡물"></a>
                        <h4>과일</h4>
                        <h3>사과 500g</h3>
                        <p><del>4,000</del> <span>10%↓</span></p>
                        <strong>3,600원</strong>
                    </article>
                </section>
            </div>

            <div class="quick">
                <a href="#"><img src="/farmstory/images/main_banner_sub1_tit.png" alt="오늘의 식단"></a>
                <a href="#"><img src="/farmstory/images/main_banner_sub2_tit.png" alt="나도 요리사"></a>                
            </div>
            <div class="latest">
                <article>
                    <a href="#"><img src="/farmstory/images/main_latest1_tit.png" alt="텃밭가꾸기"></a>
                    <img src="/farmstory/images/main_latest1_img.jpg" alt="텃밭가꾸기">
                    <table border="0">
                        <tr>
                            <td>></td>
                            <td>
                                <a href="#">토마토! 건강하게 길러서 맛있게 드세요.</a>
                            </td>
                            <td>26-11-05</td>
                        </tr>
                        <tr>
                            <td>></td>
                            <td>
                                <a href="#">토마토! 건강하게 길러서 맛있게 드세요.</a>
                            </td>
                            <td>26-11-05</td>
                        </tr>
                        <tr>
                            <td>></td>
                            <td>
                                <a href="#">토마토! 건강하게 길러서 맛있게 드세요.</a>
                            </td>
                            <td>26-11-05</td>
                        </tr>
                        <tr>
                            <td>></td>
                            <td>
                                <a href="#">토마토! 건강하게 길러서 맛있게 드세요.</a>
                            </td>
                            <td>26-11-05</td>
                        </tr>
                        <tr>
                            <td>></td>
                            <td>
                                <a href="#">토마토! 건강하게 길러서 맛있게 드세요.</a>
                            </td>
                            <td>26-11-05</td>
                        </tr>
                    </table>

                </article>
                <article>
                    <a href="#"><img src="/farmstory/images/main_latest2_tit.png" alt="귀농학교"></a>
                    <img src="/farmstory/images/main_latest2_img.jpg" alt="귀농학교">
                    <table border="0">
                        <tr>
                            <td>></td>
                            <td>
                                <a href="#">토마토! 건강하게 길러서 맛있게 드세요.</a>
                            </td>
                            <td>26-11-05</td>
                        </tr>
                        <tr>
                            <td>></td>
                            <td>
                                <a href="#">토마토! 건강하게 길러서 맛있게 드세요.</a>
                            </td>
                            <td>26-11-05</td>
                        </tr>
                        <tr>
                            <td>></td>
                            <td>
                                <a href="#">토마토! 건강하게 길러서 맛있게 드세요.</a>
                            </td>
                            <td>26-11-05</td>
                        </tr>
                        <tr>
                            <td>></td>
                            <td>
                                <a href="#">토마토! 건강하게 길러서 맛있게 드세요.</a>
                            </td>
                            <td>26-11-05</td>
                        </tr>
                        <tr>
                            <td>></td>
                            <td>
                                <a href="#">토마토! 건강하게 길러서 맛있게 드세요.</a>
                            </td>
                            <td>26-11-05</td>
                        </tr>
                    </table>

                </article>
                <article>
                    <a href="#"><img src="/farmstory/images/main_latest3_tit.png" alt="농작물이야기"></a>
                    <img src="/farmstory/images/main_latest3_img.jpg" alt="농작물이야기">
                    <table border="0">
                        <tr>
                            <td>></td>
                            <td>
                                <a href="#">토마토! 건강하게 길러서 맛있게 드세요.</a>
                            </td>
                            <td>26-11-05</td>
                        </tr>
                        <tr>
                            <td>></td>
                            <td>
                                <a href="#">토마토! 건강하게 길러서 맛있게 드세요.</a>
                            </td>
                            <td>26-11-05</td>
                        </tr>
                        <tr>
                            <td>></td>
                            <td>
                                <a href="#">토마토! 건강하게 길러서 맛있게 드세요.</a>
                            </td>
                            <td>26-11-05</td>
                        </tr>
                        <tr>
                            <td>></td>
                            <td>
                                <a href="#">토마토! 건강하게 길러서 맛있게 드세요.</a>
                            </td>
                            <td>26-11-05</td>
                        </tr>
                        <tr>
                            <td>></td>
                            <td>
                                <a href="#">토마토! 건강하게 길러서 맛있게 드세요.</a>
                            </td>
                            <td>26-11-05</td>
                        </tr>
                    </table>

                </article>
                
            </div>
<div class="info">
    <article class="cs">
        <img class="tit" src="/farmstory/images/main_sub2_cs_tit.png" alt="고객센터안내">
        <img class="tel-img" src="/farmstory/images/main_sub2_cs_img.png" alt="전화기">
        <img class="tel-txt" src="/farmstory/images/main_sub2_cs_txt.png" alt="1666-777">

        <p>
            평일: AM 09:00 ~ PM 06:00<br>
            점심: PM 12:00 ~ PM 01:00<br>
            토, 일요일, 공휴일 휴무
        </p>

        <a href="#"><img src="/farmstory/images/main_sub2_cs_bt1.png" alt="1:1 고객문의"></a>
        <a href="#"><img src="/farmstory/images/main_sub2_cs_bt2.png" alt="자주묻는 질문"></a>
        <a href="#"><img src="/farmstory/images/main_sub2_cs_bt3.png" alt="배송 조회"></a>
    </article>

    <article class="account">
        <img class="tit" src="/farmstory/images/main_sub2_account_tit.png" alt="계좌안내">

        <p>
            기업은행 123-456789-01-01-012<br>
            국민은행 01-1234-56789<br>
            우리은행 123-456789-01-01-012<br>
            하나은행 123-456789-01-01<br>
            예 금 주 (주)팜스토리
        </p>
    </article>

    <article class="notice">
        <img class="tit" src="/farmstory/images/main_sub2_notice_tit.png" alt="공지사항">

                    <table>
                        <tr>
                            <td>·</td>
                            <td><a href="/farmstory/community/notice.do">안녕하세요. 홈페이지 오픈 기념 이벤트를 ...</a></td>
                            <td>20-12-22</td>
                        </tr>
                        <tr>
                            <td>·</td>
                            <td><a href="/farmstory/community/notice.do">안녕하세요. 홈페이지 오픈 기념 이벤트를 ...</a></td>
                            <td>20-12-22</td>
                        </tr>
                        <tr>
                            <td>·</td>
                            <td><a href="/farmstory/community/notice.do">안녕하세요. 홈페이지 오픈 기념 이벤트를 ...</a></td>
                            <td>20-12-22</td>
                        </tr>
                        <tr>
                            <td>·</td>
                            <td><a href="/farmstory/community/notice.do">안녕하세요. 홈페이지 오픈 기념 이벤트를 ...</a></td>
                            <td>20-12-22</td>
                        </tr>
                        <tr>
                            <td>·</td>
                            <td><a href="/farmstory/community/notice.do">안녕하세요. 홈페이지 오픈 기념 이벤트를 ...</a></td>
                            <td>20-12-22</td>
                        </tr>
                    </table>
                </article>
            </div>
        </main>
<footer>
    <img src="/farmstory/images/footer_logo.png" alt="팜스토리 로고">

    <div>
        <p>
            (주)팜스토리 / 사업자등록번호 123-45-67890 / 통신판매업신고 제 2013-부산진구-123호 / 벤처기업확인 서울지방중소기업청 제 012345678-9-01234호<br>
            등록번호 팜스토리01234 (2013.04.01) / 발행인 : 홍길동<br>
            대표 : 김철학 / 이메일 : chhak0503@gmail.com / 전화 : 01) 234-5678 / 부산광역시 부산진구 부전동 123
            <span class="copyright">
                copyrightⓒ 김철학(개발에반하다) All rights reserved.
            </span>
            <span class="version">
                farmstory ver1.0.1
            </span>
        </p>
    </div>
</footer>
    </div>
    
</body>
</html>
