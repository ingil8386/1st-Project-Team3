<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<jsp:include page="/WEB-INF/views/common/_head.jsp" />
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>팜스토리::공지사항</title>
    <link rel="stylesheet" href="/farmstory/css/community.css"/>
</head>
<body>
    <div id="container">
        <div id="sub">
            <div><img src="/farmstory/images/sub_top_tit5.png"COMMUNITY"></div>
            <section class="community">
                <aside>
                    <img src="/farmstory/images/sub_aside_cate5_tit.png" alt="커뮤니티"/>

                    <ul class="lnb">
                        <li class="on"><a href="/farmstory/community/notice.do">공지사항</a></li>
                        <li><a href="/farmstory/community/meal.do">오늘의식단</a></li>
                        <li><a href="/farmstory/community/chef.do">나도요리사</a></li>
                        <li><a href="/farmstory/community/qna.do">1:1고객문의</a></li>
                        <li><a href="/farmstory/community/faq.do">자주묻는질문</a></li>
                    </ul>

                </aside>
                <article id="board">
                    <nav>
                        <img src="/farmstory/images/sub_nav_tit_cate5_tit1.png" alt="공지사항"/>
                        <p>
                            HOME > 커뮤니티 > <em>공지사항</em>
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
                                <td><a href="./view.do">공지사항 게시물입니다.[3]</a></td>
                                <td>길동이</td>
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
        
                        <a href="./write.jsp" class="btn btnWrite">글쓰기</a>                        
                    </section>
                    <!-- 내용 끝 -->

                </article>
            </section>

        </div>
		<jsp:include page="/WEB-INF/views/common/_tail.jsp" />
    </div>    
</body>
</html>