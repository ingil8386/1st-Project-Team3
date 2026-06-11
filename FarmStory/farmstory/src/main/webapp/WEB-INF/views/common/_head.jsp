<%@ page contentType="text/html;charset=UTF-8" language="java"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>farmstory</title>

<link rel="stylesheet" href="<%= request.getContextPath() %>/css/main.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/detail.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/list.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/story.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/event.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/myinfo.css">
</head>
<body>
    <div id="container">
        <header>
            <a href="<%= request.getContextPath() %>/index.do" class="logo">
                <img src="<%= request.getContextPath() %>/images/logo.png" alt="메인로고" />
            </a>

            <p>
                <c:choose>
                    <c:when test="${empty sessionScope.sessMember}">
                        <a href="<%= request.getContextPath() %>/user/login.do">로그인</a> | 
                        <a href="<%= request.getContextPath() %>/user/terms.do">회원가입</a> | 
                        <a href="<%= request.getContextPath() %>/community/qna.do">고객센터</a>
                    </c:when>

                    <c:otherwise>
                        <strong>${sessionScope.sessMember.membernick}</strong>님 환영합니다. | 
                        <a href="<%= request.getContextPath() %>/user/logout.do">로그아웃</a> | 
                        <a href="<%= request.getContextPath() %>/market/cart.do">장바구니</a> | 
                        <a href="<%= request.getContextPath() %>/user/myinfo.do">마이페이지</a>

                        <c:if test="${sessionScope.sessMember.memberrole eq 'admin'}">
                            | <a href="<%= request.getContextPath() %>/admin/admin.do"
                                style="color: red;">관리자</a>
                        </c:if>
                    </c:otherwise>
                </c:choose>
            </p>

            <img class="text" src="<%= request.getContextPath() %>/images/head_txt_img.png"
                alt="3만원이상 무료배송">

            <ul class="gnb">
                <li><a href="<%= request.getContextPath() %>/about/greeting.do">팜스토리소개</a></li>
                <li><a href="<%= request.getContextPath() %>/market/list.do">장보기</a></li>
                <li><a href="<%= request.getContextPath() %>/story/intro.do">농작물이야기</a></li>
                <li><a href="<%= request.getContextPath() %>/event/calendar.do">이벤트</a></li>
                <li><a href="<%= request.getContextPath() %>/community/notice.do">커뮤니티</a></li>
            </ul>
        </header>