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
<jsp:include page="/WEB-INF/views/common/_head.jsp" />
<head>
    <meta charset="UTF-8">
    <title>팜스토리::상품목록</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/list.css">
</head>
<body>
    <div id="container">
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
						
						            // 1. 이미지가 없으면 기본 이미지
						            if (img == null || img.trim().isEmpty()) {
						                img = request.getContextPath() + "/images/market_item1.jpg";
						            } else {
						                // 2. 이미지가 있으면 매핑한 외부 경로(/images)를 직접 사용
						                img = img; 
						            }
						%>
						    <tr>
						        <td>
						            <a href="<%= request.getContextPath() %>/market/detail.do?productno=<%= product.getProductno() %>">
						                <img src="<%= img %>" class="thumbnail" alt="<%= product.getProductname() %>">
						            </a>
						        </td>
						        
						        <td class="type"><%= product.getProductcate() %></td>
						        <td class="title">
						            <a href="<%= request.getContextPath() %>/market/detail.do?productno=<%= product.getProductno() %>">
						                <%= product.getProductname() %>
						            </a>
						        </td>
						        <td class="discount"><%= product.getProductdiscount() %>%</td>
						        <td class="point"><%= df.format(product.getProductpoint()) %>P</td>
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
		<jsp:include page="/WEB-INF/views/common/_tail.jsp" />
    </div>    
</body>
</html>