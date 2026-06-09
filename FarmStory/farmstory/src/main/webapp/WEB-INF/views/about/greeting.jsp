<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>farmstory::main</title>
    <link rel="stylesheet" href="/farmstory/css/greeting.css">
</head>
<body>
    <div id="container">
        <header>
            <!-- 로고 -->
            <a href="/farmstory/index.do" class="logo"><img src="/farmstory/images/logo.png" alt="메인로고"/></a>
            
            <!-- 오른쪽 상단 메뉴 -->
            <p>
                <a href="/farmstory/index.do">HOME |</a>
                <a href="/farmstory/user/login.do">로그인</a>|
                <a href="/farmstory/user/terms.do">회원가입</a>|               
                <a href="#">나의정보 </a>|
                <a href="#">로그아웃 </a>|
                <a href="/farmstory/admin/admin.do">관리자 |</a>
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
        <div id="sub">
            <div>
                <img src="/farmstory/images/sub_top_tit1.png" alt="INTRODUCTION">
            </div>
<section class="introduce">
    <aside>
        <img src="/farmstory/images/sub_aside_cate1_tit.png" alt="팜스토리소개">

        <ul class="lnb">
            <li class="on">
                <a href="/farmstory/about/greeting.do">인사말</a>
            </li>

            <li>
                <a href="/farmstory/about/direction.do">찾아오시는 길</a>
            </li>
        </ul>       
    </aside>

<article>
    <nav>
        <img src="/farmstory/images/sub_nav_tit_cate1_tit1.png" alt="인사말">

        <p>
            <img src="/farmstory/images/sub_page_nav_ico.gif" alt="">
            HOME > 팜스토리소개 > <strong>인사말</strong>
        </p>
    </nav>

    <!-- 내용 시작 -->
    <img class="intro-img" src="/farmstory/images/sub_page1_article_txt.png" alt="건강한 먹거리를 위해 노력합니다.">

    <p>
        항상 저희 팜스토리를 성원해 주시고 관심을 가져주시는 모든 분들께 감사의 인사를 드리며<br>
        가정에 건강과 행복이 가득하시길 기원합니다.
    </p>

    <p>
        팜스토리는 신선하고 안전한 먹거리로 건강한 삶 만들기에 기여합니다.<br>
        보다 좋은 농산품을 공급하기 위해 화학비료를 쓰지 않는 건강한 흙에서 유기농업으로 정성을 다해 지은 농사를 통해 믿고 먹을 수 있는 먹거리 제공에 앞장서겠습니다.
    </p>

    <p>
        <strong>친환경 농장</strong><br>
        팜스토리는 경기도 이천에 위치한 10만평 규모의 유기농 재배단지입니다.
    </p>

    <p>
        <strong>친환경 캠페인</strong><br>
        팜스토리는 2차 포장재 사용을 줄임으로써 친환경적인 포장과, 친환경적인 소비문화 정착을 위해 노력합니다.
    </p>
</article>
</section>
        </div>

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