/**
 * Farmstory 회원가입 유효성 검증 파일
 */
// 유효성 검사에 사용할 정규표현식
const reUserid  = /^[a-z]+[a-z0-9]{4,19}$/g;
const rePass    = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{5,16}$/;
const reName    = /^[가-힣]{2,10}$/
const reNick    = /^[a-zA-Zㄱ-힣0-9][a-zA-Zㄱ-힣0-9]*$/;
const reEmail   = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
const reHp      = /^01(?:0|1|[6-9])-(?:\d{4})-\d{4}$/;

// 유효성 검사 상태변수
let isUseridOk = false;
let isPassOk = false;
let isNameOk = false;
let isNickOk = false;
let isEmailOk = false;
let isHpOk = false;

document.addEventListener('DOMContentLoaded', function(){
    
    const form = document.getElementsByTagName('form')[0];
                
    // 최종 폼 전송하기
    form.addEventListener('submit', function(e){
                        
        if(!isUseridOk){
            e.preventDefault(); 
            alert('아이디를 확인하세요.');
            return;
        }
        
        if(!isPassOk){
            e.preventDefault(); 
            alert('비밀번호를 확인하세요.');
            return;
        }
        
        if(!isNameOk){
            e.preventDefault(); 
            alert('이름을 확인하세요.');
            return;
        }
        
        if(!isNickOk){
            e.preventDefault(); 
            alert('별명을 확인하세요.');
            return;
        }
        
        if(!isEmailOk){
            e.preventDefault(); 
            alert('이메일을 확인하세요.');
            return;
        }
        
        if(!isHpOk){
            e.preventDefault(); 
            alert('휴대폰을 확인하세요.');
            return;
        }               
    });         
    
    //--------------------------
    // 1) 아이디 유효성 검사(중복체크 포함)
    //--------------------------
    const btnUserid = document.querySelector('input[name="memberid"]').nextElementSibling;
    const memberidResult = document.getElementsByClassName('memberidResult')[0];
    
    btnUserid.addEventListener('click', async function(e){
        e.preventDefault();
        
        const value = form.memberid.value;
        
        // 아이디 유효성 검사
        if(!value.match(reUserid)){
            memberidResult.innerText = '아이디가 유효하지 않습니다.';
            memberidResult.style.color = 'red';
            return;
        }
        
        // 아이디 중복 여부 요청하기
        const response = await fetch('/farmstory/user/check.do?type=memberid&value=' + value);
        const data = await response.json();             
        console.log(data);
        
        if(data.count > 0){
            memberidResult.innerText = '이미 사용중인 아이디 입니다.';
            memberidResult.style.color = 'red';
            isUseridOk = false;
        }else{
            memberidResult.innerText = '사용 가능한 아이디 입니다.';
            memberidResult.style.color = 'green';                 
            isUseridOk = true;
        }               
    });
    
    //--------------------------
    // 2) 비밀번호 유효성 검사 및 일치여부
    //--------------------------
    const pass1 = document.getElementsByName('memberpass')[0];
    const pass2 = document.getElementsByName('memberpass2')[0];
    const passResult = document.getElementsByClassName('passResult')[0];
    
    pass1.addEventListener('focusout', function(e){
        e.preventDefault();
        
        const value = form.memberpass.value;
        
        if(!value.match(rePass)){
            if(passResult) {
                passResult.innerText = '비밀번호가 유효하지 않습니다.';
                passResult.style.color = 'red';
            }
            return;
        } else {
            if(passResult) passResult.innerText = '';
        }
    });
    
    pass2.addEventListener('focusout', function(e){
        e.preventDefault();
        
        const value1 = form.memberpass.value;
        const value2 = form.memberpass2.value;
        
        if(value1 === value2){
            if(passResult) {
                passResult.innerText = '비밀번호가 일치 합니다.';
                passResult.style.color = 'green';
            }
            isPassOk = true;
        }else {
            if(passResult) {
                passResult.innerText = '비밀번호가 일치하지 않습니다.';
                passResult.style.color = 'red';
            }
            isPassOk = false;
        }
    });
    
    //--------------------------
    // 3) 이름 유효성 검사
    //--------------------------
    const name = document.getElementsByName('membername')[0];
    const nameResult = document.querySelector('input[name="membername"]').nextElementSibling;
    
    name.addEventListener('focusout', function(e){
        e.preventDefault();
        
        const value = form.membername.value;
        
        if(!value.match(reName)){
            if(nameResult) {
                nameResult.innerText = '이름이 유효하지 않습니다.';
                nameResult.style.color = 'red';
            }
            isNameOk = false;
        }else {
            if(nameResult) nameResult.innerText = '';
            isNameOk = true;
        }
    });
    
    //--------------------------
    // 4) 별명 유효성 검사(중복 체크 포함)
    //--------------------------
    const btnNick = document.querySelector('input[name="membernick"]').nextElementSibling;
    const nickResult = document.getElementsByClassName('nickResult')[0];
    
    btnNick.addEventListener('click', async function(e){
        e.preventDefault();
        
        const value = form.membernick.value;
        
        if(!value.match(reNick)){
            nickResult.innerText = '별명이 유효하지 않습니다.';
            nickResult.style.color = 'red';
            isNickOk = false;
            return;
        }
        
        // 별명 중복 여부 요청하기
        const response = await fetch('/farmstory/user/check.do?type=nick&value=' + value);
        const data = await response.json();             
        console.log(data);
        
        if(data.count > 0){
            nickResult.innerText = '이미 사용중인 별명 입니다.';
            nickResult.style.color = 'red';
            isNickOk = false;
        }else{
            nickResult.innerText = '사용 가능한 별명 입니다.';
            nickResult.style.color = 'green';
            isNickOk = true;
        }               
    });
    
    
    //--------------------------
    // 5) 이메일 인증 확인(중복체크 포함)
    //--------------------------
    const btnEmail = document.querySelector('input[name="memberemail"]').nextElementSibling;
    const btnConfirm = document.getElementById('btnConfirm');
    const auth = document.getElementsByClassName('auth')[0];            
    
    // HTML 레이아웃 보완용 임시 스팬 자동 바인딩
    let emailResult = document.getElementsByClassName('emailResult')[0];
    if(!emailResult){
        emailResult = document.createElement('span');
        emailResult.className = 'emailResult';
        btnEmail.after(emailResult);
    }
    
    let preventDblClick = false; 
    
    btnEmail.addEventListener('click', async function(e){
        e.preventDefault();
        
        if(preventDblClick) return;
        
        preventDblClick = true;
        const value = form.memberemail.value;             
        
        if(!value.match(reEmail)){
            emailResult.innerText = '이메일이 유효하지 않습니다.';
            emailResult.style.color = 'red';
            isEmailOk = false;
            preventDblClick = false;
            return;
        }
        
        // 이메일 인증코드 요청하기
        const response = await fetch('/farmstory/user/check.do?type=email&value='+value);
        const data = await response.json();
        console.log(data);
        
        if(data.count > 0){
            emailResult.innerText = '이미 사용중인 이메일 입니다.';
            emailResult.style.color = 'red';
            isEmailOk = false;
            preventDblClick = false;
        }else{
            emailResult.innerText = '이메일 인증코드를 확인 하세요.';
            emailResult.style.color = 'green';
            auth.style.display = 'block';                
        }
    });
    
    // 인증코드 확인버튼 클릭           
    btnConfirm.addEventListener('click', async function(e){
        e.preventDefault();
        
		// 💥 핵심 수정: form 변수에 의존하지 않고, name이 "code"인 input을 직접 찾아옵니다.
		    const inputCode = document.querySelector('input[name="code"]');
		    
		    // 찾은 input에서 값을 꺼내옵니다.
		    const value = inputCode.value; 
		    
		    // 빈 값 체크
		    if(value === ""){
		        alert('인증번호를 입력하세요.');
		        return;
		    }
        
		// FormData 대신 URLSearchParams 사용
		    const params = new URLSearchParams();
		    params.append('code', value);
		    
		    const response = await fetch('/farmstory/user/check.do', {
		        method: 'POST',
		        body: params, // 수정한 params 변수 넣기
		    });
        const data = await response.json();
        console.log(data);
        
        if(data.count > 0){
            emailResult.innerText = '인증코드가 잘못 되었습니다.';
            emailResult.style.color = 'red';
            isEmailOk = false;
        }else{
            emailResult.innerText = '이메일이 인증 되었었습니다.';
            emailResult.style.color = 'green';  
            isEmailOk = true;
        }
    });
    
    //--------------------------
    // 6) 휴대폰 유효성 검사
    //--------------------------
    const inputHp = document.getElementsByName('memberhp')[0];
    const hpResult = document.getElementsByClassName('hpResult')[0];
    
    inputHp.addEventListener('focusout', async function(e){
        e.preventDefault();             
        
        const value = form.memberhp.value;
        
        if(!value.match(reHp)){
            if(hpResult) {
                hpResult.innerText = '휴대폰이 유효하지 않습니다.';
                hpResult.style.color = 'red';
            }
            isHpOk = false;
            return;
        }               
        
        // 휴대폰 중복 여부 요청하기
        const response = await fetch('/farmstory/user/check.do?type=hp&value='+value);
        const data = await response.json();
        console.log(data);
        
        if(data.count > 0){
            if(hpResult) {
                hpResult.innerText = '이미 사용중인 휴대폰 입니다.';
                hpResult.style.color = 'red';
            }
            isHpOk = false;
        }else{                  
            if(hpResult) {
                hpResult.innerText = '사용할 수 있는 휴대폰 입니다.';
                hpResult.style.color = 'green';
            }
            isHpOk = true;
        }
    });
});