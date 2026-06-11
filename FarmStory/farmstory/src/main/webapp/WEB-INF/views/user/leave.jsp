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
                <li>
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
                <li class="on">
                    <a href="<%=request.getContextPath()%>/user/leave.do">회원탈퇴</a>
                </li>
            </ul>
        </aside>

        <article id="board">
            <nav>
                <h1>회원탈퇴</h1>
                <p>
                    HOME > 마이페이지 > <em>회원탈퇴</em>
                </p>
            </nav>

            <section class="view">
                <h3>회원탈퇴 확인</h3>

                <form action="<%=request.getContextPath()%>/user/leave.do" method="post"
                      onsubmit="return confirm('정말 회원탈퇴 하시겠습니까? 탈퇴 후 복구할 수 없습니다.');">

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
                            <th>비밀번호 확인</th>
                            <td>
                                <input type="password" name="memberpass" required
                                       placeholder="현재 비밀번호를 입력하세요">
                            </td>
                        </tr>

                        <tr>
                            <th>안내</th>
                            <td>
                                회원탈퇴 시 회원정보가 삭제됩니다.<br>
                                작성한 게시글, 댓글, 장바구니 정보도 함께 삭제될 수 있습니다.
                            </td>
                        </tr>
                    </table>

                    <div class="btnGroup">
                        <input type="submit" class="btn btnDelete" value="회원탈퇴">
                        <a href="<%=request.getContextPath()%>/user/myinfo.do" class="btn btnList">취소</a>
                    </div>
                </form>
            </section>
        </article>
    </section>
</div>

<jsp:include page="/WEB-INF/views/common/_tail.jsp" />