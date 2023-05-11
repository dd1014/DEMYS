<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="pageTitle" value="캘린더" />
<%@ include file="Mainhead.jsp"%>
<link rel="stylesheet" href="/resource/css/calendar/calendar.css" >




<section class="calendar_head">
		

		<div class="flex">
		<div id="calendarTitle"></div>
		<div class="calendarTitle_button">
				<button type="button" class="btn btn-default js-calendar-prev">&lt;</button>
				<button type="button" class="btn btn-default js-calendar-next">&gt;</button>
				<button type="button" class="btn btn-default js-calendar-month-view">Month</button>
				<button type="button" class="btn btn-default js-calendar-week-view">Week</button>
		</div>
		</div>
		<div id="calendar"></div>
</section>

<script>
$(function () {
	  
	  // Function declaration to support header text
	  function setCalendarTitleText() {
	    var calendarTitle = document.getElementById('calendarTitle');    
	    var viewName = calendar.getViewName();
	    var curDate = calendar.getDate()
	    if (viewName === 'day') {
	      calendarTitle.innerText = (curDate.getMonth()+1) + '월 ' + curDate.getDate() + '월 ' + curDate.getFullYear()
	    } else {
	      calendarTitle.innerText = (curDate.getMonth()+1) + '월 ' + curDate.getFullYear()
	    }
	  }
	  // Example schedules
	  var schedules = [
	    {
	      id: '1',
	      calendarId: '1',
	      title: 'Halloween',
	      category: 'allday',
	      color: '#000000',
	      bgColor:'#eb6123',
	      isAllDay: true,
	      isVisible: true,
	      isPrivate: false,
	      start: '2023-10-30T00:00:00Z',
	    },
	    {
	      id: '2',
	      calendarId: '2',
	      title: 'Event ID: 2',
	      category: 'time',
	      isAllDay: false,
	      isVisible: true,
	      isPrivate: false,
	      start: '2018-10-23T17:30:00-05:00',
	      end: '2018-10-23T19:00:00-05:00'
	    },
	    {
	      id: '3',
	      calendarId: '2',
	      title: 'Event ID: 3',
	      category: 'time',
	      isAllDay: false,
	      isVisible: true,
	      isPrivate: false,
	      start: '2018-10-24T17:30:00-05:00',
	      end: '2018-10-24T19:00:00-05:00'
	    },
	    {
	      id: '4',
	      calendarId: '2',
	      title: 'Event ID: 4',
	      category: 'time',
	      isAllDay: false,
	      isVisible: true,
	      isPrivate: false,
	      start: '2018-10-01T17:30:00-05:00',
	      end: '2018-10-3T19:00:00-05:00'
	    }
	  ];
	  
	  
	  
	  // Initialize the calendar
	  var calendar = new tui.Calendar('#calendar', {
	    defaultView: 'month',
	    isReadOnly: false,
	    useDetailPopup: true,
	    useCreationPopup: true,
	  });
	  
	  // Add events to the calendar
	  calendar.createSchedules(schedules, true);
	    
	  // Bind some commonly used events
	  $('.js-calendar-next').on('click', function() {
	    calendar.next();
	    setCalendarTitleText();
	  });

	  $('.js-calendar-prev').on('click', function() {
	    calendar.prev();
	    setCalendarTitleText();
	  });

	  $('.js-calendar-today').on('click', function() {
	    calendar.today();
	    setCalendarTitleText();
	  });

	  $('.js-calendar-day-view').on('click', function() {
	    calendar.changeView('day', true);
	    setCalendarTitleText();
	  });

	  $('.js-calendar-week-view').on('click', function() {
	    calendar.changeView('week', true);
	    setCalendarTitleText();
	  });

	  $('.js-calendar-month-view').on('click', function() {
	    calendar.changeView('month', true);
	    setCalendarTitleText();
	  });
	  
	  setCalendarTitleText();
	});
	


	
	
</script>









</body>
</html>