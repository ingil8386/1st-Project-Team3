<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="DTO.EventDTO" %>

<%
    List<EventDTO> events = (List<EventDTO>) request.getAttribute("events");
%>

<%!
    public String escapeJs(String str) {
        if (str == null) return "";
        return str.replace("\\", "\\\\")
                  .replace("\"", "\\\"")
                  .replace("'", "\\'")
                  .replace("\r", "")
                  .replace("\n", "\\n");
    }
%>

<jsp:include page="/WEB-INF/views/common/_head.jsp" />

<style>
    .calendar {
        width: 100%;
        margin-top: 20px;
        margin-bottom: 16px;
    }

    .fc {
        font-size: 12px;
    }

    .fc .fc-toolbar-title {
        font-size: 20px;
    }

    .fc .fc-button {
        font-size: 12px;
        padding: 4px 8px;
    }
</style>

<script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.15/index.global.min.js"></script>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        const calendarEl = document.getElementsByClassName('calendar')[0];

        const calendar = new FullCalendar.Calendar(calendarEl, {
            initialView: 'dayGridMonth',
            selectable: true,
            height: 500,

            events: [
                <%
                    if (events != null && !events.isEmpty()) {
                        for (int i = 0; i < events.size(); i++) {
                            EventDTO event = events.get(i);
                %>
                            {
                                id: "<%= event.getEventno() %>",
                                title: "<%= escapeJs(event.getTitle()) %>",
                                start: "<%= event.getStartdate() %>",
                                allDay: true
                            }<%= i < events.size() - 1 ? "," : "" %>
                <%
                        }
                    }
                %>
            ],

            dateClick: function(info) {
                const memo = prompt('메모를 입력하세요:');

                if (memo) {
                    fetch('<%= request.getContextPath() %>/event/calendar/save.do', {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'
                        },
                        body: 'title=' + encodeURIComponent(memo)
                            + '&startdate=' + encodeURIComponent(info.dateStr)
                    })
                    .then(response => response.text())
                    .then(result => {
                        if (result.trim() == 'success') {

                            if (memo == '추석') {
                                calendar.addEvent({
                                    title: memo,
                                    start: info.dateStr,
                                    allDay: true,
                                    backgroundColor: 'red',
                                    borderColor: 'red',
                                    textColor: 'white'
                                });
                            } else {
                                calendar.addEvent({
                                    title: memo,
                                    start: info.dateStr,
                                    allDay: true
                                });
                            }

                            alert('메모가 저장되었습니다. 삭제는 새로고침 후 가능합니다.');

                        } else {
                            alert('메모 저장 실패');
                        }
                    })
                    .catch(error => {
                        console.log(error);
                        alert('메모 저장 중 오류가 발생했습니다.');
                    });
                }
            },

            eventClick: function(info) {
                const eventno = info.event.id;

                if (!eventno) {
                    alert('방금 추가한 메모는 새로고침 후 삭제 가능합니다.');
                    return;
                }

                const result = confirm('"' + info.event.title + '" 메모를 삭제하시겠습니까?');

                if (!result) {
                    return;
                }

                fetch('<%= request.getContextPath() %>/event/calendar/delete.do', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'
                    },
                    body: 'eventno=' + encodeURIComponent(eventno)
                })
                .then(response => response.text())
                .then(result => {
                    if (result.trim() == 'success') {
                        info.event.remove();
                        alert('메모가 삭제되었습니다.');
                    } else {
                        alert('메모 삭제 실패');
                    }
                })
                .catch(error => {
                    console.log(error);
                    alert('메모 삭제 중 오류가 발생했습니다.');
                });
            }
        });

        calendar.render();
    });
</script>

<div id="sub">
    <div>
        <img src="<%= request.getContextPath() %>/images/sub_top_tit4.png" alt="CROP TALK">
    </div>

    <section class="event">
        <aside>
            <img src="<%= request.getContextPath() %>/images/sub_aside_cate4_tit.png" alt="이벤트"/>

            <ul class="lnb">
                <li class="on">
                    <a href="<%= request.getContextPath() %>/event/calendar.do">이벤트</a>
                </li>
            </ul>

        </aside>

        <article id="board">
            <nav>
                <img src="<%= request.getContextPath() %>/images/sub_nav_tit_cate4_tit1.png" alt="이벤트"/>
                <p>
                    HOME > 이벤트 > <em>이벤트</em>
                </p>
            </nav>

            <!-- 캘린더 시작 -->
            <div class="calendar"></div>
            <!-- 캘린더 끝 -->

        </article>
    </section>

</div>

<jsp:include page="/WEB-INF/views/common/_tail.jsp" />