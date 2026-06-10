<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%-- 상단 공통 헤더 불러오기 --%>
<jsp:include page="/WEB-INF/views/common/_head.jsp" />
<head>
    <meta charset="UTF-8">
    <title>팜스토리::농작물이야기</title>
    <link rel="stylesheet" href="/farmstory/css/story.css">
</head>
<body>
    <div id="container">
        <div id="sub">
            <div><img src="/farmstory/images/sub_top_tit3.png" alt="CROP TALK"></div>
            <section class="croptalk">
                <aside>
                    <img src="/farmstory/images/sub_aside_cate3_tit.png" alt="농작물이야기"/>

                    <ul class="lnb">
                        <li class="on"><a href="/farmstory/story/intro.do">농작물이야기</a></li>
                        <li ><a href="/farmstory/story/garden.do">텃밭가꾸기</a></li>
                        <li ><a href="/farmstory/story/school.do">귀농학교</a></li>
                    </ul>

                </aside>
                <article id="board">
                    <nav>
                        <img src="/farmstory/images/sub_nav_tit_cate3_tit1.png" alt="농작물이야기"/>
                        <p>
                            HOME > 농작물이야기 > <em>농작물이야기</em>
                        </p>
                    </nav>

                    <!-- 게시판 글목록/글쓰기/글보기/글수정 내용 시작 -->                    
                    <section class="list">
                        <nav>
                            <h1>글목록</h1>
                            <form action="#">
                                <input type="text" name="search" placeholder="제목 키워드, 글쓴이 검색">
                                <input type="submit" value="검색">
                            </form>
                        </nav>
                                        
                        <table border="0">                    
                            <tr>
                                <th>번호</th>
                                <th>제목</th>
                                <th>글쓴이</th>
                                <th>날짜</th>
                                <th>조회</th>
                            </tr>                    
                            <tr>
                                <td>3</td>
                                <td><a href="./view.do">농작물 이야기 게시물입니다.[3]</a></td>
                                <td>길동이</td>
                                <td>20-05-12</td>
                                <td>12</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td><a href="./view.do">농작물 이야기 게시물입니다.[3]</a></td>
                                <td>길동이</td>
                                <td>20-05-12</td>
                                <td>12</td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td><a href="./view.do">농작물 이야기 게시물입니다.[3]</a></td>
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
        
                        <a href="./write.do" class="btn btnWrite">글쓰기</a>                        
                    </section>
                    <!-- 내용 끝 -->

                </article>
            </section>

        </div>
		<%-- 하단 공통 푸터 불러오기 --%>
		<jsp:include page="/WEB-INF/views/common/_tail.jsp" />
    </div>    
</body>
</html>
