var eventModal = $('#eventModal');

var modalTitle = $('.modal-title');
var editAllDay = $('#edit-allDay');
var editTitle = $('#edit-title');
var editStart = $('#edit-start');
var editEnd = $('#edit-end');
var editType = $('#edit-type');
var editColor = $('#edit-color');
var editDesc = $('#edit-desc');
var editSC_Status=$('#edit-sc_status');

var addBtnContainer = $('.modalBtnContainer-addEvent');
var modifyBtnContainer = $('.modalBtnContainer-modifyEvent');


/* ****************
 *  새로운 일정 생성
 * ************** */
var newEvent = function (start, end, eventType) {

    $("#contextMenu").hide(); //메뉴 숨김

    modalTitle.html('새로운 일정');
    editType.val(eventType).prop('selected', true);
    editTitle.val('');
    editStart.val(start);
    editEnd.val(end);
    editDesc.val('');
    
    addBtnContainer.show();
    modifyBtnContainer.hide();
    eventModal.modal('show');

    /******** 임시 RAMDON ID - 실제 DB 연동시 삭제 **********/
    var eventId = 1 + Math.floor(Math.random() * 1000);
    /******** 임시 RAMDON ID - 실제 DB 연동시 삭제 **********/

    //새로운 일정 저장버튼 클릭
    $('#save-event').unbind();
    $('#save-event').on('click', function () {

	//등록폼에 나올정보ㅠ 위에서 꼭 정의해주기ㅠ멍충아 변수명 틀리지말고ㅠ
        var eventData = {
            _id: eventId,
            title: editTitle.val(),
            start: editStart.val(),
            end: editEnd.val(),
            description: editDesc.val(),
            type: editType.val(),
            username: '사나',
            backgroundColor: editColor.val(),
            sc_status: editSC_Status.val(),
            textColor: '#ffffff',
            allDay: false
        };

        if (eventData.start > eventData.end) {
            alert('끝나는 날짜가 앞설 수 없습니다.');
            return false;
        }

        if (eventData.title === '') {
            alert('일정명은 필수입니다.');
            return false;
        }

        var realEndDay;

        if (editAllDay.is(':checked')) {
            eventData.start = moment(eventData.start).format('YYYY-MM-DD');
            //render시 날짜표기수정
            eventData.end = moment(eventData.end).add(1, 'days').format('YYYY-MM-DD');
            //DB에 넣을때(선택)
            realEndDay = moment(eventData.end).format('YYYY-MM-DD');

            eventData.allDay = true;
        }

        $("#calendar").fullCalendar('renderEvent', eventData, true);
        eventModal.find('input, textarea').val('');
        editAllDay.prop('checked', false);
        eventModal.modal('hide');

        //새로운 일정 저장
       /* $.ajax({
            type: "post",
            url: "",
            data: {
                //.....
            },
            success: function (response) {
                //DB연동시 중복이벤트 방지를 위한
                //$('#calendar').fullCalendar('removeEvents');
                //$('#calendar').fullCalendar('refetchEvents');
            }
        });*/
        
       $.ajax({
		    type: "post",
		    url: "<%=request.getContextPath()%>/calendar/schedule", // 서버의 API 엔드포인트 URL을 입력하세요.
		    data: {
		        title: "새로운 일정",
		        start: "2023-05-18T10:00",
		        end: "2023-05-18T12:00",
		        type: "카테고리1",
		        username: "나연",
		        backgroundColor: "#9775fa",
		        sc_status: "프로젝트",
		        textColor: "#ffffff",
		        allDay: false
		        // 필요한 다른 일정 속성들을 추가하세요.
		    },
		    success: function (response) {
		        // 서버로부터의 응답을 처리하는 로직을 작성하세요.
		        // 캘린더에 일정을 추가하는 코드를 작성하세요.
		        $('#calendar').fullCalendar('renderEvent', response, true);
		    }
		}); 
        
        
        
        
        
        
    });
};