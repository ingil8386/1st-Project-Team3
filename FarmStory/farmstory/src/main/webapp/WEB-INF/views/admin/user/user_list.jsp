<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <title>관리자::회원목록</title>
    <link rel="stylesheet" href="/FarmStory/farmstory/src/main/webapp/css/admin.css">
</head>

<body>

    <div id="wrapper">

        <!-- 헤더 -->
        <header>
            <div class="header_inner">
                <a href="../admin.do">
                    <img src="https://farmstory.vercel.app/admin/images/admin_logo.jpg" alt="관리자 로고">
                </a>

                <div class="top_menu">
                    <a href="../admin.do">HOME</a>
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

                <!-- 사이드 메뉴 -->
                <aside>
                    <h3>주요기능</h3>

                    <div class="menu">
                        <h4>상품관리</h4>
                        <ul>
                            <li><a href="../product/product_list.do">상품목록</a></li>
                            <li><a href="../product/product_register.do">상품등록</a></li>
                        </ul>
                    </div>

                    <div class="menu">
                        <h4>주문관리</h4>
                        <ul>
                            <li><a href="../order/order_list.do">주문목록</a></li>
                        </ul>
                    </div>

                    <div class="menu">
                        <h4>회원관리</h4>
                        <ul>
                            <li><a href="../user/user_list.do">회원목록</a></li>
                        </ul>
                    </div>
                </aside>

                <!-- 콘텐츠 -->
                <section class="content">
                    <h3>회원목록</h3>

                    <table>
                        <thead>
                            <tr>
                                <th>
                                    <input type="checkbox">
                                </th>

                                <th>아이디</th>
                                <th>이름</th>
                                <th>별명</th>
                                <th>이메일</th>
                                <th>휴대폰</th>
                                <th>등급</th>
                                <th>가입일</th>
                                <th>확인</th>
                            </tr>
                        </thead>

                        <tbody>
                            <tr>
                                <th>
                                    <input type="checkbox">

                                </th>

                                <td>a101</td>
                                <td>김유신</td>
                                <td>유신101</td>
                                <td>yusin101@naver.com</td>
                                <td>010-1234-1001</td>
                                <td>
                                    <select>
                                        <option value="1" selected>1</option>
                                        <option value="2">2</option>
                                        <option value="3">3</option>
                                        <option value="4">4</option>
                                        <option value="5">5</option>
                                    </select>
                                </td>

                                <td>2023-01-01 13:06:14</td>
                                <td><a href="#">[상세확인]</a></td>
                            </tr>

                            <tr>
                                <th>
                                    <input type="checkbox">

                                </th>

                                <td>a102</td>
                                <td>김춘추</td>
                                <td>춘추102</td>
                                <td>chunchu102@naver.com</td>
                                <td>010-1234-1002</td>

                                <td> <select>
                                        <option value="1">1</option>
                                        <option value="2">2</option>
                                        <option value="3" selected>3</option>
                                        <option value="4">4</option>
                                        <option value="5">5</option>
                                    </select></td>

                                <td>2023-01-02 13:06:14</td>
                                <td><a href="#">[상세확인]</a></td>
                            </tr>

                            <tr>
                                <th>
                                    <input type="checkbox">

                                </th>

                                <td>a103</td>
                                <td>장보고</td>
                                <td>보고103</td>
                                <td>bogo103@naver.com</td>
                                <td>010-1234-1003</td>
                                <td>
                                    <select>
                                        <option value="1" selected>1</option>
                                        <option value="2">2</option>
                                        <option value="3">3</option>
                                        <option value="4">4</option>
                                        <option value="5">5</option>
                                    </select>
                                </td>

                                <td>2023-01-03 13:06:14</td>
                                <td><a href="#">[상세확인]</a></td>
                            </tr>
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