<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="DTO.MemberDTO"%>

<%
    MemberDTO sessMember = (MemberDTO) session.getAttribute("sessMember");

    if (sessMember == null) {
        response.sendRedirect(request.getContextPath() + "/user/login.do");
        return;
    }
%>

<jsp:include page="/WEB-INF/views/common/_head.jsp" />

<div id="sub">
    <section class="myinfo">
        <aside>
            <h2>마이페이지</h2>

            <ul class="myinfoLnb">
                <li class="on">
                    <a href="<%=request.getContextPath()%>/user/myinfo.do">내 정보</a>
                </li>
                <li>
                    <a href="<%=request.getContextPath()%>/market/cart.do">장바구니</a>
                </li>
                <li>
                    <a href="<%=request.getContextPath()%>/user/myarticle.do">내가 쓴 글</a>
                </li>
                <li>
                    <a href="<%=request.getContextPath()%>/user/mycomment.do">내가 쓴 댓글</a>
                </li>
                <li>
                    <a href="<%=request.getContextPath()%>/user/modify.do">정보수정</a>
                </li>
                <li>
                    <a href="<%=request.getContextPath()%>/user/leave.do">회원탈퇴</a>
                </li>
            </ul>
        </aside>

        <article id="board">
            <nav>
                <h1>내 정보</h1>
                <p>
                    HOME > 마이페이지 > <em>내 정보</em>
                </p>
            </nav>

            <section class="view">
                <h3>회원정보</h3>

                <table border="0">
                    <tr>
                        <th>아이디</th>
                        <td><%=sessMember.getMemberid()%></td>
                    </tr>

                    <tr>
                        <th>이름</th>
                        <td><%=sessMember.getMembername()%></td>
                    </tr>

                    <tr>
                        <th>닉네임</th>
                        <td><%=sessMember.getMembernick()%></td>
                    </tr>

                    <tr>
                        <th>이메일</th>
                        <td><%=sessMember.getMemberemail()%></td>
                    </tr>

                    <tr>
                        <th>휴대폰</th>
                        <td><%=sessMember.getMemberhp()%></td>
                    </tr>

                    <tr>
                        <th>주소</th>
                        <td>
                            [<%=sessMember.getMemberzip()%>]
                            <%=sessMember.getMemberaddr1()%>
                            <%=sessMember.getMemberaddr2()%>
                        </td>
                    </tr>

                    <tr>
                        <th>회원구분</th>
                        <td>
                            <%
                                if ("admin".equals(sessMember.getMemberrole())) {
                            %>
                                관리자
                            <%
                                } else {
                            %>
                                일반회원
                            <%
                                }
                            %>
                        </td>
                    </tr>

                    <tr>
                        <th>가입일</th>
                        <td><%=sessMember.getRdate()%></td>
                    </tr>
                </table>

                <div class="btnGroup">
                    <a href="<%=request.getContextPath()%>/user/modify.do"
                       class="btn btnModify">정보수정</a>

                    <a href="<%=request.getContextPath()%>/market/cart.do"
                       class="btn btnList">장바구니</a>

                    <a href="<%=request.getContextPath()%>/user/leave.do"
                       class="btn btnDelete"
                       onclick="return confirm('정말 탈퇴하시겠습니까?');">회원탈퇴</a>
                </div>
            </section>
        </article>
    </section>
</div>

<jsp:include page="/WEB-INF/views/common/_tail.jsp" />