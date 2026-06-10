<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<%-- 상단 공통 헤더 불러오기 --%>
<jsp:include page="/WEB-INF/views/common/_head.jsp" />

<head>
    <meta charset="UTF-8">
    <title>farmstory::findId</title>
    <link rel="stylesheet" href="/farmstory/css/common.css">
</head>

<body>
    <div id="container">
        <div id="user">
            <section class="login">
                <%-- 아이디 찾기 Form 전송 영역 --%>
                <form action="/farmstory/user/findId.do" method="post">
                    <table border="0">
			            <td colspan="2" style="padding-bottom: 20px; padding-right: 10px; font-weight: bold; font-size: 16px; text-align: right;">
			                아이디 찾기
			            </td>
                        <tr>
                            <%-- 로그인 아이콘들을 이름/이메일 안내용으로 직관적 매핑 --%>
                            <td><img src="/farmstory/images/user/login_ico_id.png" alt="이름" style="width:20px; vertical-align:middle;"></td>
                            <td><input type="text" name="membername" placeholder="이름 입력" required></td>
                        </tr>
                        <tr>
                            <td><img src="/farmstory/images/user/login_ico_pw.png" alt="이메일" style="width:20px; vertical-align:middle;"></td>
                            <td><input type="email" name="memberemail" placeholder="이메일 입력" required></td>
                        </tr>
                    </table>
                        <input type="submit" value="아이디찾기" class="btnLogin" style="width: 70px; margin-left: 100px; margin-top: 35px;" />
                </form>

                <%-- 💥 [요청 기능] 입력창 밑 동적 결과 노출 구역 --%>
                <c:if test="${not empty foundId}">
                    <%-- 아이디가 정상적으로 조회되었을 때 나타나는 박스 --%>
                    <div class="find-result-box" style="margin-top: 15px; padding: 15px; border: 1px solid #D1CAB2; background: #fdfdfb; text-align: center; border-radius: 4px;">
                        <p style="font-size: 12px; color: #555; margin: 0;">조회된 회원님의 아이디입니다.</p>
                        <strong style="display: block; margin-top: 8px; font-size: 16px; color: #91ba15; font-weight: bold; letter-spacing: 0.5px;">
                            ${foundId}
                        </strong>
                        <a href="/farmstory/user/login.do" style="display: inline-block; margin-top: 10px; padding: 5px 12px; background: #2e658a; color: #fff; border-radius: 3px; font-size: 11px;">로그인하러 가기</a>
                    </div>
                </c:if>
                
                <c:if test="${param.success eq 'fail'}">
                    <%-- 일치하는 데이터가 없어 실패 파라미터(?success=fail)를 받았을 때 나타나는 박스 --%>
                    <div class="find-result-box" style="margin-top: 15px; padding: 12px; border: 1px solid #f5c6cb; background: #f8d7da; text-align: center; border-radius: 4px;">
                        <p style="font-size: 12px; color: #721c24; margin: 0; font-weight: bold;">
                            🚨 일치하는 회원 정보가 없습니다.
                        </p>
                    </div>
                </c:if>

                <%-- 하단 정보 및 링크 영역 --%>
                <div>
                    <h3>아이디 찾기 안내</h3>
                    <p>
                        회원가입 시 등록한 이름과 이메일 주소를 입력해 주세요.
                    </p>
                    <div style="text-align: right;">
                        <a href="/farmstory/user/login.do">로그인 |</a>
                        <a href="/farmstory/user/findPass.do">비밀번호찾기 |</a>
                        <a href="/farmstory/user/terms.do">회원가입</a>|
                    </div>
                </div>
            </section>
            
            <%-- 하단 공통 푸터 불러오기 --%>
            <jsp:include page="/WEB-INF/views/common/_tail.jsp" />
        </div>
    </div>
</body>
</html>