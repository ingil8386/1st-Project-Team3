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
        <div id="user">
            <section class="register">
                <form action="#">
                    <h2 class="tit">사이트 이용정보 입력</h2>
                    <table border="1">
                        <tr>
                            <td>아이디</td>
                            <td>
                                <input type="text" name="uid" placeholder="아이디 입력"/>
                                <button type="button"><img src="/farmstory/images/user/chk_id.gif" alt="중복확인"></button>
                                <span class="uidResult"></span>
                            </td>
                        </tr>
                        <tr>
                            <td>비밀번호</td>
                            <td><input type="password" name="pass1" placeholder="비밀번호 입력"/></td>
                        </tr>
                        <tr>
                            <td>비밀번호 확인</td>
                            <td><input type="password" name="pass2" placeholder="비밀번호 입력 확인"/></td>
                        </tr>
                    </table>
                    <h2 class="tit">개인정보 입력</h2>
                    <table border="1">
                        <tr>
                            <td>이름</td>
                            <td>
                                <input type="text" name="name" placeholder="이름 입력"/>
                            </td>
                        </tr>
                        <tr>
                            <td>별명</td>
                            <td>
                                <p class="nickInfo">공백없는 한글, 영문, 숫자 입력</p>
                                <input type="text" name="nick" placeholder="별명 입력"/>
                                <button><img src="/farmstory/images/user/chk_id.gif" alt="중복확인"></button>
                                <span class="nickResult"></span>
                            </td>
                        </tr>
                        <tr>
                            <td>이메일</td>
                            <td>
                                <input type="email" name="email" placeholder="이메일 입력"/>
                                <button><img src="/farmstory/images/user/chk_auth.gif" alt="인증번호 받기"></button>
                                <div class="auth">
                                    <input type="text" name="auth" id="인증번호 입력"/>
                                    <button><img src="/farmstory/images/user/chk_confirm.gif" alt="확인"></button>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>휴대폰</td>
                            <td><input type="text" name="hp" placeholder="휴대폰 입력"/></td>
                        </tr>
                        <tr>
                            <td>주소</td>
                            <td>
                                <input type="text" name="zip" placeholder="우편번호"/>
                                <button><img src="/farmstory/images/user/chk_post.gif" alt="우편번호찾기"></button>
                                <input type="text" name="addr1" placeholder="주소 검색"/>
                                <input type="text" name="addr2" placeholder="상세주소 입력"/>
                            </td>
                        </tr>
                    </table>

                    <div>
                        <a href="/farmstory/user/login.do" class="btn btnCancel">취소</a>
                        <input type="submit" value="회원가입" class="btn btnRegister"/>
                    </div>
                </form>

            </section>

        </div>
        
            

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


</body>

</html>
