<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.List"%>
<%@page import="com.ducks.demys.boot.vo.Calendar"%>
<c:set var="calendar" value="${calendar}" />
<%@include file="../common/Mainhead.jsp"%>
<!-- fullcalendar 설정관련 script -->
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" >
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" ></script> -->
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

  .modal-box {
    background-color: #fff;
    border-radius: 8px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.15);
    padding: 0;
    width: 400px;
  }

  .modal-title {
    font-weight: bold;
    font-size: 1.2rem;
    margin-bottom: 20px;
  }

  .modal-row {
    margin-bottom: 15px;
  }

  .modal-label {
    font-weight: bold;
    width: 30%;
    padding-right: 10px;
  }

  .modal-input {
    width: 70%;
    padding: 5px;
    border: 1px solid #ccc;
    border-radius: 4px;
  }

  .modal-select {
    width: 70%;
    padding: 5px;
    border: 1px solid #ccc;
    border-radius: 4px;
    background-color: #fff;
    color: #333;
  }

  .modal-action {
    text-align: right;
    margin-top: 20px;
  }

  .modal-action .btn {
    cursor: pointer;
    padding: 8px 16px;
    background-color: #153A66;
    color: #fff;
    border-radius: 4px;
    font-weight: bold;
  }

  .modal-action .btn:hover {
    background-color: #122c53;
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

						<div id="contextMenu" class="dropdown dropdown-right">
						  <label tabindex="0" class="btn m-1">Click</label>
						  <ul tabindex="0" class="dropdown-content menu p-2 shadow bg-base-100 rounded-box w-52" role="menu" aria-labelledby="dropdownMenu" style="display:block;position:static;margin-bottom:5px;">
						    <label for="my-modal"><a tabindex="-1" href="#"></a>일정등록</label>
						    <li><a tabindex="-1" href="#" data-role="close">Close</a></li>
						  </ul>
						</div>
				</div>
		</div>
</div>







<!-- The button to open modal -->

<!-- 모달 -->
<!-- Put this part before </body> tag -->
<input type="checkbox" id="my-modal" class="modal-toggle" />
<div class="modal">
	


  <!-- 모달바디 -->
  <div class="modal-box">
  
  				<div class="flex" style="background-color: #153A66;">
						<div class="navbar text-neutral-content" style="width: 100%; padding: 0px; min-height: 1rem; height: 50px;">
								<div class="text-white" style="font-weight: bold; font-size: 1rem; margin-right: auto;">
										&nbsp;&nbsp;&nbsp;&nbsp;DEMYS PMS</div>
						</div>
				</div>
  
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
                                <input class="inputModal" type="date" name="edit-start" id="edit-start" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-end">끝</label>
                                <input class="inputModal" type="date" name="edit-end" id="edit-end" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-type">구분</label>
                                <select class="inputModal" name="edit-type" id="edit-type">
                                    <option value="" style="color:#D25565;">선택</option>
                                    <option value="1" style="color:#D25565;">프로젝트</option>
                                    <option value="2" style="color:#9775fa;">개인업무</option>
                                </select>
                            </div>
                        </div>
                        
                        <div class="row" id="projectNameContainer" style="display: none;">
						  <div class="col-xs-12">
						    <label class="col-xs-4" for="project-name">프로젝트명</label>
						    <input class="inputModal" type="text" name="project-name" id="project-name">
						  </div>
						</div>
                        
                        
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-sc_status">일정구분</label>
                                <select class="inputModal" name="sc_status" id="edit-sc_status">
                                    <option value="내부회의" >내부회의</option>
                                    <option value="외부회의" >외부회의</option>
                                    <option value="출장">출장</option>
                                    <option value="휴가">휴가</option>
                                    <option value="기타">기타</option>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-desc">내용</label>
                                <textarea rows="4" cols="50" class="textarea textarea-bordered" name="edit-desc"
                                    id="edit-desc"></textarea>
                                
                            </div>
                        </div>
    	
    
    
    
    
    <!-- 모달닫기버튼  -->
    <div class="modal-action">
      <label for="my-modal" class="btn" >Yay!</label>
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
        var initialLocaleCode = 'ko';
        var localeSelectorEl = document.getElementById('locale-selector');
 
            $(document).ready(function (){
 
                    var calendarEl = document.getElementById('calendar');
                    calendar = new FullCalendar.Calendar(calendarEl, {
                        initialDate: '2023-05-23',
                        initialView: 'timeGridWeek',
                        headerToolbar: {
                            left: 'prev,next today',
                            center: 'title',
                            right: 'dayGridMonth,timeGridWeek,listWeek'
                        },
                        businessHours: false,
                        navLinks: true,
                        editable: true,
                        selectable: true,
                        locale: 'ko',
                        nowIndicator: true,
                        dayMaxEvents: true, // this allows things to be dropped onto the calendar
 
                        // eventAdd: function () { // 이벤트가 추가되면 발생하는 이벤트
                        //     // console.log()
                        // },
 
                        /**
                         * 드래그로 이벤트 수정하기
                         */
                        eventDrop: function (info){
                            console.log(info);
                            if(confirm("'"+ info.event.sc_NAME +"' 매니저의 일정을 수정하시겠습니까 ?")){
                            }
                            var events = new Array(); // Json 데이터를 받기 위한 배열 선언
                            var obj = new Object();
 
                            obj.sc_NAME = info.event._def.sc_NAME;
                            obj.sc_STARTDATE = info.event._instance.range.sc_STARTDATE;
                            obj.sc_ENDDATE = info.event._instance.range.sc_ENDDATE;
                            events.push(obj);
 
                            console.log(events);
                            $(function deleteData() {
                                $.ajax({
                                    url: "/calendar/updateCalendar",
                                    method: "POST",
                                    dataType: "json",
                                    data: JSON.stringify(events),
                                    contentType: 'application/json',
                                })
                            })
                        },
 
                        /**
                         * 드래그로 이벤트 추가하기
                         */
                        select: function (arg) { // 캘린더에서 이벤트를 생성할 수 있다.
 
                            var SC_NAME = prompt('일정을 입력해주세요.');
                            if (SC_NAME) {
                                calendar.addEvent({
                                	 sc_NAME: SC_NAME,
                                     start: info.startStr,
                                     end: info.endStr,
                                     sc_NUM : info.sc_NUM,
                                })
                            }
 
                            var allEvent = calendar.getEvents(); // .getEvents() 함수로 모든 이벤트를 Array 형식으로 가져온다. (FullCalendar 기능 참조)
 
                            var events = new Array(); // Json 데이터를 받기 위한 배열 선언
                            for (var i = 0; i < allEvent.length; i++) {
                                var obj = new Object();     // Json 을 담기 위해 Object 선언
                                // alert(allEvent[i]._def.title); // 이벤트 명칭 알람
                                obj.sc_NAME = allEvent[i]._def.title; // 이벤트 명칭  ConsoleLog 로 확인 가능.
                                obj.sc_STARTDATE = allEvent[i]._instance.range.sc_STARTDATE; // 시작
                                obj.sc_ENDDATE = allEvent[i]._instance.range.sc_ENDDATE; // 끝
 
                                events.push(obj);
                            }
                            var jsondata = JSON.stringify(events);
                            console.log(jsondata);
                            // saveData(jsondata);
 
                            $(function saveData(jsondata) {
                                $.ajax({
                                    url: "/calendar/registCalendar",
                                    method: "POST",
                                    dataType: "json",
                                    data: JSON.stringify(events),
                                    contentType: 'application/json',
                                })
                                    .done(function (result) {
                                    	 alert("일정이 등록되었습니다.");
                                    })
                                    .fail(function (request, status, error) {
                                    	alert("에러 발생: " + error);
                                    });
                                calendar.unselect()
                            });
                        },
 
                        /**
                         * 이벤트 선택해서 삭제하기
                         */
                        eventClick: function (info){
                            if(confirm("'"+ info.event.sc_NAME +"'삭제하시겠습니까 ?")){
                                // 확인 클릭 시
                                info.event.remove();
                            }
 
                            console.log(info.event);
                            var events = new Array(); // Json 데이터를 받기 위한 배열 선언
                            var obj = new Object();
                            	obj.sc_NUM = info.event.sc_NUM;
                                obj.sc_NAME = info.event._def.sc_NAME;
                                obj.sc_STARTDATE = info.event._instance.range.sc_STARTDATE;
                                events.push(obj);
 
                            console.log(events);
                            $(function deleteData(){
                                $.ajax({
                                    url: "/calendar/removeCalender",
                                    method: "POST",
                                    dataType: "json",
                                    data: JSON.stringify(events),
                                    contentType: 'application/json',
                                })
                            })
                        },
                        // eventRemove: function (obj) { // 이벤트가 삭제되면 발생하는 이벤트
                        //
                        // },
                        
                    });
                    calendar.render();
        });
 
 
 
 
    </script>



