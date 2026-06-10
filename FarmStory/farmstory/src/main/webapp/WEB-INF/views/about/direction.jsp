<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<jsp:include page="/WEB-INF/views/common/_head.jsp" />
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>farmstory::main</title>
    <link rel="stylesheet" href="/farmstory/css/greeting.css">
</head>
<body>
    <div id="container">
        <div id="sub">
            <div>
                <img src="/farmstory/images/sub_top_tit1.png" alt="INTRODUCTION">
            </div>
<section class="introduce">
    <aside>
        <img src="/farmstory/images/sub_aside_cate1_tit.png" alt="팜스토리소개">

        <ul class="lnb">
            <li>
                <a href="/farmstory/about/greeting.do">인사말</a>
            </li>

            <li class="on">
                <a href="/farmstory/about/direction.do">찾아오시는 길</a>
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
<jsp:include page="/WEB-INF/views/common/_tail.jsp" />
    </div>
    
</body>
</html>