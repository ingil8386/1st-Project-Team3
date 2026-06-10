<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>farmstory</title>

 <link rel="stylesheet" href="/farmstory/css/main.css">
<link rel="stylesheet" href="/farmstory/css/detail.css">
<link rel="stylesheet" href="/farmstory/css/list.css">
</head>
<body>  
    <div id="container">
        <header>
            <a href="/farmstory/index.do" class="logo"><img src="/farmstory/images/logo.png" alt="메인로고"/></a>
            
            <p>
                <c:choose>
                    <%-- 1. 로그인 전 상태 (sessMember가 없을 때) --%>
                    <c:when test="${empty sessionScope.sessMember}">
                        <a href="/farmstory/user/login.do">로그인</a> | 
                        <a href="/farmstory/user/terms.do">회원가입</a> | 
                        <a href="/farmstory/community/qna.do">고객센터</a>
                    </c:when>
                    
                    <%-- 2. 로그인 완료 상태 (sessMember가 존재할 때) --%>
                    <c:otherwise>
                        <strong>${sessionScope.sessMember.membernick}</strong>님 환영합니다. | 
                        <a href="/farmstory/user/logout.do">로그아웃</a> | 
                        <a href="/farmstory/user/myinfo.do">마이페이지</a>
                        
                        <%-- 만약 관리자(role이 admin)라면 관리자 모드 버튼 노출 --%>
                        <c:if test="${sessionScope.sessMember.memberrole eq 'admin'}">
                            | <a href="/farmstory/admin/admin.do" style="color:red;">관리자</a>
                        </c:if>
                    </c:otherwise>
                </c:choose>
            </p>

            <img class="text" src="/farmstory/images/head_txt_img.png" alt="3만원이상 무료배송">

            <ul class="gnb">
                <li><a href="/farmstory/about/greeting.do">팜스토리소개</a></li>
                <li><a href="/farmstory/market/list.do">장보기</a></li>
                <li><a href="/farmstory/story/intro.do">농작물이야기</a></li>
                <li><a href="/farmstory/event/calendar.do">이벤트</a></li>
                <li><a href="/farmstory/community/notice.do">커뮤니티</a></li>
            </ul>
        </header>