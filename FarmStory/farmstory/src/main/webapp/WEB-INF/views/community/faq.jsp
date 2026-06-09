<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>팜스토리::자주묻는질문</title>
    <link rel="stylesheet" href="/farmstory/css/community.css"/>
</head>
<body>
    <div id="container">
        <header>
            <a href="/farmstory/index.do" class="logo"><img src="/farmstory/images/logo.png" alt="로고"/></a>
            <p>
                <a href="/farmstory/index.do">HOME |</a>
                <a href="/farmstory/user/login.do">로그인</a>|
                <a href="/farmstory/user/terms.do">회원가입</a>|               
                <a href="#">나의정보 </a>|
                <a href="#">로그아웃 </a>|
                <a href="/farmstory/admin/admin.do">관리자 |</a>
                <a href="#">고객센터</a>
            </p>
            <img src="/farmstory/images/head_txt_img.png" alt="3만원 이상 무료배송"/>
            
            <ul class="gnb">
                <li><a href="/farmstory/about/greeting.do">팜스토리소개</a></li>
                <li><a href="/farmstory/market/list.do"><img src="/farmstory/images/head_menu_badge.png" alt="30%"/>장바구니</a></li>
                <li><a href="/farmstory/story/intro.do">농작물이야기</a></li>
                <li><a href="/farmstory/event/calendar.do">이벤트</a></li>
                <li><a href="/farmstory/community/notice.do">커뮤니티</a></li>
            </ul>
        </header>

        <div id="sub">
            <div><img src="/farmstory/images/sub_top_tit5.png"COMMUNITY"></div>
            <section class="community">
                <aside>
                    <img src="/farmstory/images/sub_aside_cate5_tit.png" alt="커뮤니티"/>

                    <ul class="lnb">
                        <li><a href="/farmstory/community/notice.do">공지사항</a></li>
                        <li><a href="/farmstory/community/meal.do">오늘의식단</a></li>
                        <li><a href="/farmstory/community/chef.do">나도요리사</a></li>
                        <li><a href="/farmstory/community/qna.do">1:1고객문의</a></li>
                        <li class="on"><a href="/farmstory/community/faq.do">자주묻는질문</a></li>
                    </ul>

                </aside>
                <article id="board">
                    <nav>
                        <img src="/farmstory/images/sub_nav_tit_cate5_tit5.png" alt="자주묻는질문"/>
                        <p>
                            HOME > 커뮤니티 > <em>자주묻는질문</em>
                        </p>
                    </nav>

                    <!-- 게시판 글목록/글쓰기/글보기/글수정 내용 시작 -->
                    <section class="list">
                        <nav>                            
                            <form action="#">
                                <input type="text" name="search" placeholder="제목 키워드, 글쓴이 검색">
                                <input type="submit" value="검색">
                            </form>
                        </nav>
                             
                        <h1>글목록</h1>
                        <table border="0">                    
                            <tr>
                                <th>번호</th>
                                <th>제목</th>
                                <th>글쓴이</th>
                                <th>날짜</th>
                                <th>조회</th>
                            </tr>                    
                            <tr>
                                <td>1</td>
                                <td><a href="./view.do">반품은 어떻게 해야하나요?</a></td>
                                <td>관리자</td>
                                <td>20-05-12</td>
                                <td>12</td>
                            </tr>
                        </table>
        
                        <div class="page">
                            <a href="#" class="prev">이전</a>
                            <a href="#" class="num current">1</a>
                            <a href="#" class="num">2</a>
                            <a href="#" class="num">3</a>
                            <a href="#" class="next">다음</a>
                        </div>
        
                        <a href="./write.do" class="btn btnWrite">글쓰기</a>                        
                    </section>
                    <!-- 내용 끝 -->

                </article>
            </section>

        </div>
        
        
        <footer>
            <img src="/farmstory/images/footer_logo.png" alt="로고"/>
            <p>
                (주)팜스토리 / 사업자등록번호 123-45-67890 / 통신판매업신고 제 2013-팜스토리구-123호 / 벤처기업확인 서울지방중소기업청 제 012345678-9-01234호<br />
                등록번호 팜스토리01234 (2013.04.01) / 발행인 : 홍길동<br />
                대표 : 홍길동 / 이메일 : email@mail.mail / 전화 : 01) 234-5678 / 경기도 성남시 잘한다구 신난다동 345<br />
                <em>Copyright(C)홍길동 All rights reserved.</em>
            </p>
        </footer>
    </div>    
</body>
</html>