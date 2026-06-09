<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="DTO.ProductDTO" %>
<%@ page import="java.text.DecimalFormat" %>

<%
    List<ProductDTO> products = (List<ProductDTO>) request.getAttribute("products");
    DecimalFormat df = new DecimalFormat("#,###");
%>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <title>관리자::상품목록</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/admin.css">

    <script>
        function toggleAll(source) {
            const checkboxes = document.querySelectorAll('input[name="productno"]');

            checkboxes.forEach(function(checkbox) {
                checkbox.checked = source.checked;
            });
        }

        function checkDelete() {
            const checked = document.querySelectorAll('input[name="productno"]:checked');

            if (checked.length === 0) {
                alert('삭제할 상품을 선택하세요.');
                return false;
            }

            return confirm('선택한 상품을 삭제하시겠습니까?');
        }
    </script>
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
                        <strong>주문관리</strong>
                        <ul>
                            <li><a href="<%= request.getContextPath() %>/admin/order/order_list.do">주문목록</a></li>
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
                    <h3>상품목록</h3>

                    <form action="<%= request.getContextPath() %>/admin/product/product_list.do"
                          method="post"
                          onsubmit="return checkDelete();">

                        <table>
                            <thead>
                                <tr>
                                    <th>
                                        <input type="checkbox" onclick="toggleAll(this)">
                                    </th>
                                    <th>사진</th>
                                    <th>상품번호</th>
                                    <th>상품명</th>
                                    <th>구분</th>
                                    <th>가격</th>
                                    <th>재고</th>
                                    <th>등록일</th>
                                </tr>
                            </thead>

                            <tbody>
                            <%
                                if (products != null && !products.isEmpty()) {
                                    for (ProductDTO product : products) {

                                        String img = product.getProductimg();

                                        if (img == null || img.trim().isEmpty()) {
                                            img = request.getContextPath() + "/images/market_item1.jpg";
                                        } else {
                                            img = request.getContextPath() + img;
                                        }
                            %>
                                        <tr>
                                            <td>
                                                <input type="checkbox" name="productno" value="<%= product.getProductno() %>">
                                            </td>

                                            <td>
                                                <img src="<%= img %>"
                                                     alt="<%= product.getProductname() %>"
                                                     style="width:60px; height:60px; object-fit:cover;">
                                            </td>

                                            <td><%= product.getProductno() %></td>
                                            <td><%= product.getProductname() %></td>
                                            <td><%= product.getProductcate() %></td>
                                            <td><%= df.format(product.getProductprice()) %>원</td>
                                            <td><%= product.getProductstock() %></td>
                                            <td><%= product.getRdate() %></td>
                                        </tr>
                            <%
                                    }
                                } else {
                            %>
                                    <tr>
                                        <td colspan="8">등록된 상품이 없습니다.</td>
                                    </tr>
                            <%
                                }
                            %>
                            </tbody>
                        </table>

                        <div class="register_buttons">
                            <button type="submit" class="cancel_btn">선택삭제</button>
                            <a href="<%= request.getContextPath() %>/admin/product/product_register.do" class="submit_btn">상품등록</a>
                        </div>

                    </form>

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