<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%-- 상단 공통 헤더 불러오기 --%>
<jsp:include page="/WEB-INF/views/common/_head.jsp" />
<head>
<meta charset="UTF-8">
<title>farmstory::main</title>
<link rel="stylesheet" href="/farmstory/css/common.css">
<script
	src="//t1.kakaocdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/farmstory/js/daumPostcode.js"></script>
<script src="/farmstory/js/validation.js"></script>
</head>

<body>
	<div id="container">
		<div id="user">
			<section class="register">
				<form action="/farmstory/user/register.do" method="post">
					<h2 class="tit">사이트 이용정보 입력</h2>
					<table border="1">
						<tr>
							<td>아이디</td>
							<td><input type="text" name="memberid" placeholder="아이디 입력" />
								<button type="button">
									<img src="/farmstory/images/user/chk_id.gif" alt="중복확인">
								</button> <span class="memberidResult"></span></td>
						</tr>
						<tr>
							<td>비밀번호</td>
							<td><input type="password" name="memberpass"
								placeholder="비밀번호 입력" /> <span class="passResult"></span></td>
						</tr>
						<tr>
							<td>비밀번호 확인</td>
							<td><input type="password" name="memberpass2"
								placeholder="비밀번호 입력 확인" /></td>
							<span class="nameResult"></span>
						</tr>
					</table>
					<h2 class="tit">개인정보 입력</h2>
					<table border="1">
						<tr>
							<td>이름</td>
							<td><input type="text" name="membername" placeholder="이름 입력" />
								<span class="nameResult"></span></td>
						</tr>
						<tr>
							<td>별명</td>
							<td>
								<p class="nickInfo">공백없는 한글, 영문, 숫자 입력</p> <input type="text"
								name="membernick" placeholder="별명 입력" />
								<button>
									<img src="/farmstory/images/user/chk_id.gif" alt="중복확인">
								</button> <span class="nickResult"></span>
							</td>
						</tr>
						<tr>
							<td>이메일</td>
							<td><input type="email" name="memberemail"
								placeholder="이메일 입력" />
								<button>
									<img src="/farmstory/images/user/chk_auth.gif" alt="인증번호 받기">
								</button>
								<div class="auth">
									<input type="text" name="code" id="인증번호 입력" />
									<button type="button" id="btnConfirm">
										<img src="/farmstory/images/user/chk_confirm.gif" alt="확인">
									</button>
								</div></td>
						</tr>
						<tr>
							<td>휴대폰</td>
							<td><input type="text" name="memberhp" placeholder="휴대폰 입력" />
								<span class="hpResult"></span></td>
						</tr>
						<tr>
							<td>주소</td>
							<td><input type="text" name="memberzip" placeholder="우편번호" />
								<input type="text" id="addr1" name="memberaddr1" readonly
								placeholder="주소 검색" /> <input type="text" name="memberaddr2"
								placeholder="상세주소 입력" />
								<button type="button" onclick="DaumPostcode()">
									<img src="/farmstory/images/user/chk_post.gif" alt="우편번호 찾기">
								</button></td>
						</tr>
					</table>
					<div
						style="display: flex; justify-content: flex-end; gap: 10px; margin-top: 20px;">

						<a href="/farmstory/user/login.do" class="btn btnCancel"
							style="display: block; box-sizing: border-box; width: 100px; height: 35px; line-height: 33px; /* 높이에서 위아래 테두리 2px를 뺀 값으로 세로 중앙 정렬 */ text-align: center; text-decoration: none; border: 1px solid #ccc; font-size: 14px; padding: 0;">취소</a>

						<input type="submit" value="회원가입" class="btn btnRegister"
							style="display: block; box-sizing: border-box; width: 100px; height: 35px; line-height: 33px; text-align: center; border: 1px solid #333; font-size: 14px; cursor: pointer; padding: 0;" />

					</div>
				</form>

			</section>

		</div>
		<%-- 하단 공통 푸터 불러오기 --%>
		<jsp:include page="/WEB-INF/views/common/_tail.jsp" />
</body>

</html>
