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
                <li><a href="<%=request.getContextPath()%>/user/myinfo.do">내 정보</a></li>
                <li><a href="<%=request.getContextPath()%>/market/cart.do">장바구니</a></li>
                <li><a href="<%=request.getContextPath()%>/user/myarticle.do">내가 쓴 글</a></li>
                <li><a href="<%=request.getContextPath()%>/user/mycomment.do">내가 쓴 댓글</a></li>
                <li class="on"><a href="<%=request.getContextPath()%>/user/modify.do">정보수정</a></li>
                <li><a href="<%=request.getContextPath()%>/user/leave.do">회원탈퇴</a></li>
            </ul>
        </aside>

        <article id="board">
            <nav>
                <h1>정보수정</h1>
                <p>HOME > 마이페이지 > <em>정보수정</em></p>
            </nav>

            <section class="view">
                <h3>회원정보 수정</h3>

                <form action="<%=request.getContextPath()%>/user/modify.do" method="post">
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
                            <th>새 비밀번호</th>
                            <td>
                                <input type="password" name="memberpass" placeholder="변경하지 않으려면 비워두세요">
                            </td>
                        </tr>

                        <tr>
                            <th>닉네임</th>
                            <td>
                                <input type="text" name="membernick" value="<%=sessMember.getMembernick()%>" required>
                            </td>
                        </tr>

                        <tr>
                            <th>이메일</th>
                            <td>
                                <input type="email" name="memberemail" value="<%=sessMember.getMemberemail()%>" required>
                            </td>
                        </tr>

                        <tr>
                            <th>휴대폰</th>
                            <td>
                                <input type="text" name="memberhp" value="<%=sessMember.getMemberhp()%>" required>
                            </td>
                        </tr>

                        <tr>
                            <th>우편번호</th>
                            <td>
                                <input type="text" name="memberzip" value="<%=sessMember.getMemberzip()%>">
                            </td>
                        </tr>

                        <tr>
                            <th>주소</th>
                            <td>
                                <input type="text" name="memberaddr1" value="<%=sessMember.getMemberaddr1()%>" style="width:400px;">
                            </td>
                        </tr>

                        <tr>
                            <th>상세주소</th>
                            <td>
                                <input type="text" name="memberaddr2" value="<%=sessMember.getMemberaddr2()%>" style="width:400px;">
                            </td>
                        </tr>
                    </table>

                    <div class="btnGroup">
                        <input type="submit" class="btn btnModify" value="수정완료">
                        <a href="<%=request.getContextPath()%>/user/myinfo.do" class="btn btnList">취소</a>
                    </div>
                </form>
            </section>
        </article>
    </section>
</div>

<jsp:include page="/WEB-INF/views/common/_tail.jsp" />