<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<jsp:include page="/WEB-INF/views/common/_head.jsp" />

<head>
    <meta charset="UTF-8">
    <title>farmstory::비밀번호 재설정</title>
    <link rel="stylesheet" href="/farmstory/css/common.css">
</head>

<body>
    <div id="container">
        <div id="user">
            <section class="login">
                
                <%-- 결과 메시지 출력 영역 --%>
                <c:if test="${not empty result}">
                    <div class="find-result-box" style="margin-bottom: 15px; padding: 15px; 
                         border: 1px solid ${result eq 'success' ? '#D1CAB2' : '#f5c6cb'}; 
                         background: ${result eq 'success' ? '#fdfdfb' : '#f8d7da'}; 
                         text-align: center; border-radius: 4px;">
                        
                        <p style="font-size: 12px; color: ${result eq 'success' ? '#555' : '#721c24'}; margin: 0; font-weight: bold;">
                            <c:choose>
                                <c:when test="${result eq 'fail'}">🚨 비밀번호 변경에 실패했습니다. 다시 시도해 주세요.</c:when>
                                <c:when test="${result eq 'passMismatch'}">🚨 비밀번호가 일치하지 않습니다. 다시 확인해 주세요.</c:when>
                                <c:when test="${result eq 'success'}">✅ 비밀번호 변경이 완료되었습니다. 다시 로그인해 주세요.</c:when>
                            </c:choose>
                        </p>

                        <%-- 성공 시에만 로그인 버튼 노출 --%>
                        <c:if test="${result eq 'success'}">
                            <a href="<%= request.getContextPath() %>/user/login.do" 
                               style="display: inline-block; margin-top: 15px; padding: 5px 15px; background: #2e658a; color: #fff; border-radius: 3px; font-size: 12px; text-decoration: none;">
                               로그인하러 가기
                            </a>
                        </c:if>
                    </div>
                </c:if>

                <%-- 결과가 성공이 아닐 때만 폼을 보여줌 --%>
                <c:if test="${result ne 'success'}">
                    <form action="<%= request.getContextPath() %>/user/resetPass.do" method="post">
                        <%-- 아이디를 유지하기 위해 hidden 필드 사용 --%>
                        <input type="hidden" name="memberid" value="${memberid}">
                        
                        <table border="0">
                            <tr>
                                <td colspan="3" style="padding-bottom: 20px; font-weight: bold; font-size: 16px; text-align: center;">
                                    비밀번호 재설정
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 30px; vertical-align: middle;"><img src="/farmstory/images/user/login_ico_pw.png" alt="비밀번호" style="width:20px; vertical-align:middle;"></td>
                                <td style="padding-right: 10px; vertical-align: middle;">
                                    <input type="password" name="memberpass" placeholder="새 비밀번호 입력" required style="width: 100%; height: 25px; box-sizing: border-box;">
                                </td>
                                <td rowspan="2" style="width: 120px; vertical-align: middle;">
                                    <input type="submit" value="비밀번호 변경" class="btnLogin" style="
                                        box-sizing: border-box;
                                        width: 80px; 
                                        height: 60px; /* 두 줄의 높이를 모두 커버하는 세로 크기 */
                                        text-align: center; 
                                        padding: 0; 
                                        cursor: pointer;
                                     	" />
                                </td>
                            </tr>
                            <tr>
                                <td style="vertical-align: middle;"><img src="/farmstory/images/user/login_ico_pw.png" alt="비밀번호 확인" style="width:20px; vertical-align:middle;"></td>
                                <td style="padding-right: 10px; vertical-align: middle;">
                                    <input type="password" name="memberpass2" placeholder="새 비밀번호 확인" required style="width: 100%; height: 25px; box-sizing: border-box;">
                                </td>
                            </tr>
                        </table>
                    </form>
                </c:if>

            </section>
        </div>
        <jsp:include page="/WEB-INF/views/common/_tail.jsp" />
    </div>
</body>
</html>