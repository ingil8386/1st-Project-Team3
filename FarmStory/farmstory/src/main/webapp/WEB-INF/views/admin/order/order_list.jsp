<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="DTO.CartDTO" %>
<%@ page import="java.text.DecimalFormat" %>

<%
    List<CartDTO> carts = (List<CartDTO>) request.getAttribute("carts");
    DecimalFormat df = new DecimalFormat("#,###");
%>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <title>관리자::주문목록</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/admin.css">
</head>

<body>

    <div id="wrapper">

        <!-- 헤더 -->
        <header>
            <div class="header_inner">
                <a href="<%= request.getContextPath() %>/index.do">
                    <img src="https://farmstory.vercel.app/admin/images/admin_logo.jpg" alt="관리자 로고">
                </a>

                <div class="top_menu">
                    <a href="<%= request.getContextPath() %>/index.do">HOME</a>
                    <span>|</span>
                    <a href="#">로그아웃</a>
                    <span>|</span>
                    <a href="#">고객센터</a>
                </div>
            </div>
        </header>

        <!-- 메인 -->
        <main>
            <div class="main_inner">

                <!-- 좌측 메뉴 -->
                <aside>
                    <h3>주요기능</h3>

                    <div class="menu">
                        <strong>상품관리</strong>
                        <ul>
                            <li><a href="<%= request.getContextPath() %>/admin/product/product_list.do">상품목록</a></li>
                            <li><a href="<%= request.getContextPath() %>/admin/product/product_register.do">상품등록</a></li>
                        </ul>
                    </div>

                    <div class="menu">
                        <strong>회원관리</strong>
                        <ul>
                            <li><a href="<%= request.getContextPath() %>/admin/user/user_list.do">회원목록</a></li>
                        </ul>
                    </div>
                </aside>

                <!-- 콘텐츠 -->
                <section class="content">
                    <h3>주문목록</h3>

                    <table>
                        <thead>
                            <tr>
                                <th>장바구니번호</th>
                                <th>회원아이디</th>
                                <th>회원명</th>
                                <th>상품번호</th>
                                <th>상품명</th>
                                <th>구분</th>
                                <th>가격</th>
                                <th>수량</th>
                                <th>합계</th>
                                <th>등록일</th>
                            </tr>
                        </thead>

                        <tbody>
                        <%
                            if (carts != null && !carts.isEmpty()) {
                                for (CartDTO cart : carts) {
                        %>
                                    <tr>
                                        <td><%= cart.getCartno() %></td>
                                        <td><%= cart.getMemberid() %></td>
                                        <td><%= cart.getMembername() %></td>
                                        <td><%= cart.getProductno() %></td>
                                        <td><%= cart.getProductname() %></td>
                                        <td><%= cart.getProductcate() %></td>
                                        <td><%= df.format(cart.getProductprice()) %>원</td>
                                        <td><%= cart.getCartcount() %></td>
                                        <td><%= df.format(cart.getTotalprice()) %>원</td>
                                        <td><%= cart.getRdate() %></td>
                                    </tr>
                        <%
                                }
                            } else {
                        %>
                                <tr>
                                    <td colspan="10">등록된 장바구니 데이터가 없습니다.</td>
                                </tr>
                        <%
                            }
                        %>
                        </tbody>
                    </table>

                    <!-- 페이지 번호 -->
                    <div class="pagination">
                        <a href="#">&lt;</a>
                        <a href="#" class="on">1</a>
                        <a href="#">2</a>
                        <a href="#">3</a>
                        <a href="#">4</a>
                        <a href="#">5</a>
                        <a href="#">&gt;</a>
                    </div>
                </section>

            </div>
        </main>

        <!-- 푸터 -->
        <footer>
            <p>Copyright(C)Farmstory All rights reserved.</p>
            <p>FARMSTORY ADMINISTRATOR Version 1.0.1</p>
        </footer>

    </div>

</body>

</html>