<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%-- 상단 공통 헤더 불러오기 --%>
	<jsp:include page="/WEB-INF/views/common/_head.jsp" />
	
    <meta charset="UTF-8">
    <title>farmstory::main</title>
    <link rel="stylesheet" href="/farmstory/css/common.css">
	<script>
        // 약관 동의 체크 여부 확인 스크립트
        window.onload = function(){
            const btnNext = document.querySelector('.btnNext');
            
            btnNext.addEventListener('click', function(e){
                e.preventDefault(); // a 태그의 기본 이동 막기
                
                const isTermsChecked = document.querySelector('input.terms').checked;
                const isPrivacyChecked = document.querySelector('input.privacy').checked;
                
                if(!isTermsChecked){
                    alert('사이트 이용약관에 동의하셔야 합니다.');
                    return;
                }
                if(!isPrivacyChecked){
                    alert('개인정보 취급방침에 동의하셔야 합니다.');
                    return;
                }
                
                // 모두 동의 시 회원가입 페이지로 이동
                location.href = '/farmstory/user/register.do';
            });
        };
    </script>

<body>
    <div id="container">
        <div id="user">
            <section class="terms">
                <h2 class="tit">사이트 이용약관</h2>
                <table border="1">
                    <tr>
						<td>
						 <textarea name="terms" readonly>제1조 (목적)
						이 약관은 팜스토리(이하 "회사")가 제공하는 제반 서비스의 이용과 관련하여 회사와 회원과의 권리, 의무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로 합니다.
						제2조 (정의)
						① "서비스"라 함은 구현되는 단말기(PC, TV, 휴대형단말기 등의 각종 유무선 장치를 포함)와 상관없이 "회원"이 이용할 수 있는 팜스토리 관련 제반 서비스를 의미합니다.</textarea>
                            <label><input type="checkbox" class="terms">&nbsp;동의합니다.</label>
                        </td>
                    </tr>
                </table>
                <h2 class="tit">개인정보 취급방침</h2>
                <table border="1">
                    <tr>
						<td>
						<textarea name="privacy" readonly>1. 수집하는 개인정보 항목
						회사는 회원가입, 상담, 서비스 신청 등을 위해 아래와 같은 개인정보를 수집하고 있습니다.
						- 수집항목 : 이름, 생년월일, 로그인ID, 비밀번호, 자택 전화번호, 자택 주소, 휴대전화번호, 이메일
						2. 개인정보의 수집 및 이용목적
						회사는 수집한 개인정보를 다음의 목적을 위해 활용합니다.
						- 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산</textarea>
                            <label><input type="checkbox" class="privacy">&nbsp;동의합니다.</label>
                        </td>
                    </tr>
                </table>
                <div>
                    <a href="/farmstory/user/login.do" class="btn btnCancel">취소</a>
                    <a href="./register.do" class="btn btnNext">다음</a>
                </div>

            </section>
        </div>

		<%-- 하단 공통 푸터 불러오기 --%>
		<jsp:include page="/WEB-INF/views/common/_tail.jsp" />

</body>

</html>
