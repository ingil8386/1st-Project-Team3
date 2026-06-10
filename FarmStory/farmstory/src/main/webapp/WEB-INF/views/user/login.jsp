<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%-- 상단 공통 헤더 불러오기 --%>
<jsp:include page="/WEB-INF/views/common/_head.jsp" />

<head>
    <meta charset="UTF-8">
    <title>farmstory::main</title>
    <link rel="stylesheet" href="/farmstory/css/common.css">
</head>

<body>
    <div id="container">
        <div id="user">
            <section class="login">
                <form action="/farmstory/user/login.do" method="post">
                    <table border="0">
                        <tr>
                            <td><img src="/farmstory/images/user/login_ico_id.png" alt="아이디"></td>
                            <td><input type="text" name="memberid" placeholder="아이디 입력"></td>
                        </tr>
                        <tr>
                            <td><img src="/farmstory/images/user/login_ico_pw.png" alt="비밀번호"></td>
                            <td><input type="password" name="memberpass" placeholder="비밀번호 입력"></td>
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
                        <a href="/farmstory/user/findId.do">아이디 |</a>
                        <a href="/farmstory/user/findPass.do">비밀번호찾기 |</a>
                        <a href="/farmstory/user/terms.do">회원가입</a>|
                    </div>
                </div>
            </section>
		<%-- 하단 공통 푸터 불러오기 --%>
		<jsp:include page="/WEB-INF/views/common/_tail.jsp" />
        </div>

</body>

</html>
