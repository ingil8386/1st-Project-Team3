<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>farmstory::비밀번호 찾기</title>
    <link rel="stylesheet" href="/farmstory/css/common.css">
</head>
<body>
    <div id="container">
        <jsp:include page="/WEB-INF/views/common/_head.jsp" />
        <div id="user">
            <section class="login">

                
                <%-- 결과 메시지 출력 영역 (findId와 동일한 스타일 적용) --%>
                <c:if test="${not empty result}">
                    <div class="find-result-box" style="margin-bottom: 15px; padding: 12px; border: 1px solid ${result eq 'fail' ? '#f5c6cb' : '#D1CAB2'}; background: ${result eq 'fail' ? '#f8d7da' : '#fdfdfb'}; text-align: center; border-radius: 4px;">
                        <p style="font-size: 12px; color: ${result eq 'fail' ? '#721c24' : '#555'}; margin: 0; font-weight: bold;">
                            <c:choose>
                                <c:when test="${result eq 'fail'}">🚨 일치하는 회원 정보가 없습니다. 다시 확인해 주세요.</c:when>
                                <c:otherwise>✅ 입력하신 이메일로 임시 비밀번호가 발송되었습니다.</c:otherwise>
                            </c:choose>
                        </p>
                    </div>
                </c:if>

<form action="<%= request.getContextPath() %>/user/findPass.do" method="post">
    <table border="0">
        <tr>
            <%-- 오른쪽으로 이동시키기 위해 padding-right 추가 (값은 원하시는 만큼 조절하세요) --%>
            <td colspan="2" style="padding-bottom: 20px; padding-right: 10px; font-weight: bold; font-size: 16px; text-align: right;">
                비밀번호 찾기
            </td>
        </tr>
        <tr>
            <td><img src="/farmstory/images/user/login_ico_id.png" alt="아이디" style="width:20px; vertical-align:middle;"></td>
            <td><input type="text" name="memberid" placeholder="가입한 아이디 입력" required></td>
        </tr>
        <tr>
            <td><img src="/farmstory/images/user/login_ico_pw.png" alt="이메일" style="width:20px; vertical-align:middle;"></td>
            <td><input type="email" name="memberemail" placeholder="가입한 이메일 입력" required></td>
        </tr>
    </table>
    
    <input type="submit" value="비밀번호 찾기" class="btnLogin" style="width: 80px; margin-left: 100px; margin-top: 35px;" />
</form>

                <%-- 하단 안내 및 링크 영역 --%>
                <div style="margin-top: 30px;">
                    <h3>비밀번호 찾기 안내</h3>
                    <p style="font-size: 12px; color: #777;">
                        회원가입 시 등록한 아이디와 이메일을 입력해 주세요.
                    </p>
                    <div style="text-align: right; margin-top: 10px;">
                        <a href="<%= request.getContextPath() %>/user/login.do">로그인 |</a>
                        <a href="<%= request.getContextPath() %>/user/findId.do">아이디 찾기 |</a>
                        <a href="<%= request.getContextPath() %>/user/terms.do">회원가입</a>
                    </div>
                </div>
            </section>
        </div>

        <jsp:include page="/WEB-INF/views/common/_tail.jsp" />
    </div>
</body>
</html>