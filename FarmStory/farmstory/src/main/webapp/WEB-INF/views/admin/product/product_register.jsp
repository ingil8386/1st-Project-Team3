<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>관리자::상품등록</title>
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
                    <h3>상품등록</h3>

                    <form action="<%= request.getContextPath() %>/admin/product/product_register.do"
                          method="post"
                          enctype="multipart/form-data">

                        <table class="register_table">
                            <tr>
                                <th>상품명</th>
                                <td>
                                    <input type="text" name="productname" required>
                                </td>
                            </tr>

                            <tr>
                                <th>종류</th>
                                <td>
                                    <select name="productcate" required>
                                        <option value="">종류</option>
                                        <option value="과일">과일</option>
                                        <option value="야채">야채</option>
                                        <option value="곡류">곡류</option>
                                    </select>
                                </td>
                            </tr>

                            <tr>
                                <th>가격</th>
                                <td>
                                    <input type="text" name="productprice" required>
                                </td>
                            </tr>

                            <tr>
                                <th>할인</th>
                                <td>
                                    <select name="productdiscount">
                                        <option value="0">0%</option>
                                        <option value="5">5%</option>
                                        <option value="12">12%</option>
                                        <option value="15">15%</option>
                                        <option value="18">18%</option>
                                        <option value="20">20%</option>
                                    </select>
                                </td>
                            </tr>

                            <tr>
                                <th>포인트</th>
                                <td>
                                    <input type="text" name="productpoint" value="0">
                                    <span class="desc">포인트 입력</span>
                                </td>
                            </tr>

                            <tr>
                                <th>재고</th>
                                <td>
                                    <input type="text" name="productstock" required>
                                </td>
                            </tr>

                            <tr>
                                <th>상품이미지</th>
                                <td>
                                    <div class="file_row">
                                        <span>상품 이미지</span>
                                        <input type="file" name="thumb120" accept="image/*">
                                    </div>
                                </td>
                            </tr>

                            <tr>
                                <th>기타</th>
                                <td>
                                    <textarea name="productcontent"></textarea>
                                </td>
                            </tr>
                        </table>

                        <div class="register_buttons">
                            <a href="<%= request.getContextPath() %>/admin/product/product_list.do" class="cancel_btn">취소</a>
                            <button type="submit" class="submit_btn">상품등록</button>
                        </div>
                    </form>
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