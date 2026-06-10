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
    <title>팜스토리::상품목록</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/list.css">
</head>
<body>
    <div id="container">
        <header>
            <a href="<%= request.getContextPath() %>/index.do" class="logo">
                <img src="<%= request.getContextPath() %>/images/logo.png" alt="로고">
            </a>

            <p>
                <a href="<%= request.getContextPath() %>/index.do">HOME |</a>
                <a href="<%= request.getContextPath() %>/user/login.do">로그인</a>|
                <a href="<%= request.getContextPath() %>/user/terms.do">회원가입</a>|               
                <a href="#">나의정보 </a>|
                <a href="#">로그아웃 </a>|
                <a href="<%= request.getContextPath() %>/admin/admin.do">관리자 |</a>
                <a href="#">고객센터</a>
            </p>

            <img src="<%= request.getContextPath() %>/images/head_txt_img.png" alt="3만원 이상 무료배송" class="text">
            
            <ul class="gnb">
                <li><a href="<%= request.getContextPath() %>/about/greeting.do">팜스토리소개</a></li>
                <li><a href="<%= request.getContextPath() %>/market/list.do">장보기</a></li>
                <li><a href="<%= request.getContextPath() %>/story/intro.do">농작물이야기</a></li>
                <li><a href="<%= request.getContextPath() %>/event/calendar.do">이벤트</a></li>
                <li><a href="<%= request.getContextPath() %>/community/notice.do">커뮤니티</a></li>
            </ul>
        </header>

        <div id="sub">
            <div>
                <img src="<%= request.getContextPath() %>/images/sub_top_tit2.png" alt="MARKET">
            </div>
            
            <section class="market">
                <aside>
                    <img src="<%= request.getContextPath() %>/images/sub_aside_cate2_tit.png" alt="장보기">

                    <ul class="lnb">
                        <li class="on">
                            <a href="<%= request.getContextPath() %>/market/list.do">장보기</a>
                        </li>
                    </ul>
                </aside>
                
                <article class="list">
                    <nav>
                        <img src="<%= request.getContextPath() %>/images/sub_nav_tit_cate2_tit1.png" alt="장보기">
                        <p>
                            HOME &gt; 장보기 &gt; <em>장보기</em>
                        </p>
                    </nav>

                    <p class="sort">
                        <a href="<%= request.getContextPath() %>/market/list.do" class="on">
                            전체(<%= products == null ? 0 : products.size() %>) |
                        </a>
                        <a href="#">과일 |</a>
                        <a href="#">야채 |</a>
                        <a href="#">곡류</a>
                    </p>
                    
                    <table border="0">
                        <thead>
                            <tr>
                                <th>이미지</th>
                                <th>종류</th>
                                <th>상품명</th>
                                <th>할인</th>
                                <th>포인트</th>
                                <th>판매가격</th>
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
                                            <a href="<%= request.getContextPath() %>/market/detail.do?productno=<%= product.getProductno() %>">
                                                <img src="<%= img %>"
                                                     class="thumbnail"
                                                     alt="<%= product.getProductname() %>">
                                            </a>
                                        </td>

                                        <td class="type">
                                            <%= product.getProductcate() %>
                                        </td>

                                        <td class="title">
                                            <a href="<%= request.getContextPath() %>/market/detail.do?productno=<%= product.getProductno() %>">
                                                <%= product.getProductname() %>
                                            </a>
                                        </td>

                                        <td class="discount">
                                            <%= product.getProductdiscount() %>%
                                        </td>

                                        <td class="point">
                                            <%= df.format(product.getProductpoint()) %>P
                                        </td>

                                        <td class="price">
                                            <strong><%= df.format(product.getProductfinalprice()) %></strong>
                                            <del><%= df.format(product.getProductprice()) %></del>
                                        </td>
                                    </tr>
                        <%
                                }
                            } else {
                        %>
                                <tr>
                                    <td colspan="6">등록된 상품이 없습니다.</td>
                                </tr>
                        <%
                            }
                        %>
                        </tbody>
                    </table>

                    <p class="paging">
                        <a href="#">&lt;</a>
                        <a href="#" class="on">[1]</a>
                        <a href="#">[2]</a>
                        <a href="#">[3]</a>
                        <a href="#">[4]</a>
                        <a href="#">[5]</a>
                        <a href="#">&gt;</a>
                    </p>
                </article>
            </section>
        </div>
        
        <footer>
            <img src="<%= request.getContextPath() %>/images/footer_logo.png" alt="로고">
            <p>
                (주)팜스토리 / 사업자등록번호 123-45-67890 / 통신판매업신고 제 2013-팜스토리구-123호 / 벤처기업확인 서울지방중소기업청 제 012345678-9-01234호<br>
                등록번호 팜스토리01234 (2013.04.01) / 발행인 : 홍길동<br>
                대표 : 홍길동 / 이메일 : email@mail.mail / 전화 : 01) 234-5678 / 경기도 성남시 잘한다구 신난다동 345<br>
                <em>Copyright(C)홍길동 All rights reserved.</em>
            </p>
        </footer>
    </div>    
</body>
</html>