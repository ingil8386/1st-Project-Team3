<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<jsp:include page="/WEB-INF/views/common/_head.jsp" />
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>팜스토리::이벤트</title>
    <link rel="stylesheet" href="/farmstory/css/event.css"/>
    <style>
        .calendar {
            margin-bottom: 16px;
        }
    </style>
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.15/index.global.min.js'></script>
    <script>

      document.addEventListener('DOMContentLoaded', function() {
        const calendarEl = document.getElementsByClassName('calendar')[0];
        const calendar = new FullCalendar.Calendar(calendarEl, {
            initialView: 'dayGridMonth',
            selectable: true,
            dateClick: function(info) {
                const memo = prompt('메모를 입력하세요:');
                if (memo) {
                    // 메모를 저장하고 화면에 표시
                    if(memo == '추석'){
                        calendar.addEvent({
                            title: memo,
                            start: info.date,
                            allDay: true,
                            backgroundColor: 'red',  // 배경색을 빨간색으로 설정
                            borderColor: 'red',      // 테두리 색을 빨간색으로 설정
                            textColor: 'white'     
                            });
                    }else{
                        calendar.addEvent({
                            title: memo,
                            start: info.date,
                            allDay: true
                        });
                    }
                }
            }
        });
        calendar.render();
      });

    </script>    
</head>
<body>
    <div id="container">
        <div id="sub">
            <div><img src="/farmstory/images/sub_top_tit4.png" alt="CROP TALK"></div>
            <section class="event">
                <aside>
                    <img src="/farmstory/images/sub_aside_cate4_tit.png" alt="이벤트"/>

                    <ul class="lnb">
                        <li class="on"><a href="/farmstory/event/calendar.jsp">이벤트</a></li>
                    </ul>

                </aside>
                <article id="board">
                    <nav>
                        <img src="/farmstory/images/sub_nav_tit_cate4_tit1.png" alt="이벤트"/>
                        <p>
                            HOME > 이벤트 > <em>이벤트</em>
                        </p>
                    </nav>

                    <!-- 캘린더 시작 -->
                    <!-- 실제 달력 출력 -->
                    <div class="calendar"></div>
                                        
                    <!-- 샘플 달력 출력
                    <img src="./images/calendar.png" alt="샘플달력"/>
                    -->
                    
                    <!-- 내용 끝 -->

                </article>
            </section>

        </div>
		<jsp:include page="/WEB-INF/views/common/_tail.jsp" />
    </div>    
</body>
</html>