<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>


<%
    Integer statusCode = (Integer) request.getAttribute("jakarta.servlet.error.status_code");
    String requestUri = (String) request.getAttribute("jakarta.servlet.error.request_uri");

    String title = "시스템 오류가 발생했습니다.";
    String message = "요청하신 페이지를 처리하는 중 문제가 발생했습니다.";

    if (statusCode != null && statusCode == 404) {
        title = "요청하신 페이지를 찾을 수 없습니다.";
        message = "주소가 잘못 입력되었거나, 페이지가 이동 또는 삭제되었습니다.";
    } else if (statusCode != null && statusCode == 500) {
        title = "서버 처리 중 오류가 발생했습니다.";
        message = "잠시 후 다시 시도해주세요.";
    }
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>팜스토리 | 오류 안내</title>

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            min-height: 100vh;
            font-family: 'Noto Sans KR', '맑은 고딕', sans-serif;
            background: #f4fcf7;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 24px;
            overflow: hidden;
            color: #333;
        }

        .bgCircle1 {
            position: absolute;
            top: -120px;
            left: -120px;
            width: 360px;
            height: 360px;
            background: #dff5e7;
            border-radius: 50%;
            filter: blur(40px);
            opacity: 0.7;
        }

        .bgCircle2 {
            position: absolute;
            right: -120px;
            bottom: -120px;
            width: 360px;
            height: 360px;
            background: #d4f3df;
            border-radius: 50%;
            filter: blur(40px);
            opacity: 0.7;
        }

        .errorBox {
            position: relative;
            z-index: 10;
            width: 100%;
            max-width: 560px;
            padding: 42px 48px;
            background: #fff;
            border: 1px solid #e3f3e8;
            border-radius: 28px;
            box-shadow: 0 20px 45px rgba(0, 0, 0, 0.08);
            text-align: center;
        }

        .logo {
            margin-bottom: 28px;
            font-size: 28px;
            font-weight: bold;
            letter-spacing: 1px;
            color: #222;
        }

        .logo span {
            color: #16a35a;
        }

        .iconWrap {
            position: relative;
            width: 170px;
            height: 170px;
            margin: 0 auto 30px;
            background: #ecfbf1;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .sprout {
            font-size: 78px;
            animation: sway 3s ease-in-out infinite;
        }

        .drop1,
        .drop2 {
            position: absolute;
            color: #16a35a;
            font-size: 20px;
            animation: drip 2s infinite;
        }

        .drop1 {
            top: 35px;
            right: 48px;
        }

        .drop2 {
            top: 52px;
            right: 68px;
            font-size: 15px;
            opacity: 0.7;
            animation-delay: 0.7s;
        }

        .errorCode {
            display: inline-block;
            margin-bottom: 12px;
            padding: 5px 14px;
            border-radius: 20px;
            background: #e8f8ee;
            color: #16a35a;
            font-size: 13px;
            font-weight: bold;
        }

        h1 {
            margin-bottom: 15px;
            font-size: 26px;
            line-height: 1.4;
            color: #222;
        }

        h1 span {
            color: #16a35a;
        }

        .message {
            margin-bottom: 28px;
            color: #666;
            font-size: 15px;
            line-height: 1.8;
        }

        .infoBox {
            margin-bottom: 28px;
            padding: 22px;
            background: #f8faf9;
            border: 1px solid #eef2ef;
            border-radius: 18px;
            text-align: left;
        }

        .infoBox h3 {
            margin-bottom: 14px;
            color: #222;
            font-size: 15px;
        }

        .infoBox ul {
            list-style: none;
        }

        .infoBox li {
            display: flex;
            gap: 14px;
            margin-top: 10px;
            color: #666;
            font-size: 13px;
            line-height: 1.6;
        }

        .infoBox strong {
            flex-shrink: 0;
            width: 70px;
            color: #999;
            font-weight: bold;
        }

        .btnArea {
            margin-top: 24px;
        }

        .btnArea a {
            display: inline-block;
            min-width: 110px;
            height: 38px;
            line-height: 38px;
            margin: 0 4px;
            border-radius: 20px;
            font-size: 13px;
            font-weight: bold;
            text-decoration: none;
        }

        .btnHome {
            background: #16a35a;
            color: #fff;
        }

        .btnBack {
            background: #777;
            color: #fff;
        }

        .footer {
            margin-top: 26px;
            padding-top: 18px;
            border-top: 1px solid #eee;
            color: #aaa;
            font-size: 12px;
        }

        @keyframes sway {
            0%, 100% {
                transform: rotate(-3deg) scale(1);
            }
            50% {
                transform: rotate(3deg) scale(1.05);
            }
        }

        @keyframes drip {
            0% {
                transform: translateY(-10px);
                opacity: 0;
            }
            50% {
                opacity: 1;
            }
            100% {
                transform: translateY(30px);
                opacity: 0;
            }
        }
    </style>
</head>
<body>

    <div class="bgCircle1"></div>
    <div class="bgCircle2"></div>

    <div class="errorBox">
        <div class="logo">
            🌱 Farm<span>Story</span>
        </div>

        <div class="iconWrap">
            <div class="drop1">💧</div>
            <div class="drop2">💧</div>
            <div class="sprout">🌱</div>
        </div>

        <div class="errorCode">
            ERROR
            <%
                if (statusCode != null) {
            %>
                <%=statusCode%>
            <%
                }
            %>
        </div>

        <h1>
            더 풍성한 <span>팜스토리</span>를 위해<br>
            페이지를 점검하고 있습니다.
        </h1>

        <p class="message">
            <%=title%><br>
            <%=message%><br>
            이용에 불편을 드려 죄송합니다.
        </p>

        <div class="infoBox">
            <h3>오류 안내</h3>
            <ul>
                <li>
                    <strong>오류 코드</strong>
                    <span><%=statusCode != null ? statusCode : "알 수 없음"%></span>
                </li>
                <li>
                    <strong>요청 주소</strong>
                    <span><%=requestUri != null ? requestUri : "-"%></span>
                </li>
                <li>
                    <strong>처리 방법</strong>
                    <span>이전 페이지로 돌아가거나 메인 페이지에서 다시 이용해주세요.</span>
                </li>
            </ul>
        </div>

        <div class="btnArea">
            <a href="<%=request.getContextPath()%>/index.do" class="btnHome">메인으로</a>
            <a href="javascript:history.back();" class="btnBack">이전 페이지</a>
        </div>

        <div class="footer">
            © 2026 FarmStory. All rights reserved.
        </div>
    </div>

</body>
</html>