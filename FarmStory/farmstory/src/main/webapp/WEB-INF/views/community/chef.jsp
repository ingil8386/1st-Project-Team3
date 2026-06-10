<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<jsp:include page="/WEB-INF/views/common/_head.jsp" />
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>팜스토리::나도요리사</title>
    <link rel="stylesheet" href="/farmstory/css/community.css"/>
</head>
<body>
    <div id="container">
        <div id="sub">
            <div><img src="/farmstory/images/sub_top_tit5.png" alt="COMMUNITY"></div>
            <section class="community">
                <aside>
                    <img src="/farmstory/images/sub_aside_cate5_tit.png" alt="커뮤니티"/>

                    <ul class="lnb">
                        <li><a href="/farmstory/community/notice.do">공지사항</a></li>
                        <li><a href="/farmstory/community/meal.do">오늘의식단</a></li>
                        <li class="on"><a href="/farmstory/community/chef.do">나도요리사</a></li>
                        <li><a href="/farmstory/community/qna.do">1:1고객문의</a></li>
                        <li><a href="/farmstory/community/faq.do">자주묻는질문</a></li>
                    </ul>

                </aside>
                <article id="board">
                    <nav>
                        <img src="/farmstory/images/sub_nav_tit_cate5_tit3.png" alt="나도요리사"/>
                        <p>
                            HOME > 커뮤니티 > <em>나도요리사</em>
                        </p>
                    </nav>

                    <!-- 게시판 글목록/글쓰기/글보기/글수정 내용 시작 -->
                    <section class="view">
                        <h1>글보기</h1>
                        <table border="0">                            
                            <tr>
                                <th>제목</th>
                                <td><input type="text" name="title" value="제목입니다." readonly/></td>
                            </tr>
                            <tr>
                                <th>파일</th>
                                <td>
                                    <p><a href="#">2021년 상반기 매출현황.xls</a>&nbsp;<span>7</span>회 다운로드</p>
                                    <p><a href="#">교육 운영 관리자료.hwp</a>&nbsp;<span>7</span>회 다운로드</p>
                                </td>
                            </tr>
                            <tr>
                                <th>내용</th>
                                <td>
                                    <textarea name="content" readonly>내용 샘플입니다.</textarea>
                                </td>
                            </tr>                    
                        </table>
                        
                        <div>
                            <a href="#" class="btn btnRemove">삭제</a>
                            <a href="./modify.html" class="btn btnModify">수정</a>
                            <a href="./list.html" class="btn btnList">목록</a>
                        </div>
        
                        <!-- 댓글목록 -->
                        <section class="commentList">
                            <h3>댓글목록</h3>                   
        
                            <article>
                                <span class="date">2024-05-20</span>
                                <span class="nick">길동이</span>
                                <p class="content">댓글 샘플 입니다.</p>                        
                                <div>
                                    <a href="#" class="remove">삭제</a>
                                    <a href="#" class="modify">수정</a>
                                </div>
                            </article>
        
                            <p class="empty">등록된 댓글이 없습니다.</p>
        
                        </section>
        
                        <!-- 댓글쓰기 -->
                        <section class="commentForm">
                            <h3>댓글쓰기</h3>
                            <form action="#">
                                <textarea name="content">댓글내용 입력</textarea>
                                <div>
                                    <a href="#" class="btn btnCancel">취소</a>
                                    <input type="submit" value="작성완료" class="btn btnComplete"/>
                                </div>
                            </form>
                        </section>        
                    </section> 
                    <!-- 내용 끝 -->

                </article>
            </section>

        </div>
		<jsp:include page="/WEB-INF/views/common/_tail.jsp" />
    </div>    
</body>
</html>