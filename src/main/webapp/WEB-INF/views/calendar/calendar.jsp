<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.List"%>
<%@page import="com.ducks.demys.boot.vo.Schedule"%>
<c:set var="calendar" value="${calendar}" />
<%@include file="../common/Mainhead.jsp"%>
<!-- fullcalendar 설정관련 script -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css">
<script	src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.7/index.global.min.js'></script>

<!-- fullcalendar 언어 설정관련 script -->
<script
	src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>
<link rel="stylesheet" href="../resource/css/calendar/caln.css" />

<style>
.fc-event{
	margin-top:5px;
	cursor:move;
} 

#calendar{
height:500px;
min-height:600px;
width:80%;
float:right;
margin-top:50px;
}
</style>

	 <div id='external-events' style="margin-top:50px;float:left;width:20%;padding-right:30px;padding-left:20px;">
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
    	<button onclick="allSave();" style="cursor:pointer;width:100px; height:35px; background-color:#ccc;">전체 저장</button>
    
		<button class="add-button" type="button" onclick="click_add();">일정등록</button>
	</div>
 	</div>
  </div>


<section class="mt-5">
	<div class="container mx-auto px-3">
		<div id='calendar'></div>
		
	</div>
</section>

	<script>
	(function() {
		$(function() {
			var JsonData = "1";
			// calendar element 취득
			var calendarEl = $('#calendar')[0];
			// full-calendar 생성하기
			var calendar = new FullCalendar.Calendar(calendarEl,
					{
						// 해더에 표시할 툴바
						headerToolbar : {
							left : 'prev,next today',
							center : 'title',
							right : 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
						},
						/* initialDate : '2023-03-13', // 초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보인다.) */
						locale : 'ko', // 한국어 설정
						timeZone : 'Asia/Seoul',
						editable : true, // 수정 가능
						/* droppable: true,  // 드래그 가능
						drop: function(arg) { // 드래그 엔 드롭 성공시
						  // 드래그 박스에서 아이템을 삭제한다.
						   manage_Schedule('regist');
						  arg.draggedEl.parentNode.removeChild(arg.draggedEl);
						}, */

						events : function(info, successCallback,failureCallback) {
							var url = "/calendar/getCalendar";
							$.ajax({
										type : 'get',
										cache : false,
										url : url,
										dataType : 'json',
										contentType : "application/x-www-form-urlencoded; charset=UTF-8",
										success : function(param) {
											var events = [];
											console.log(param);
											$.each(param, function(index, date) {
																console.log(date);
																console.log(date.sc_NAME);
																console.log(index);
																events.push({
																				title : date.sc_NAME,
																				start : date.sc_STARTDATE,
																				end : date.sc_ENDDATE
																				 });
															})
															
											//alert(JSON.stringify(events));
											successCallback(events);
										}
									});
						}

					});
			// 캘린더 랜더링

			calendar.render();
		});
	})();
	</script>
