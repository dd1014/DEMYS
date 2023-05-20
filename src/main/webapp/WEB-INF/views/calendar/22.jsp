<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="pageTitle" value="캘린더" />

    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>FullCalendar Example</title>




	<link href="../resource/fullcalendar-5.11.5/lib/main.min.css" rel="stylesheet" />
    <script src="../resource/fullcalendar-5.11.5/lib/main.min.js"></script>
    <link rel="stylesheet" href="../resource/vendor/css/fullcalendar.min.css" />
    <link rel="stylesheet" href="../resource/vendor/css/bootstrap.min.css">
    <link rel="stylesheet" href='../resource/vendor/css/select2.min.css' />
    <link rel="stylesheet" href='../resource/vendor/css/bootstrap-datetimepicker.min.css' />
    <link rel="stylesheet" href="../resource/css/fullcalendar/fullcalendar.css">

</head>

<body>
    <div class="container">
		
        <!-- 일자 클릭시 메뉴오픈 -->
        <div id="contextMenu" class="dropdown clearfix">
            <ul class="dropdown-menu dropNewEvent" role="menu" aria-labelledby="dropdownMenu"
                style="display:block;position:static;margin-bottom:5px;">
                <li><a tabindex="-1" href="#">일정등록</a></li>
                <li class="divider"></li>
                <li><a tabindex="-1" href="#" data-role="close">Close</a></li>
            </ul>
        </div>

        <div id="wrapper" style="">
            <div id="loading"></div>
            <div id="calendar"></div>
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
                                <select class="inputModal" name="edit-type" id="edit-type">
                                    <option value="프로젝트">프로젝트</option>
                                    <option value="개인업무">개인업무</option>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-sc_status">일정구분</label>
                                <select class="inputModal" name="sc_status" id="edit-sc_status">
                                    <option value="내부회의" style="color:#D25565;">내부회의</option>
                                    <option value="외부회의" style="color:#9775fa;">외부회의</option>
                                    <option value="출장" style="color:#ffa94d;">출장</option>
                                    <option value="휴가" style="color:#74c0fc;">휴가</option>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-desc">내용</label>
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



        <div class="panel panel-default" style="">

            <div class="panel-heading">
                <h3 class="panel-title">필터</h3>
            </div>

            <div class="panel-body">

                <div class="col-lg-6">
                    <label for="calendar_view">구분별</label>
                    <div class="input-group">
                        <select class="filter" id="type_filter" multiple="multiple">
                            <option value="프로젝트">프로젝트</option>
                            <option value="개인업무">개인업무</option>
                        </select>
                    </div>
                </div>

                <div class="col-lg-6">
                    <label for="calendar_view">등록자별</label>
                    <div class="input-group">
                        <label class="checkbox-inline"><input class='filter' type="checkbox" value="정연"
                                checked>사용자1</label>
                        <label class="checkbox-inline"><input class='filter' type="checkbox" value="다현"
                                checked>사용자2</label>
                        <label class="checkbox-inline"><input class='filter' type="checkbox" value="사나"
                                checked>사용자3</label>
                        <label class="checkbox-inline"><input class='filter' type="checkbox" value="나연"
                                checked>사용자4</label>
                        <label class="checkbox-inline"><input class='filter' type="checkbox" value="지효"
                                checked>사용자5</label>
                    </div>
                </div>

            </div>
        </div>
        <!-- /.filter panel -->
    </div>
    <!-- /.container -->

    <script src="../resource/vendor/js/jquery.min.js"></script>
    <script src="../resource/vendor/js/bootstrap.min.js"></script>
    <script src="../resource/vendor/js/moment.min.js"></script>
    <script src="../resource/vendor/js/fullcalendar.min.js"></script>
    <script src="../resource/vendor/js/ko.js"></script>
    <script src="../resource/vendor/js/select2.min.js"></script>
    <script src="../resource/vendor/js/bootstrap-datetimepicker.min.js"></script>
    <script src="../resource/js/fullcalendar.js"></script>
    <script src="../resource/js/addEvent.js"></script>
    <script src="../resource/js/editEvent.js"></script>
    <script src="../resource/js/etcSetting.js"></script>
</body>

</html>