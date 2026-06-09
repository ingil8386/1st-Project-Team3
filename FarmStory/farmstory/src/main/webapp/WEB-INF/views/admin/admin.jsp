<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <title>관리자::메인</title>
    <link rel="stylesheet" href="/farmstory/css/admin.css">
</head>

<body>

    <div id="wrapper">

        <!-- 헤더 -->
        <header>
            <div class="header_inner">
                <a href="/farmstory/admin/admin.do">
                    <img src="https://farmstory.vercel.app/admin/images/admin_logo.jpg" alt="관리자 로고">
                </a>

                <div class="top_menu">
                    <a href="/farmstory/index.do">HOME</a>
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
                        <strong>상품관리</strong>
                        <ul>
                            <li><a href="/farmstory/admin/product/product_list.do">상품목록</a></li>
                            <li><a href="/farmstory/admin/product/product_register.do">상품등록</a></li>
                        </ul>
                    </div>

                    <div class="menu">
                        <strong>주문관리</strong>
                        <ul>
                            <li><a href="/farmstory/admin/order/order_list.do">주문목록</a></li>
                        </ul>
                    </div>

                    <div class="menu">
                        <strong>회원관리</strong>
                        <ul>
                            <li><a href="/farmstory/admin/user/user_list.do">회원목록</a></li>
                        </ul>
                    </div>
                </aside>

                <!-- 관리자 메인 콘텐츠 -->
                <section class="content">
                    <h3>관리자 메인</h3>

                    <!-- 상품현황 -->
                    <article class="status_box">
                        <div class="status_title">
                            <h4>상품현황</h4>
                            <a href="/farmstory/admin/user/user_list.do">+ 더보기</a>
                        </div>

                        <table>
                            <thead>
                                <tr>
                                    <th>상품번호</th>
                                    <th>상품명</th>
                                    <th>구분</th>
                                    <th>가격</th>
                                    <th>재고</th>
                                    <th>등록일</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>1011</td>
                                    <td>사과 500g</td>
                                    <td>과일</td>
                                    <td>4,000원</td>
                                    <td>100</td>
                                    <td>2023-01-01</td>
                                </tr>
                                <tr>
                                    <td>1011</td>
                                    <td>사과 500g</td>
                                    <td>과일</td>
                                    <td>4,000원</td>
                                    <td>100</td>
                                    <td>2023-01-01</td>
                                </tr>
                                <tr>
                                    <td>1011</td>
                                    <td>사과 500g</td>
                                    <td>과일</td>
                                    <td>4,000원</td>
                                    <td>100</td>
                                    <td>2023-01-01</td>
                                </tr>
                            </tbody>
                        </table>
                    </article>

                    <!-- 주문현황 -->
                    <article class="status_box">
                        <div class="status_title">
                            <h4>주문현황</h4>
                            <a href="#">+ 더보기</a>
                        </div>

                        <table>
                            <thead>
                                <tr>
                                    <th>주문번호</th>
                                    <th>상품명</th>
                                    <th>판매가격</th>
                                    <th>수량</th>
                                    <th>배송비</th>
                                    <th>합계</th>
                                    <th>주문자</th>
                                    <th>주문일</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>1011</td>
                                    <td>사과 500g</td>
                                    <td>4,000원</td>
                                    <td>2개</td>
                                    <td>3,000원</td>
                                    <td>8,000원</td>
                                    <td>홍길동</td>
                                    <td>2023-01-01</td>
                                </tr>
                                <tr>
                                    <td>1011</td>
                                    <td>사과 500g</td>
                                    <td>4,000원</td>
                                    <td>2개</td>
                                    <td>3,000원</td>
                                    <td>8,000원</td>
                                    <td>홍길동</td>
                                    <td>2023-01-01</td>
                                </tr>
                                <tr>
                                    <td>1011</td>
                                    <td>사과 500g</td>
                                    <td>4,000원</td>
                                    <td>2개</td>
                                    <td>3,000원</td>
                                    <td>8,000원</td>
                                    <td>홍길동</td>
                                    <td>2023-01-01</td>
                                </tr>
                            </tbody>
                        </table>
                    </article>

                    <!-- 회원현황 -->
                    <article class="status_box">
                        <div class="status_title">
                            <h4>회원현황</h4>
                            <a href="#">+ 더보기</a>
                        </div>

                        <table>
                            <thead>
                                <tr>
                                    <th>회원아이디</th>
                                    <th>이름</th>
                                    <th>닉네임</th>
                                    <th>휴대폰</th>
                                    <th>이메일</th>
                                    <th>등급</th>
                                    <th>회원가입일</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>a101</td>
                                    <td>김유신</td>
                                    <td>유신123</td>
                                    <td>010-1234-1001</td>
                                    <td>yusin123@naver.com</td>
                                    <td>2</td>
                                    <td>2023-01-01</td>
                                </tr>
                                <tr>
                                    <td>a101</td>
                                    <td>김유신</td>
                                    <td>유신123</td>
                                    <td>010-1234-1001</td>
                                    <td>yusin123@naver.com</td>
                                    <td>2</td>
                                    <td>2023-01-01</td>
                                </tr>
                                <tr>
                                    <td>a101</td>
                                    <td>김유신</td>
                                    <td>유신123</td>
                                    <td>010-1234-1001</td>
                                    <td>yusin123@naver.com</td>
                                    <td>2</td>
                                    <td>2023-01-01</td>
                                </tr>
                            </tbody>
                        </table>
                    </article>

                </section>
            </div>
        </main>

        <!-- 푸터 -->
        <footer>
            <p>FARMSTORY ADMINISTRATOR Version 1.0.1</p>
            <p>Copyrightⓒ 김철학(개발에반하다.) All rights reserved.</p>
        </footer>
    </div>

</body>

</html>