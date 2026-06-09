/*
 * Farmstory 회원가입 유효성 검증 파일
 */
const reUserid   = /^[a-z]+[a-z0-9]{4,19}$/g;
const rePass     = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{5,16}$/;
const reName     = /^[가-힣]{2,10}$/;
const reNick     = /^[a-zA-Zㄱ-힣0-9][a-zA-Zㄱ-힣0-9]*$/;
const reEmail    = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
const reHp       = /^01(?:0|1|[6-9])-(?:\d{4})-\d{4}$/;

let isUseridOk = false;
let isPassOk   = false;
let isNameOk   = false;
let isNickOk   = false;
let isEmailOk  = false;
let isHpOk     = false;

document.addEventListener('DOMContentLoaded', function(){
    const form = document.getElementsByTagName('form')[0];
    
    // 최종 폼 전송
    form.addEventListener('submit', function(e){
        if(!isUseridOk){ e.preventDefault(); alert('아이디를 확인하세요.'); return; }
        if(!isPassOk){ e.preventDefault(); alert('비밀번호를 확인하세요.'); return; }
        if(!isNameOk){ e.preventDefault(); alert('이름을 확인하세요.'); return; }
        if(!isNickOk){ e.preventDefault(); alert('별명을 확인하세요.'); return; }
        if(!isEmailOk){ e.preventDefault(); alert('이메일을 확인하세요.'); return; }
        if(!isHpOk){ e.preventDefault(); alert('휴대폰을 확인하세요.'); return; }
    });
    
    // 1) 아이디 중복 체크 (id="btnUserid" 버튼이 있다면 활용)
    // 현재 JSP에 ID 버튼이 명확하지 않아 로직만 구성합니다.
    
    // 2) 비밀번호 일치 확인 (name="memberpass", "memberpass2")
    const pass1 = form.memberpass;
    const pass2 = form.memberpass2;
    const passResult = document.getElementsByClassName('passResult')[0];
    
    const checkPass = function(){
        if(pass1.value === pass2.value && pass1.value.match(rePass)){
            passResult.innerText = '비밀번호가 일치합니다.';
            passResult.style.color = 'green';
            isPassOk = true;
        } else {
            passResult.innerText = '비밀번호가 일치하지 않거나 유효하지 않습니다.';
            passResult.style.color = 'red';
            isPassOk = false;
        }
    };
    pass1.addEventListener('focusout', checkPass);
    pass2.addEventListener('focusout', checkPass);
    
    // 3) 이름 유효성 검사 (name="membername")
    form.membername.addEventListener('focusout', function(){
        if(this.value.match(reName)){
            isNameOk = true;
        } else {
            isNameOk = false;
            alert('이름은 한글 2~10자여야 합니다.');
        }
    });
    
    // 4) 별명 유효성 검사 (name="membernick")
    // 서버측 중복 체크 시 fetch('/farmstory/user/check.do?type=nick&value=' + form.membernick.value) 호출
    
    // 5) 이메일, 휴대폰 등 나머지 중복체크 로직은 
    // fetch URL을 '/farmstory/user/check.do?type=...' 형식으로 맞추어 사용하세요.
});