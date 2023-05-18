<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="pageTitle" value="캘린더" />
<%@ include file="../common/Mainhead.jsp"%>
    <meta charset="utf-8" />
    <link href="../resource/fullcalendar-5.11.5/lib/main.min.css" rel="stylesheet" />
    <script src="../resource/fullcalendar-5.11.5/lib/main.min.js"></script>
    <link rel="stylesheet" href='../resource/vendor/css/select2.min.css' />
    <link rel="stylesheet" href='../resource/vendor/css/bootstrap-datetimepicker.min.css' />
<!--    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.5/locales-all.js"></script> -->
 
<!--   	<link href="../resource/css/fullcalendar/fullcalendar.css" rel="stylesheet" />
 --> 
 
 <!-- 풀캘린더 사이드 있는거임 걍 드래그해서 일정 등록가능 -->
 
<style>
.fc-event{
	margin-top:5px;
	cursor:move;
} 	

#calendar{
	height:600px;
	min-height:500px;
	margin-top:20px;
}	
</style>

  </head>
  <body>
  	
  	
  	
  	
  	
  	
  	 
  	
  	
  	
  	
  	
  	
  	
  	
  	
  	
  	
  	 <div id='external-events' style="margin-top:20px;float:left;width:15%;padding-right:30px;padding-left:20px;">
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
    <div>
    	<button onclick="allSave();" style="cursor:pointer;width:110px; height:40px; background-color:#ccc;">전체 저장</button>
    </div>
    
  </div>
  	
  	  <!-- 일정 추가 MODAL -->
        <div class="modal fade" tabindex="-1" role="dialog" id="eventModal">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title"></h4>
                    </div>
                    <div class="modal-body">

                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-allDay">하루종일</label>
                                <input class='allDayNewEvent' id="edit-allDay" type="checkbox">
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-title">일정명</label>
                                <input class="inputModal" type="text" name="edit-title" id="edit-title"
                                    required="required" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-start">시작</label>
                                <input class="inputModal" type="text" name="edit-start" id="edit-start" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-end">끝</label>
                                <input class="inputModal" type="text" name="edit-end" id="edit-end" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-type">구분</label>
                                <select class="inputModal" type="text" name="edit-type" id="edit-type">
                                    <option value="카테고리1">카테고리1</option>
                                    <option value="카테고리2">카테고리2</option>
                                    <option value="카테고리3">카테고리3</option>
                                    <option value="카테고리4">카테고리4</option>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-color">색상</label>
                                <select class="inputModal" name="color" id="edit-color">
                                    <option value="#D25565" style="color:#D25565;">빨간색</option>
                                    <option value="#9775fa" style="color:#9775fa;">보라색</option>
                                    <option value="#ffa94d" style="color:#ffa94d;">주황색</option>
                                    <option value="#74c0fc" style="color:#74c0fc;">파란색</option>
                                    <option value="#f06595" style="color:#f06595;">핑크색</option>
                                    <option value="#63e6be" style="color:#63e6be;">연두색</option>
                                    <option value="#a9e34b" style="color:#a9e34b;">초록색</option>
                                    <option value="#4d638c" style="color:#4d638c;">남색</option>
                                    <option value="#495057" style="color:#495057;">검정색</option>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-desc">설명</label>
                                <textarea rows="4" cols="50" class="inputModal" name="edit-desc"
                                    id="edit-desc"></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer modalBtnContainer-addEvent">
                        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
                        <button type="button" class="btn btn-primary" id="save-event">저장</button>
                    </div>
                    <div class="modal-footer modalBtnContainer-modifyEvent">
                        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                        <button type="button" class="btn btn-danger" id="deleteEvent">삭제</button>
                        <button type="button" class="btn btn-primary" id="updateEvent">저장</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->
  	
  	
  <div style="float:left;width:70%;margin-top:30px;margin-left:100px;">
    <div id='calendar'></div>
  </div>
  
   
 
 
  <script>
 	 var calendar = null;
  
 	 document.addEventListener('DOMContentLoaded', function() {
	    var Calendar = FullCalendar.Calendar;
	    var Draggable = FullCalendar.Draggable;

	    var containerEl = document.getElementById('external-events');
	    var calendarEl = document.getElementById('calendar');
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

	    // initialize the calendar
	    // -----------------------------------------------------------------

	    calendar = new Calendar(calendarEl, {
	      headerToolbar: {
	        left: 'prev,next today',
	        center: 'title',
	        right: 'dayGridMonth,timeGridWeek'
	      },
	      editable: true, //수정가능여부 false로바꾸면 이벤트 드래그후 재배정불가 true상태여야 변경이가능
	      droppable: true, // this allows things to be dropped onto the calendar
	      drop: function(info) {
	        // is the "remove after drop" checkbox checked?
	        if (checkbox.checked) {
	          // if so, remove the element from the "Draggable Events" list
	          info.draggedEl.parentNode.removeChild(info.draggedEl);
	        }
	      },
	      locale:'ko',
	      dateClick : function(info) {
				
	    	  $('#eventModal').modal('show');

			},
			eventClick : function() {

				alert('일정 클릭!');

			}, 
	    });
		

		// 데이터 삽입방식

		calendar.addEvent({'title':'프로젝트', 'start':'2023-05-16T15:00'});

		calendar.addEvent({'title':'프로젝트', 'start':'2023-05-18T22:00'});

		calendar.addEvent({'title':'개인업무', 'start':'2023-05-20T09:00'});

	    
	    
	    calendar.render();
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
 	 	
 	 	savedata(jsondata)
 	 	{
 	 		$.ajax({
 	 			type:'POST',
 	 			url:"",
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
 	 
 	

 	 
  
  
  
    /*   document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
          initialView: 'dayGridMonth',
          locale:'ko'
        });
        calendar.render();
      }); */

    </script>
  
  
  </body>
</html>
