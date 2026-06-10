<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<jsp:include page="/WEB-INF/views/common/_head.jsp" />
<head>
    <meta charset="UTF-8">
    <title>팜스토리::상품목록</title>
    <link rel="stylesheet" href="/farmstory/css/list.css">
</head>
<body>
    <div id="container">
        <div id="sub">
            <div><img src="/farmstory/images/sub_top_tit2.png" alt="MARKET"></div>
            
            <section class="market">
                <aside>
                    <img src="/farmstory/images/sub_aside_cate2_tit.png" alt="장보기">
                    <ul class="lnb">
                        <li class="on"><a href="/farmstory/market/list.do">장보기</a></li>
                    </ul>
                </aside>
                
                <article class="list">
                    <nav>
                        <img src="/farmstory/images/sub_nav_tit_cate2_tit1.png" alt="장보기">
                        <p>
                            HOME &gt; 장보기 &gt; <em>장보기</em>
                        </p>
                    </nav>

                    <p class="sort">
                        <a href="#" class="on">전체(10) |</a>
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
                            <tr>
                                <td>
                                    <a href="/farmstory/market/detail.do"><img src="/farmstory/images/market_item1.jpg" class="thumbnail" alt="사과 500g"></a>
                                </td>
                                <td class="type">과일</td>
                                <td class="title"><a href="#">사과 500g</a></td>
                                <td class="discount">10%</td>
                                <td class="point">400P</td>
                                <td class="price">
                                    <strong>3,600</strong>
                                    <del>4,000</del>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a href="/farmstory/market/detail.do"><img src="/farmstory/images/market_item2.jpg" class="thumbnail" alt="배 5kg"></a>
                                </td>
                                <td class="type">과일</td>
                                <td class="title"><a href="#">전남 완주 배 5kg</a></td>
                                <td class="discount">10%</td>
                                <td class="point">400P</td>
                                <td class="price">
                                    <strong>3,600</strong>
                                    <del>4,000</del>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a href="/farmstory/market/detail.do"><img src="/farmstory/images/market_item3.jpg" class="thumbnail" alt="방울토마토"></a>
                                </td>
                                <td class="type">과일</td>
                                <td class="title"><a href="#">방울 토마토</a></td>
                                <td class="discount">10%</td>
                                <td class="point">400P</td>
                                <td class="price">
                                    <strong>3,600</strong>
                                    <del>4,000</del>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a href="/farmstory/market/detail.do"><img src="/farmstory/images/market_item6.jpg" class="thumbnail" alt="현미"></a>
                                </td>
                                <td class="type">곡류</td>
                                <td class="title"><a href="#">무농약 현미</a></td>
                                <td class="discount">10%</td>
                                <td class="point">400P</td>
                                <td class="price">
                                    <strong>3,600</strong>
                                    <del>4,000</del>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a href="/farmstory/market/detail.do"><img src="/farmstory/images/market_item7.jpg" class="thumbnail" alt="샐러드"></a>
                                </td>
                                <td class="type">야채</td>
                                <td class="title"><a href="#">팜스토리 하루야채 샐러드</a></td>
                                <td class="discount">10%</td>
                                <td class="point">400P</td>
                                <td class="price">
                                    <strong>3,600</strong>
                                    <del>4,000</del>
                                </td>
                            </tr>
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