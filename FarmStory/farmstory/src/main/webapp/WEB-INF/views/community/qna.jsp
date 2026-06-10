<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<jsp:include page="/WEB-INF/views/common/_head.jsp" />
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>팜스토리::고객센터</title>
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
                        <li><a href="/farmstory/community/notice.do">공지사항</a></li>
                        <li><a href="/farmstory/community/meal.do">오늘의식단</a></li>
                        <li><a href="/farmstory/community/chef.do">나도요리사</a></li>
                        <li class="on"><a href="/farmstory/community/qna.do">1:1고객문의</a></li>
                        <li><a href="/farmstory/community/faq.do">자주묻는질문</a></li>
                    </ul>

                </aside>
                <article id="board">
                    <nav>
                        <img src="/farmstory/images/sub_nav_tit_cate5_tit4.png" alt="1:1고객문의"/>
                        <p>
                            HOME > 커뮤니티 > <em>1:1고객문의</em>
                        </p>
                    </nav>

                    <!-- 게시판 글목록/글쓰기/글보기/글수정 내용 시작 -->
                    <section class="modify">
            
                        <h1>글수정</h1>
                        <form action="#">                            
                            <table border="0">                                
                                <tr>
                                    <th>제목</th>
                                    <td><input type="text" name="title" placeholder="제목을 입력하세요."/></td>
                                </tr>
                                <tr>
                                    <th>내용</th>
                                    <td>
                                        <textarea name="content"></textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <th>파일</th>
                                    <td>
                                        <p>
                                            최대 2개 파일 첨부 가능, 각 파일당 최대 10MB까지 가능
                                        </p>
                                        <input type="file" name="file1"/>
                                        <input type="file" name="file2"/>
                                    </td>
                                </tr>
                            </table>
                            
                            <div>
                                <a href="./view.jsp" class="btn btnCancel">취소</a>
                                <input type="submit" value="수정완료" class="btn btnComplete"/>
                            </div>
                        </form>
        
                    </section>

                    <!-- 내용 끝 -->

                </article>
            </section>

        </div>
		<jsp:include page="/WEB-INF/views/common/_tail.jsp" />
    </div>    
</body>
</html>