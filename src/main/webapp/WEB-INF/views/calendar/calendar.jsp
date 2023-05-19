<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="pageTitle" value="캘린더" />
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
	var calendar = null;


	document.addEventListener('DOMContentLoaded', function() {
		
		var Draggable = FullCalendar.Draggable;
		var calendarEl = document.getElementById('calendar');
		var containerEl = document.getElementById('external-events');
		var checkbox = document.getElementById('drop-remove');
		
		
		 // initialize the external events
	    // -----------------------------------------------------------------

	    new Draggable(containerEl, {
	      itemSelector: '.fc-event',
	      eventData: function(eventEl) {
	        return {
	          title: eventEl.innerText
	        };
	      }
	    });
		
		
		
		$.get('../calendar/getCalendar', {
			isAjax : 'Y',
			dataType : "json"
		}, function(data) {
			 calendar = new FullCalendar.Calendar(calendarEl, {
				headerToolbar : {
					left : 'prev,next today',
					center : 'title',
					right : 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
				},
				businessHours: false, // 주말 선택여부
				navLinks : true, // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크
				editable : true, // 수정 가능
				selectable : true,// 달력 일자 드래그 설정가능
				locale : 'ko', // 한국어 설정
				nowIndicator : true, // 현재 시간 마크
				dayMaxEvents : true, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)				
				events : data,
				select : function(arg) { // 달력 칸 선택시 : add event
					var title = prompt('Event Title:');
					if (title) {
						calendar.addEvent({
							title : title,
							start : arg.start,
							end : arg.end,
							allDay : arg.allDay
						})
					}
					calendar.unselect();
				},
				/* eventClick : function(arg) { // 해당 이벤트 클릭 시 : remove event
					if (confirm('일정을 삭제하시겠습니까?')) {
						$.post('../caln/doDeleteSchedule', {
							id : arg.event.id
						}, function(data) {
							if (data.success) {
								arg.event.remove();
								alert(data.msg);
							} else {
								if (data.msg) {
									alert(data.msg);
								}
							}

						}, 'json');
					}
				} */
			});
			calendar.render();
		}, 'json');
	});
	
	 //데이터를 db에 저장하려면 1. 전체이벤트 데이터 추출 2. ajax로 서버에 전송
 	function allSave()
 	 {
 	 var allEvent = calendar.getEvents();
 	 
 	 var events = new Array();
 	 for(var i=0; i < allEvent.length; i++)
 		 {
 		 
 		 var obj = new Object();
 		 
 		obj.title = allEvent[i]._def.title; //이벤트 명칭
 		obj.allDay = allEvent[i]._def.allDay; //하루종일의 이벤트인지 알려주는 boolean값
 		obj.start = allEvent[i]._instance.range.start; //시작날짜 및 시간
 		obj.end = allEvent[i]._instance.range.end; //마침날짜 및 시간
 		 
 		 events.push(obj);
 		 }
 	 
 	 	var jsondata = JSON.stringify(events);
 	 	console.log(jsondata);
 	 	
 	 	function savedata(data) {
 	 	  // 데이터를 서버로 전송하거나 필요한 작업을 수행하는 코드 작성
 	 	  console.log('Data saved:', data);
 	 	}
 	 	
 	 	{
 	 		$.ajax({
 	 			type:'GET',
 	 			url:"/calendar/getCalendar",
 	 			data:{"alldata": jsondata},
 	 			dataType: 'text',
 	 			async:false //동기방식
 	 		})
 	 		.done(function(result){
 	 		})
 	 		.fail(function(request, status, error){
 	 			alert("에러발생;"+error);
 	 		})
 	 	}
 	 	
 	 
 	}
	
</script>
