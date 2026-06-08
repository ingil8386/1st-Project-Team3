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
            <a href="/farmstory/index.html" class="logo"><img src="/farmstory/images/logo.png" alt="메인로고"/></a>
            
            <!-- 오른쪽 상단 메뉴 -->
            <p>
                <a href="/farmstory/index.html">HOME</a>|
                <a href="/farmstory/user/login.html">로그인</a>|
                <a href="/farmstory/user/terms.html">회원가입</a>|
                <a href="/farmstory/admin/admin.html">관리자</a>|
                <a href="#">고객센터</a>
            </p>

            <!-- 오른쪽 텍스트 배너 -->
            <img class="text" src="/farmstory/images/head_txt_img.png" alt="3만원이상 무료배송">

            <!-- 메인 메뉴(GNB) -->
            <ul class="gnb">
                <li><a href="/farmstory/about/greeting.jsp">팜스토리소개</a></li>
                <li><a href="/farmstory/market/">장보기</a></li>
                <li><a href="/farmstory/story/intro.html">농작물이야기</a></li>
                <li><a href="/farmstory/event/calendar.html">이벤트</a></li>
                <li><a href="/farmstory//community/notice.html">커뮤니티</a></li>
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
            <li>
                <a href="/farmstory/about/greeting.html">인사말</a>
            </li>

            <li class="on">
                <a href="/farmstory/about/direction.html">찾아오시는 길</a>
            </li>
        </ul>       
    </aside>

    <article>
        <nav>
            <img src="/farmstory/images/sub_nav_tit_cate1_tit2.png"" alt="찾아오시는길">

            <p>
                HOME > 팜스토리소개 >
                <strong>찾아오시는길</strong>
            </p>
        </nav> 

        <div class="content">
            <p>
                <strong>팜스토리</strong><br>
                주소 : 경기도 이천시 잘한다구 신난다동 123<br>
                전화 : 01-234-5678
            </p>

            <p class="map-title">
                <strong>찾아오시는길</strong>
            </p>

            <div id="daumRoughmapContainer1668214668575"
                class="root_daum_roughmap root_daum_roughmap_landing"></div>

            <script charset="UTF-8"
                    class="daum_roughmap_loader_script"
                    src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>

            <script charset="UTF-8"
                    src="https://t1.kakaocdn.net/kakaomapweb/roughmap/place/prod/207038f2_1774248312945/roughmapLander.js"></script>

            <script charset="UTF-8">
                new daum.roughmap.Lander({
                    "timestamp": "1668214668575",
                    "key": "2ci7x",
                    "mapWidth": "760",
                    "mapHeight": "400"
                }).render();
            </script>
        </div>
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