<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
            <a href="/farmstory/index.do" class="logo"><img src="/farmstory/images/logo.png" alt="메인로고" /></a>

            <!-- 오른쪽 상단 메뉴 -->
            <p>
                <a href="/farmstory/index.do">HOME</a>|
                <a href="/farmstory/user/login.do">로그인</a>|
                <a href="/farmstory/user/terms.do">회원가입</a>|
                <a href="#">나의 정보</a> |
                <a href="#">로그아웃</a> |
                <a href="/farmstory//admin/admin.do">관리자</a>|
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
        <div id="user">
            <section class="login">
                <form action="#">
                    <table border="0">
                        <tr>
                            <td><img src="/farmstory/images/user/login_ico_id.png" alt="아이디"></td>
                            <td><input type="text" name="userid" placeholder="아이디 입력"></td>
                        </tr>
                        <tr>
                            <td><img src="/farmstory/images/user/login_ico_pw.png" alt="비밀번호"></td>
                            <td><input type="password" name="pass" placeholder="비밀번호 입력"></td>
                        </tr>
                    </table>
                    <input type="submit" value="로그인" class="btnLogin" />
                </form>
                <div>
                    <h3>회원 로그인 안내</h3>
                    <p>
                        아직 회원이 아니시면 회원으로 가입하세요.
                    </p>
                    <div style="text-align: right;">
                        <a href="#">아이디 |</a>
                        <a href="#">비밀번호찾기 |</a>
                        <a href="/farmstory/user/terms.do">회원가입</a>|
                    </div>
                </div>
            </section>
           

            <!-- 여기부터 페이지별 section -->

            <footer>
                <img src="/farmstory/images/footer_logo.png" alt="팜스토리 로고">

                <div>
                    <p>
                        (주)팜스토리 / 사업자등록번호 123-45-67890 / 통신판매업신고 제 2013-부산진구-123호 / 벤처기업확인 서울지방중소기업청 제
                        012345678-9-01234호<br>
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
