<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.List"%>
<%@page import="com.ducks.demys.boot.vo.Calendar"%>
<c:set var="calendar" value="${calendar}" />
<%@include file="../common/Mainhead.jsp"%>
<!-- fullcalendar 설정관련 script -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css">
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.7/index.global.min.js'></script>

<!-- fullcalendar 언어 설정관련 script -->
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<link rel="stylesheet" href="../resource/css/calendar/caln.css" />

<style>
.fc-event {
	margin-top: 5px;
	cursor: move;
}

#calendar {
	height: 500px;
	min-height: 600px;
	width: 80%;
	float: right;
	margin-top: 50px;
}
</style>

<div id='external-events' style="margin-top: 50px; float: left; width: 20%; padding-right: 30px; padding-left: 20px;">
		<p>
				<strong>드래그로 달력에 표시</strong>
		</p>

		<div class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event'>
				<div class='fc-event-main'>프로젝트</div>
		</div>
		<div class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event'>
				<div class='fc-event-main'>개인업무</div>
		</div>


		<p>
				<input type='checkbox' id='drop-remove' />
				<label for='drop-remove'>드래그 앤 드롭후 제거</label>
		</p>

		<!-- DB에 저장하기위해서는 전체저장이 필요하다 -->
		<div class="button_all">
				<div>
						<button onclick="allSave();" style="cursor: pointer; width: 100px; height: 35px; background-color: #ccc;">전체
								저장</button>

						<button class="add-button" type="button" onclick="OpenWindow('/calendar/registFormCalendar','일정등록',750,650);">일정등록</button>
				</div>
		</div>
</div>


<section class="mt-5">
		<div class="container mx-auto px-3">
				<div id='calendar'></div>
		</div>
</section>


	<label for="my-modal" class="btn">open modal</label>

	<div class="modal">
	  <div class="modal-box">
	    <h3 class="font-bold text-lg">Congratulations random Internet user!</h3>
	    <p class="py-4">You've been selected for a chance to get one year of subscription to use Wikipedia for free!</p>
	    <div class="modal-action">
	      <label for="my-modal" class="btn">Yay!</label>
	    </div>
	  </div>
	  </div>






<script>
    $(function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
            headerToolbar: {
                left: 'prev,next today',
                center: 'title',
                right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
            },
            businessHours: false,
            navLinks: true,
            editable: true,
            selectable: true,
            locale: 'ko',
            nowIndicator: true,
            dayMaxEvents: true,
            select: function(info) {
                var SC_NAME = prompt('일정을 입력해주세요.');
                if (SC_NAME) {
                    var event = {
                    		
                        sc_NAME: SC_NAME,
                        start: info.startStr,
                        end: info.endStr
                    };
                    calendar.addEvent(event);
                    saveData(event);
                }
            },
            events: function(info, successCallback, failureCallback) {
                var url = "/calendar/getCalendar";
                $.ajax({
                    type: 'GET',
                    cache: false,
                    url: url,
                    dataType: 'json',
                    contentType: "application/x-www-form-urlencoded; charset=UTF-8",
                    success: function(param) {
                    	console.log(param);
                        var events = [];
                        $.each(param, function(index, date) {
                            events.push({
                            	title: date.sc_NAME,
                            	start: date.sc_STARTDATE,
                            	end: date.sc_ENDDATE
                            });
                        });
                        
                        successCallback(events);
                    },
                    error: function(xhr, status, error) {
                        failureCallback(xhr, status, error);
                    }
                });
            }
        });
           
        function saveData(event) {
            var url = "/calendar/registCalendar";
            $.ajax({
                type: "POST",
                url: url,
                data: JSON.stringify(event),
                contentType: "application/json",
                success: function(data) {
                    alert("일정이 등록되었습니다.");
                },
                error: function(xhr, status, error) {
                    alert("에러 발생: " + error);
                }
            });
        }
       calendar.render(); 
    });
    
</script>





