<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="pageTitle" value="캘린더" />
<%@ include file="Mainhead.jsp"%>
<%-- <%@ include file="toastUiEditorLib.jspf" %> --%>
<link rel="stylesheet" type="text/css" href="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.css" />
<link rel="stylesheet" type="text/css" href="https://uicdn.toast.com/tui.time-picker/latest/tui-time-picker.css" />
<script src="https://uicdn.toast.com/tui.code-snippet/latest/tui-code-snippet.js"></script>
<script src="https://uicdn.toast.com/tui.dom/v3.0.0/tui-dom.js"></script>
<script src="https://uicdn.toast.com/tui.time-picker/latest/tui-time-picker.min.js"></script>
<script src="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.min.js"></script>
<script src="https://uicdn.toast.com/tui-calendar/latest/tui-calendar.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.20.1/moment.min.js"></script>

<style>
/*!
 * TOAST UI Calendar
 * @version 1.12.10 | Thu Jan 23 2020
 * @author NHN FE Development Lab <dl_javascript@nhn.com>
 * @license MIT
 */
.tui-full-calendar-layout {
  height: 100%;
  position: relative;
  box-sizing: border-box;
}
.tui-full-calendar-layout * {
  box-sizing: border-box;
}
.tui-full-calendar-dragging {
  cursor: move;
}
.tui-full-calendar-resizing {
  cursor: row-resize;
}
.tui-full-calendar-resizing-x {
  cursor: col-resize;
}
.tui-full-calendar-hidden {
  display: none !important;
}
.tui-full-calendar-invisible span {
  visibility: hidden;
}
.tui-full-calendar-clear {
  zoom: 1;
}
.tui-full-calendar-clear:after {
  content: '';
  display: block;
  clear: both;
}
.tui-full-calendar-scroll-y {
  overflow-y: scroll;
}
.tui-full-calendar-dot {
  display: inline-block;
  position: relative;
  top: -1px;
  content: '';
  width: 7px;
  height: 7px;
  border-radius: 50%;
}
.tui-full-calendar-holiday {
  color: #f00;
}
.tui-full-calendar-today {
  background: rgba(218,229,249,0.3);
}
.handle-x {
  background-position: center center;
  background-repeat: no-repeat;
  background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAgAAAAECAMAAACEE47CAAAACVBMVEX///////////+OSuX+AAAAA3RSTlMrQJG5H4EIAAAAEUlEQVR4AWNgYoRABhjEFAEAArQAIcHQcPsAAAAASUVORK5CYII=);
}
.handle-y {
  background-position: center center;
  background-repeat: no-repeat;
  background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAQAAAAICAMAAADp7a43AAAACVBMVEX///////////+OSuX+AAAAA3RSTlMrQJG5H4EIAAAAEUlEQVR4AWNgYmRiZABB/CwAAtgAIUTUNkMAAAAASUVORK5CYII=);
}
@media only screen and (-moz-min-device-pixel-ratio: 1.5), only screen and (-o-min-device-pixel-ratio: 3/2), only screen and (-webkit-min-device-pixel-ratio: 1.5), only screen and (min-devicepixel-ratio: 1.5), only screen and (min-resolution: 1.5dppx) {
  .handle-x {
    background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAICAMAAADHqI+lAAAACVBMVEX///////////+OSuX+AAAAA3RSTlMZK5EY+QKaAAAAGUlEQVR4AWNgYmJAwegCIMDIiIwxBKhhBgAcSABh8gN42gAAAABJRU5ErkJggg==);
    background-size: 8px 4px;
  }
  .handle-y {
    background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAgAAAAQCAMAAAAcVM5PAAAACVBMVEX///////////+OSuX+AAAAA3RSTlMEK5EMBzK5AAAAGElEQVR4AWNgYmIAYxgDBBgZQRjOoKcaABzQAGGjsIM/AAAAAElFTkSuQmCC);
    background-size: 4px 8px;
  }
}
.tui-full-calendar-month-week-item .tui-full-calendar-weekday-grid {
  overflow-y: hidden;
}
.tui-full-calendar-month-week-item .tui-full-calendar-weekday-schedules {
  overflow-y: visible;
  height: 0;
}
.tui-full-calendar-month-week-item .tui-full-calendar-weekday-schedule {
  margin: 0 10px;
}
.tui-full-calendar-month-week-item .tui-full-calendar-today {
  background: none;
}
.tui-full-calendar-month-week-item .tui-full-calendar-today .tui-full-calendar-weekday-grid-date-decorator {
  display: inline-block;
  width: 27px;
  height: 27px;
  line-height: 27px;
  text-align: center;
  background: #135de6;
  border-radius: 50%;
  color: #fff;
  font-weight: bold;
  margin-left: 2px;
}
.tui-full-calendar-weekday-container,
.tui-full-calendar-weekday-grid,
.tui-full-calendar-weekday-grid-line {
  height: 100%;
  min-height: inherit;
}
.tui-full-calendar-weekday-grid {
  position: absolute;
  width: 100%;
  overflow-y: scroll;
}
.tui-full-calendar-weekday-border {
  border-top: 1px solid #ddd;
}
.tui-full-calendar-weekday-container {
  position: relative;
}
.tui-full-calendar-weekday-container>div {
  height: 100%;
}
.tui-full-calendar-weekday-grid-line {
  position: absolute;
  padding: 3px;
}
.tui-full-calendar-weekday-grid-line .tui-full-calendar-weekday-grid-footer {
  position: absolute;
  bottom: 4px;
}
.tui-full-calendar-weekday-grid-line .tui-full-calendar-weekday-grid-date {
  display: inline-block;
  width: 27px;
  height: 27px;
  line-height: 27px;
  text-align: center;
}
.tui-full-calendar-weekday-grid-line .tui-full-calendar-weekday-grid-date-title {
  line-height: 27px;
  margin-right: 5px;
}
.tui-full-calendar-weekday-grid-line .tui-full-calendar-weekday-grid-more-schedules {
  float: right;
  display: inline-block;
  height: 27px;
  line-height: 27px;
  padding: 0 5px;
  text-align: center;
  font-size: 11px;
  font-weight: bold;
  color: #aaa;
}
.tui-full-calendar-weekday-creation {
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  position: absolute;
  overflow-y: scroll;
}
.tui-full-calendar-weekday-schedules {
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  position: absolute;
  font-size: 12px;
  overflow-y: scroll;
}
.tui-full-calendar-weekday-schedules-height-span {
  width: 1px;
  margin-left: -1px;
}
.tui-full-calendar-weekday-schedule-block {
  position: absolute;
}
.tui-full-calendar-weekday-schedule-block-dragging-dim {
  opacity: 0.3;
}
.tui-full-calendar-weekday-schedule {
  position: relative;
  margin: 0 10px 0 1px;
  cursor: pointer;
  border-left-style: solid;
  border-left-width: 3px;
}
.tui-full-calendar-weekday-schedule.tui-full-calendar-weekday-schedule-time {
  border-left-width: 0;
}
.tui-full-calendar-weekday-schedule.tui-full-calendar-weekday-schedule-time .tui-full-calendar-weekday-schedule-title {
  padding-left: 9px;
}
.tui-full-calendar-weekday-schedule-bullet {
  position: absolute;
  padding: 0;
  width: 6px;
  height: 6px;
  top: 6px;
  left: 0;
  border-radius: 50%;
}
.tui-full-calendar-weekday-schedule-bullet-focused {
  left: 10px;
  background: #fff;
}
.tui-full-calendar-weekday-schedule-title {
  display: block;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
  padding-left: 3px;
  font-weight: bold;
}
.tui-full-calendar-weekday-schedule-title-focused {
  padding-left: 16px;
}
.tui-full-calendar-weekday-schedule-cover {
  position: absolute;
  top: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0,0,0,0.2);
  box-shadow: 0 2px 6px 0 rgba(0,0,0,0.1);
}
.tui-full-calendar-weekday-exceed-left .tui-full-calendar-weekday-schedule {
  margin-left: 0;
  border-left-width: 0;
}
.tui-full-calendar-weekday-exceed-right .tui-full-calendar-weekday-schedule {
  margin-right: 0;
}
.tui-full-calendar-weekday-exceed-right .tui-full-calendar-weekday-resize-handle {
  display: none;
}
.tui-full-calendar-weekday-exceed-in-month {
  cursor: pointer;
}
.tui-full-calendar-weekday-exceed-in-month:hover {
  background-color: #f0f1f5;
}
.tui-full-calendar-weekday-exceed-in-week,
.tui-full-calendar-weekday-collapse-btn {
  position: absolute;
  bottom: 5px;
  margin-right: 5px;
  font-size: 12px;
  line-height: 14px;
  cursor: pointer;
  padding: 1px 5px;
  background-color: #fff;
  border: 1px solid #ddd;
  color: #000;
}
.tui-full-calendar-weekday-resize-handle {
  position: absolute;
  top: 0;
  right: 0;
  width: 6px;
  background-position: 3px center;
  cursor: col-resize;
  line-height: 18px;
}
.tui-full-calendar-weekday-filled {
  background-color: #e8e8e8 !important;
}
.tui-full-calendar-left {
  height: 100%;
  float: left;
  box-sizing: border-box;
  display: table;
}
.tui-full-calendar-left-content {
  display: table-cell;
  vertical-align: middle;
  text-align: right;
  font-size: 11px;
}
.tui-full-calendar-right {
  height: 100%;
  overflow-y: scroll;
  position: relative;
}
.tui-full-calendar-week-container {
  width: 100%;
  height: inherit;
  display: inline-block;
  font-size: 10px;
  min-height: 600px;
}
.tui-full-calendar-week-container .tui-full-calendar-today {
  background: none;
}
.tui-full-calendar-dayname {
  position: absolute;
  margin-left: -1px;
  height: 100%;
  overflow: hidden;
}
.tui-full-calendar-dayname.tui-full-calendar-today {
  font-weight: bold;
}
.tui-full-calendar-dayname-container {
  overflow-y: scroll;
}
.tui-full-calendar-dayname-leftmargin {
  position: relative;
  height: 100%;
}
.tui-full-calendar-dayname-date {
  font-size: 26px;
}
.tui-full-calendar-dayname-name {
  font-weight: bold;
  font-size: 12px;
}
.tui-full-calendar-daygrid-layout {
  height: 100%;
}
.tui-full-calendar-daygrid-layout .tui-full-calendar-right {
  overflow-y: hidden;
}
.tui-full-calendar-daygrid-guide-creation-block {
  position: absolute;
  top: 0;
  bottom: 0;
  z-index: 1;
}
.tui-full-calendar-timegrid-container {
  height: 100%;
  position: relative;
  overflow: hidden;
  overflow-y: scroll;
}
.tui-full-calendar-timegrid-container-split {
  height: 100%;
  position: relative;
  overflow: hidden;
}
.tui-full-calendar-timegrid-left {
  position: absolute;
}
.tui-full-calendar-timegrid-hour {
  position: relative;
  color: #555;
  box-sizing: border-box;
}
.tui-full-calendar-timegrid-hour:first-child span {
  display: none;
}
.tui-full-calendar-timegrid-hour:last-child {
  border-bottom: none;
}
.tui-full-calendar-timegrid-hour span {
  position: absolute;
  top: -11px;
  left: 0;
  right: 5px;
  text-align: right;
  line-height: 25px;
}
.tui-full-calendar-timegrid-right {
  position: relative;
}
.tui-full-calendar-timegrid-gridline {
  border-bottom: 1px solid #eee;
  box-sizing: border-box;
}
.tui-full-calendar-timegrid-gridline:last-child {
  border-bottom: none;
}
.tui-full-calendar-timegrid-schedules {
  position: absolute;
  width: 100%;
  height: 100%;
  top: 0;
  left: 0;
  cursor: pointer;
}
.tui-full-calendar-timegrid-hourmarker {
  position: absolute;
  width: 100%;
  display: table;
}
.tui-full-calendar-timegrid-hourmarker-line-left {
  position: absolute;
  min-height: 1px;
  left: 0;
}
.tui-full-calendar-timegrid-hourmarker-line-today {
  position: absolute;
  min-height: 1px;
}
.tui-full-calendar-timegrid-hourmarker-line-right {
  position: absolute;
  min-height: 1px;
  right: 0;
}
.tui-full-calendar-timegrid-hourmarker-time {
  padding-right: 5px;
  line-height: 12px;
  text-align: right;
  display: table-cell;
  vertical-align: bottom;
}
.tui-full-calendar-timegrid-todaymarker {
  position: absolute;
  text-indent: -9999px;
  width: 9px;
  height: 9px;
  background-color: #135de6;
  margin: -4px 0 0 -5px;
  border-radius: 50%;
}
.tui-full-calendar-timegrid-sticky-container {
  position: absolute;
  top: 0;
}
.tui-full-calendar-timegrid-timezone-label-container {
  position: absolute;
}
.tui-full-calendar-timegrid-timezone-label-cell {
  display: table;
}
.tui-full-calendar-timegrid-timezone-label {
  display: table-cell;
  vertical-align: middle;
  padding-right: 5px;
  text-align: right;
}
.tui-full-calendar-timegrid-timezone-close-btn {
  cursor: pointer;
  position: absolute;
  text-align: center;
  background-color: #fff;
}
.tui-full-calendar-timegrid-timezone-close-btn .tui-full-calendar-icon {
  width: 5px;
  height: 10px;
}
.tui-full-calendar-time-date {
  position: absolute;
  height: 100%;
  margin-left: -1px;
  box-sizing: content-box;
}
.tui-full-calendar-time-date:last-child {
  border-right: none;
  margin: 0;
}
.tui-full-calendar-time-date:last-child .tui-full-calendar-time-schedule,
.tui-full-calendar-time-date:last-child .tui-full-calendar-time-guide-creation {
  left: 0px;
}
.tui-full-calendar-time-date-schedule-block-wrap {
  position: relative;
  height: 100%;
}
.tui-full-calendar-time-date-schedule-block {
  position: absolute;
  right: 0px;
}
.tui-full-calendar-time-date-schedule-block-pending {
  opacity: 0.7;
}
.tui-full-calendar-time-date-schedule-block-dragging-dim {
  opacity: 0.3;
}
.tui-full-calendar-time-date-schedule-block-focused {
  box-shadow: 0 0 8px 0 rgba(0,0,0,0.2);
}
.tui-full-calendar-time-date-schedule-block-cover {
  position: absolute;
  top: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0,0,0,0.2);
  box-shadow: 0 2px 6px 0 rgba(0,0,0,0.1);
}
.tui-full-calendar-time-schedule {
  position: relative;
  left: 1px;
  height: 100%;
  overflow: hidden;
  font-size: 12px;
  font-weight: bold;
}
.tui-full-calendar-time-schedule-content {
  overflow: hidden;
  border-left-width: 3px;
  border-left-style: solid;
  padding: 1px 0 0 3px;
}
.tui-full-calendar-time-schedule-content-travel-time {
  font-weight: normal;
  font-size: 11px;
}
.tui-full-calendar-time-resize-handle {
  position: absolute;
  right: 0px;
  bottom: 0px;
  left: 0px;
  height: 5px;
  text-align: center;
  color: #fff;
  cursor: row-resize;
  background-position: center top;
}
.tui-full-calendar-time-guide-creation {
  position: absolute;
  right: 10px;
  left: 1px;
  padding: 3px;
}
.tui-full-calendar-time-guide-move .tui-full-calendar-time-schedule,
.tui-full-calendar-time-guide-resize .tui-full-calendar-time-schedule,
.tui-full-calendar-time-guide-move .tui-full-calendar-time-resize-handle,
.tui-full-calendar-time-guide-resize .tui-full-calendar-time-resize-handle {
  opacity: 0.8;
  z-index: 97;
}
.tui-full-calendar-time-guide-creation-label {
  cursor: default;
}
.tui-full-calendar-time-guide-bottom {
  position: absolute;
  bottom: 3px;
}
.tui-full-calendar-month {
  height: 100%;
  min-height: 600px;
}
.tui-full-calendar-month-dayname {
  width: 100%;
  position: absolute;
  font-size: 13px;
}
.tui-full-calendar-month-dayname-item {
  height: 100%;
  font-weight: bold;
}
.tui-full-calendar-month-week-item {
  position: relative;
}
.tui-full-calendar-month-week-item>div {
  height: 100%;
}
.tui-full-calendar-month-more {
  height: inherit;
  min-width: 280px;
  min-height: 150px;
}
.tui-full-calendar-month-more-title {
  position: relative;
}
.tui-full-calendar-month-more-title-day {
  font-size: 23px;
  color: #333;
}
.tui-full-calendar-month-more-title-day-label {
  font-size: 12px;
  color: #333;
}
.tui-full-calendar-month-more-close {
  position: absolute;
  right: 0;
  outline: 0;
  background: none;
  border: 0;
  font-size: 14px;
  line-height: 28px;
  padding: 0 7px;
  cursor: pointer;
}
.tui-full-calendar-month-more-list {
  overflow-y: auto;
}
.tui-full-calendar-month-more-schedule {
  cursor: pointer;
  display: block;
  overflow: hidden;
  white-space: nowrap;
  text-overflow: ellipsis;
  font-size: 12px;
}
.tui-full-calendar-month-guide-block {
  position: absolute;
}
.tui-full-calendar-month-weekday-schedule {
  margin-top: 2px;
}
.tui-full-calendar-month-creation-guide {
  top: 0;
  bottom: -1px;
  left: -1px;
  right: 0;
  position: absolute;
  z-index: 20;
}
.tui-full-calendar-month-guide-focused {
  box-shadow: 0 0 8px 0 rgba(0,0,0,0.2);
}
.tui-full-calendar-month-guide {
  position: relative;
  padding-left: 3px;
  line-height: 18px;
  overflow: hidden;
  white-space: nowrap;
  text-overflow: ellipsis;
}
.tui-full-calendar-month-guide-cover {
  width: 100%;
  position: absolute;
  top: -50%;
  left: -50%;
  background-color: rgba(0,0,0,0.2);
  box-shadow: 0 2px 6px 0 rgba(0,0,0,0.1);
}
.tui-full-calendar-month-exceed-left .tui-full-calendar-month-guide {
  margin-left: 0px;
}
.tui-full-calendar-month-exceed-right .tui-full-calendar-month-guide {
  margin-right: 0px;
}
.tui-full-calendar-month-exceed-right .tui-full-calendar-month-guide-handle {
  display: none;
}
.tui-full-calendar-month-guide-handle {
  position: absolute;
  top: 0;
  right: 3px;
  width: 6px;
  background-position: 3px center;
  cursor: col-resize;
}
.tui-full-calendar-vlayout-container {
  position: relative;
}
.tui-full-calendar-splitter {
  clear: left;
  cursor: row-resize;
}
.tui-full-calendar-splitter:hover {
  border-color: #999;
}
.tui-full-calendar-splitter-focused {
  background-color: #ddd;
  border: none;
}
.tui-full-calendar-splitter-guide {
  position: absolute;
  width: 100%;
  height: 3px;
  border: none;
  background-color: #e8e8e8;
}
.tui-full-calendar-popup {
  position: absolute;
  font-weight: 2.5;
  box-shadow: 0 2px 6px 0 rgba(0,0,0,0.1);
  clear: both;
}
.tui-full-calendar-popup-container {
  min-width: 474px;
  box-shadow: 0 2px 6px 0 rgba(0,0,0,0.1);
  background-color: #fff;
  border: solid 1px #d5d5d5;
  padding: 17px;
  border-radius: 2px;
}
.tui-full-calendar-popup-section {
  font-size: 0;
  min-height: 40px;
}
.tui-full-calendar-section-calendar {
  width: 176px;
}
.tui-full-calendar-section-calendar.tui-full-calendar-hide {
  height: 21px;
  visibility: hidden;
}
.tui-full-calendar-section-title {
  width: calc(100% - 36px);
  padding-right: 4px;
}
.tui-full-calendar-section-title input {
  width: 365px;
}
.tui-full-calendar-button.tui-full-calendar-section-private {
  height: 32px;
  padding: 8px;
  font-size: 0;
  margin-left: 4px;
}
.tui-full-calendar-section-private.tui-full-calendar-public .tui-full-calendar-ic-private {
  background: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAA4AAAAOCAYAAAAfSC3RAAAAAXNSR0IArs4c6QAAAKdJREFUKBVjYCATMKLri46Olvn9+3fX////HUByjIyMB1hZWcuWLl36BFktikaQpl+/fl0EKhBCVgRkv2NjY9NH1syErABkE1TTdqBCWRAG8reDxKBycOUoGmHOA2pIA5kOwiA2SDVMDq4TmREaGvofhJHFcLHhfgwLC9sKNNULl0KQODCgtq1atcobxIY7lZAmkGJkNXCNIAlSwIjSCApqIgJnK0wNALoOPwSpOcq0AAAAAElFTkSuQmCC) no-repeat;
}
.tui-full-calendar-section-start-date,
.tui-full-calendar-section-end-date {
  width: 176px;
}
.tui-full-calendar-section-start-date input,
.tui-full-calendar-section-end-date input {
  width: 139px;
}
.tui-full-calendar-section-start-date:hover .tui-full-calendar-popup-section-item,
.tui-full-calendar-section-end-date:hover .tui-full-calendar-popup-section-item,
.tui-full-calendar-section-start-date:focus .tui-full-calendar-popup-section-item,
.tui-full-calendar-section-end-date:focus .tui-full-calendar-popup-section-item,
.tui-full-calendar-section-start-date:hover .tui-datepicker,
.tui-full-calendar-section-end-date:hover .tui-datepicker,
.tui-full-calendar-section-start-date:focus .tui-datepicker,
.tui-full-calendar-section-end-date:focus .tui-datepicker {
  border-color: #bbb;
}
.tui-full-calendar-popup-section-item:focus {
  border-color: #bbb;
}
.tui-full-calendar-section-date-dash {
  font-size: 12px;
  color: #d5d5d5;
  height: 32px;
  padding: 0 4px;
  vertical-align: middle;
}
.tui-full-calendar-popup-section-item.tui-full-calendar-section-allday {
  border: none;
  padding: 0 0 0 8px;
  cursor: pointer;
}
.tui-full-calendar-popup-section-item.tui-full-calendar-section-location {
  display: block;
}
.tui-full-calendar-popup-section-item.tui-full-calendar-section-location input {
  width: 400px;
}
.tui-full-calendar-section-allday .tui-full-calendar-icon.tui-full-calendar-ic-checkbox {
  margin: 0;
}
.tui-full-calendar-popup-section-item.tui-full-calendar-section-allday .tui-full-calendar-content {
  padding-left: 4px;
}
.tui-full-calendar-section-state {
  width: 109px;
}
.tui-full-calendar-section-state .tui-full-calendar-content {
  width: 58px;
  text-overflow: ellipsis;
  overflow: hidden;
}
.tui-full-calendar-popup-section-item {
  height: 32px;
  padding: 0 9px 0 12px;
  border: 1px solid #d5d5d5;
  display: inline-block;
  font-size: 0;
  border-radius: 2px;
}
.tui-full-calendar-popup-section-item:hover {
  border-color: #bbb;
}
.tui-full-calendar-popup-section-item:focus {
  border-color: #bbb;
}
.tui-full-calendar-popup-section-item .tui-full-calendar-icon {
  position: relative;
}
.tui-full-calendar-icon.tui-full-calendar-ic-title {
  top: 2px;
}
.tui-full-calendar-popup-section-item .tui-full-calendar-content {
  text-align: left;
  display: inline-block;
  font-size: 12px;
  vertical-align: middle;
  position: relative;
  padding-left: 8px;
}
.tui-full-calendar-section-calendar .tui-full-calendar-dropdown-button .tui-full-calendar-content {
  width: 125px;
  text-overflow: ellipsis;
  overflow: hidden;
  top: -1px;
}
.tui-full-calendar-popup-section-item input {
  border: none;
  height: 30px;
  outline: none;
  display: inline-block;
}
.tui-full-calendar-popup-section-item input::placeholder {
  color: #bbb;
  font-weight: 300;
}
.tui-full-calendar-dropdown {
  position: relative;
}
.tui-full-calendar-dropdown:hover .tui-full-calendar-dropdown-button {
  border: 1px solid #bbb;
}
.tui-full-calendar-dropdown-button.tui-full-calendar-popup-section-item {
  height: 32px;
  font-size: 0;
  top: -1px;
}
.tui-full-calendar-dropdown-arrow {
  background: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAA4AAAAOCAYAAAAfSC3RAAAAAXNSR0IArs4c6QAAAHlJREFUKBVjYBgFOEOAEVkmPDxc89+/f6eAYjzI4kD2FyYmJrOVK1deh4kzwRggGiQBVJCELAZig8SQNYHEmEEEMrh69eo1HR0dfqCYJUickZGxf9WqVf3IakBsFBthklpaWmVA9mEQhrJhUoTp0NBQCRAmrHL4qgAAuu4cWZOZIGsAAAAASUVORK5CYII=) no-repeat;
}
.dropdown.open .tui-full-calendar-dropdown-arrow,
.tui-full-calendar-open .tui-full-calendar-dropdown-arrow {
  background: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAA4AAAAOCAYAAAAfSC3RAAAAAXNSR0IArs4c6QAAAIFJREFUKBVjYBj+gBmXF2NiYiTV1dV5rl279gWbGiZsgg0NDSw/f/5cCZRbBWJjU4PVRjExsR6g4nAgln/z5g3v1atXd6JrxtAYHh4e+v///z4khZa6urrXgJqvIYkxMCJzgJo0//37dwooxoMsDmR/YWJiMlu5cuV1NPFRLrYQAADMVCaUtbG7XwAAAABJRU5ErkJggg==) no-repeat;
}
.tui-full-calendar-dropdown-menu {
  position: absolute;
  top: 31px;
  padding: 4px 0;
  background-color: #fff;
  border: 1px solid #d5d5d5;
  border-top: none;
  border-radius: 0 0 2px 2px;
  width: 100%;
}
.tui-full-calendar-dropdown:hover .tui-full-calendar-dropdown-menu {
  border: 1px solid #bbb;
  border-top: none;
}
.tui-full-calendar-dropdown-menu {
  display: none;
}
.tui-full-calendar-open .tui-full-calendar-dropdown-menu {
  display: block;
}
.tui-full-calendar-dropdown-menu-item {
  height: 30px;
  border: none;
  cursor: pointer;
}
.tui-full-calendar-section-calendar .tui-full-calendar-dropdown-menu-item {
  width: 100%;
}
.tui-full-calendar-section-state .tui-full-calendar-dropdown-menu-item {
  width: 100%;
}
.tui-full-calendar-dropdown-menu-item:hover {
  background-color: rgba(81,92,230,0.05);
}
.tui-full-calendar-dropdown-menu-item .tui-full-calendar-content {
  line-height: 30px;
}
.tui-full-calendar-button.tui-full-calendar-popup-close {
  position: absolute;
  top: 10px;
  right: 10px;
  background-color: #fff;
  padding: 2px;
  border: none;
}
.tui-full-calendar-section-button-save {
  height: 36px;
}
.tui-full-calendar-popup-save {
  float: right;
}
.tui-full-calendar-popup-arrow-border,
.tui-full-calendar-popup-arrow-fill {
  position: absolute;
}
.tui-full-calendar-arrow-top .tui-full-calendar-popup-arrow-border {
  border-top: none;
  border-right: 8px solid transparent;
  border-bottom: 8px solid #d5d5d5;
  border-left: 8px solid transparent;
  left: calc(50% - 8px);
  top: -7px;
}
.tui-full-calendar-arrow-right .tui-full-calendar-popup-arrow-border {
  border-top: 8px solid transparent;
  border-right: none;
  border-bottom: 8px solid transparent;
  border-left: 8px solid #d5d5d5;
  top: calc(50% - 8px);
  right: -7px;
}
.tui-full-calendar-arrow-bottom .tui-full-calendar-popup-arrow-border {
  border-top: 8px solid #d5d5d5;
  border-right: 8px solid transparent;
  border-bottom: none;
  border-left: 8px solid transparent;
  left: calc(50% - 8px);
  bottom: -7px;
}
.tui-full-calendar-arrow-left .tui-full-calendar-popup-arrow-border {
  border-top: 8px solid transparent;
  border-right: 8px solid #d5d5d5;
  border-bottom: 8px solid transparent;
  border-left: none;
  top: calc(50% - 8px);
  left: -7px;
}
.tui-full-calendar-arrow-top .tui-full-calendar-popup-arrow-fill {
  border-top: none;
  border-right: 7px solid transparent;
  border-bottom: 7px solid #fff;
  border-left: 7px solid transparent;
  left: -7px;
  top: 1px;
}
.tui-full-calendar-arrow-right .tui-full-calendar-popup-arrow-fill {
  border-top: 7px solid transparent;
  border-right: none;
  border-bottom: 7px solid transparent;
  border-left: 7px solid #fff;
  top: -7px;
  right: 1px;
}
.tui-full-calendar-arrow-bottom .tui-full-calendar-popup-arrow-fill {
  border-top: 7px solid #fff;
  border-right: 7px solid transparent;
  border-bottom: none;
  border-left: 7px solid transparent;
  left: -7px;
  bottom: 1px;
}
.tui-full-calendar-arrow-left .tui-full-calendar-popup-arrow-fill {
  border-top: 7px solid transparent;
  border-right: 7px solid #fff;
  border-bottom: 7px solid transparent;
  border-left: none;
  top: -7px;
  left: 1px;
}
.tui-full-calendar-button {
  background: #fff;
  border: 1px solid #d5d5d5;
  border-radius: 2px;
  text-align: center;
  outline: none;
  font-size: 12px;
  cursor: pointer;
  color: #333;
}
.tui-full-calendar-button:hover {
  border-color: #bbb;
  color: #333;
}
.tui-full-calendar-button:active {
  background: #f9f9f9;
  color: #333;
}
.tui-full-calendar-button .round {
  border-radius: 25px;
}
.tui-full-calendar-confirm {
  width: 96px;
  height: 36px;
  border-radius: 40px;
  background-color: #ff6618;
  font-size: 12px;
  font-weight: bold;
  color: #fff;
  border: none;
}
.tui-full-calendar-confirm:hover {
  background-color: #e55b15;
  color: #fff;
}
.tui-full-calendar-confirm:active {
  background-color: #d95614;
  color: #fff;
}
.tui-full-calendar-icon.tui-full-calendar-right {
  float: right;
  top: 1px;
}
.tui-full-calendar-icon .tui-full-calendar-none {
  display: none;
}
.tui-full-calendar-icon.tui-full-calendar-calendar-dot {
  border-radius: 8px;
  width: 12px;
  height: 12px;
  margin: 1px;
}
input[type='checkbox'].tui-full-calendar-checkbox-square {
  display: none;
}
input[type='checkbox'].tui-full-calendar-checkbox-square + span {
  display: inline-block;
  cursor: pointer;
  line-height: 14px;
  margin-right: 8px;
  width: 14px;
  height: 14px;
  background: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAA4AAAAOCAYAAAAfSC3RAAAAAXNSR0IArs4c6QAAADpJREFUKBVjPHfu3O5///65MJAAmJiY9jCcOXPmP6kApIeJBItQlI5qRAkOVM5o4KCGBwqPkcxEvhsAbzRE+Jhb9IwAAAAASUVORK5CYII=) no-repeat;
  vertical-align: middle;
}
input[type='checkbox'].tui-full-calendar-checkbox-square:checked + span {
  background: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAA4AAAAOCAYAAAAfSC3RAAAAAXNSR0IArs4c6QAAAMBJREFUKBWVkjEOwjAMRe2WgZW7IIHEDdhghhuwcQ42rlJugAQS54Cxa5cq1QM5TUpByZfS2j9+dlJVt/tX5ZxbS4ZU9VLkQvSHKTIGRaVJYFmKrBbTCJxE2UgCdDzMZDkHrOV6b95V0US6UmgKodujEZbJg0B0ZgEModO5lrY1TMQf1TpyJGBEjD+E2NPN7ukIUDiF/BfEXgRiGEw8NgkffYGYwCi808fpn/6OvfUfsDr/Vc1IfRf8sKnFVqeiVQfDu0tf/nWH9gAAAABJRU5ErkJggg==) no-repeat;
}
input[type='checkbox'].tui-full-calendar-checkbox-round {
  display: none;
}
input[type='checkbox'].tui-full-calendar-checkbox-round + span {
  display: inline-block;
  cursor: pointer;
  width: 14px;
  height: 14px;
  line-height: 14px;
  vertical-align: middle;
  margin-right: 8px;
  border-radius: 8px;
  border: solid 2px;
  background: transparent;
}
.tui-full-calendar-popup-top-line {
  position: absolute;
  border-radius: 2px 2px 0 0;
  width: 100%;
  height: 4px;
  border: none;
  top: 0;
}
.tui-full-calendar-popup-detail .tui-full-calendar-popup-container {
  width: 301px;
  min-width: 301px;
  padding-bottom: 0;
}
.tui-full-calendar-popup-detail .tui-full-calendar-icon {
  width: 12px;
  height: 12px;
  background-size: 12px;
  position: relative;
}
.tui-full-calendar-popup-detail .tui-full-calendar-icon {
  margin-right: 8px;
}
.tui-full-calendar-popup-detail .tui-full-calendar-icon.tui-full-calendar-ic-location-b {
  top: -2px;
}
.tui-full-calendar-popup-detail .tui-full-calendar-icon.tui-full-calendar-ic-user-b {
  top: -2px;
}
.tui-full-calendar-popup-detail .tui-full-calendar-icon.tui-full-calendar-ic-state-b {
  top: -1px;
}
.tui-full-calendar-popup-detail .tui-full-calendar-icon.tui-full-calendar-calendar-dot {
  width: 10px;
  height: 10px;
  margin-right: 8px;
  top: -1px;
}
.tui-full-calendar-popup-detail .tui-full-calendar-content {
  line-height: 24px;
  height: 24px;
  font-size: 12px;
  line-height: 2;
}
.tui-full-calendar-popup-detail .tui-full-calendar-section-header {
  margin-bottom: 6px;
}
.tui-full-calendar-popup-detail .tui-full-calendar-popup-detail-item-separate {
  margin-top: 4px;
}
.tui-full-calendar-popup-detail .tui-full-calendar-popup-detail-item-indent {
  text-indent: -20px;
  padding-left: 20px;
}
.tui-full-calendar-popup-detail .tui-full-calendar-schedule-title {
  font-size: 15px;
  font-weight: bold;
  line-height: 1.6;
  word-break: break-all;
}
.tui-full-calendar-popup-detail .tui-full-calendar-schedule-private {
  display: none;
  width: 16px;
  height: 16px;
  background: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAA4AAAAOCAYAAAAfSC3RAAAAAXNSR0IArs4c6QAAAKpJREFUKBVjYCATMKLri46Olvn9+3fX////HUByjIyMB1hZWcuWLl36BFktikaQpl+/fl0EKhBCVgRkv2NjY9NH1syErABkE1TTdqBCWRAG8reDxKBycOUoGmHOA2pIA5kOwiA2SDVMDqYTRSNQUBIkgewkJDZYDqYR7sewsLCtQFO9YBLYaGBAbVu1apU3SA5uIyFNIMXIauAaQRKkgBGlERTURATOVpgaABRQQOK46wEAAAAAAElFTkSuQmCC) no-repeat 16px;
}
.tui-full-calendar-popup-detail .tui-full-calendar-schedule-private .tui-full-calendar-ic-private {
  display: block;
}
.tui-full-calendar-popup-detail .tui-full-calendar-section-detail {
  margin-bottom: 16px;
}
.tui-full-calendar-popup-detail .tui-full-calendar-section-button {
  border-top: 1px solid #e5e5e5;
  font-size: 0;
}
.tui-full-calendar-section-button .tui-full-calendar-icon {
  margin-right: 4px;
  top: -3px;
}
.tui-full-calendar-section-button .tui-full-calendar-content {
  position: relative;
  top: 2px;
}
.tui-full-calendar-popup-edit,
.tui-full-calendar-popup-delete {
  display: inline-block;
  padding: 7px 9px 11px 9px;
  width: calc(50% - 1px);
  outline: none;
  background: none;
  border: none;
  cursor: pointer;
}
.tui-full-calendar-popup-vertical-line {
  background: #e5e5e5;
  width: 1px;
  height: 14px;
  vertical-align: middle;
  display: inline-block;
  margin-top: -7px;
}
.tui-datepicker {
  left: -12px;
  z-index: 1;
  border-color: #d5d5d5;
}
.tui-full-calendar-icon {
  width: 14px;
  height: 14px;
  display: inline-block;
  vertical-align: middle;
}
.tui-full-calendar-icon.tui-full-calendar-ic-title {
  background: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAA4AAAAOCAYAAAAfSC3RAAAAAXNSR0IArs4c6QAAAO5JREFUKBVjYCATMOLSFxkZqfHnz5+1QHktNDVbV69e7cOCJgjmQjXtB3IksMh7g8SY0CXQNTEyMlYD1fBCabhyFI3omkCq/v//PwnotC8gGq4LyIBrxKYJpBBoU15oaCgPiEbWCPYjUEIFGBBY/QS0qRWooRVIg/UBDXgMYoBtBHJSgWxsAQFWjET8BBqQBuLDNM4Can6GpAAb8ydQMADo3x0gSbDGlStX3gVqdMSjGUUTSCNKAggPD1cDOmU/EEuBJKEAQxNIHEUjSABNM1ZNIHXMIAIZXL169a2+vv5moK18QKeXAv20B1meYjYAr7xrljpOzc0AAAAASUVORK5CYII=) no-repeat;
}
.tui-full-calendar-icon.tui-full-calendar-ic-location {
  background: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAA4AAAAOCAYAAAAfSC3RAAAAAXNSR0IArs4c6QAAAR1JREFUKBWdUTtPg1AUBiT8CydHJtv/0MTJRWAgcTK1bq0/pO3k4E4IYLo2Me46tS4wumjSpV07kAb6HXLPzaGPRZLL+c73uE/D+OdnHuaCIOhVVTUEf620pWVZ0yRJ3qW3FfR9f1zX9UgaGJumOUnT9Fn3DDzPuwPOuD9TvSzL3kizhOFJ4LnjOJc0wM0FP2Asgx0mEehHUfRHgzDzqF3GOogzbJg8V6XHFqYv4Cvqy7J8DcOwWYmw8Hwy1kHMRjcaKuEGgV82caWbZay3indagJyxcKLOlKeRdJA627YfUVaN0v6tlKbZVjCO4zW2cw91px3AxJEmOONCNoTzPP9xXZfOd6u0Bzz60RGOgmQuiuIb4S3gB0IvaoJW2QMDs1bBoH1CAQAAAABJRU5ErkJggg==) no-repeat;
}
.tui-full-calendar-icon.tui-full-calendar-ic-date {
  background: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAA4AAAAOCAYAAAAfSC3RAAAAAXNSR0IArs4c6QAAAGpJREFUKBVjYKAGCA0N/Q/C6GZhE2cEKQoLC9v6//9/L3QN2PiMjIzbVq1a5c0EkiRWE7JasEZsJhMSI1sjC7LJq1evBvsZWQyZjRxwZNs4hDSiBA6y55EDBRsb7EdQasAmiUNsKw5x4oQBkUAeDPJ53KsAAAAASUVORK5CYII=) no-repeat;
}
.tui-full-calendar-icon.tui-full-calendar-ic-state {
  background: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAA4AAAAOCAYAAAAfSC3RAAAAAXNSR0IArs4c6QAAAIxJREFUKBVjYCATMKLrCw8P9/z3798soLgMVO4JExNT2sqVK7cjq2VC5oDYME2MjIyNIAwUkoGKoShlQeFBOGCbVq1a1QDihoaG1gMpmO0gITAAOzUsLGzr////vWCC+GigK7YBDfUGO5VYTSADYWox/IjPNmS5UY3IoYHGBgcOKG7QxPFxt+KTJCgHAGcZJbGLRuJ2AAAAAElFTkSuQmCC) no-repeat;
}
.tui-full-calendar-icon.tui-full-calendar-ic-private {
  background: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAA4AAAAOCAYAAAAfSC3RAAAAAXNSR0IArs4c6QAAAKpJREFUKBVjYCATMKLri46Olvn9+3fX////HUByjIyMB1hZWcuWLl36BFktikaQpl+/fl0EKhBCVgRkv2NjY9NH1syErABkE1TTdqBCWRAG8reDxKBycOUoGmHOA2pIA5kOwiA2SDVMDqYTRSNQUBIkgewkJDZYDqYR7sewsLCtQFO9YBLYaGBAbVu1apU3SA5uIyFNIMXIauAaQRKkgBGlERTURATOVpgaABRQQOK46wEAAAAAAElFTkSuQmCC) no-repeat;
}
.tui-full-calendar-icon.tui-full-calendar-ic-public {
  background: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAA4AAAAOCAYAAAAfSC3RAAAAAXNSR0IArs4c6QAAAKdJREFUKBVjYCATMKLri46Olvn9+3fX////HUByjIyMB1hZWcuWLl36BFktikaQpl+/fl0EKhBCVgRkv2NjY9NH1syErABkE1TTdqBCWRAG8reDxKBycOUoGmHOA2pIA5kOwiA2SDVMDq4TmREaGvofhJHFcLHhfgwLC9sKNNULl0KQODCgtq1atcobxIY7lZAmkGJkNXCNIAlSwIjSCApqIgJnK0wNALoOPwSpOcq0AAAAAElFTkSuQmCC) no-repeat;
}
.tui-full-calendar-icon.tui-full-calendar-ic-close {
  background: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAA4AAAAOCAYAAAAfSC3RAAAAAXNSR0IArs4c6QAAAJRJREFUKBXFkNERhCAMREUbuEKohzq0Eq2DDq6Da4B60KezDORkxj+ZwchmX0IYhtdWCGFl9y5g82NtzDnPdzAaudo76ZBS+nrvPxiInMkJcs5tMcZFfqcfxdqIRiELof+BiIJPg+mExmpmvKRn3zKj7OrG9Y79szPL14A1xEP0Hgy4gBZS5R7czHj3ehSgOzkVeyfuGrBw/WLm0hsAAAAASUVORK5CYII=) no-repeat;
}
.tui-full-calendar-ic-location-b {
  background: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAwAAAAMCAYAAABWdVznAAAAAXNSR0IArs4c6QAAAOZJREFUKBWVUT0KwjAUbkzGTuJWPYNDpV0cXD2ETuIRBK+gs4ubp3BwcXBp6eINBKWDgydoid9X8oKCggYeee/7S9IGwZ9LverTNO3Wdb2y1o6IK6WOWutFlmU30XmDE58hbgvpTA+Y+mJqCemS20jdG2N6LPYMICc6b5BrIG3ONBZ7CoVj7w0cfllGRDj+gKQpjt/iPU0ye/LkROcNANaoCUzjqqquIsBuHddAWoiyLO9RFHUwJ4JxR/qmKIqdYG9vCMNwCeIiJHuHecj/B0GSJBng7ifO+ErDPM8L4b7ucRzPWJ8ET1E7YC7tmi9qAAAAAElFTkSuQmCC);
}
.tui-full-calendar-ic-state-b {
  background: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAwAAAAMCAYAAABWdVznAAAAAXNSR0IArs4c6QAAAHlJREFUKBVjYCARMCKrNzEx8QTyZ/3//18GJM7IyPgESKWdOXNmO4gPAkwQCk6CFQMVNoIwVOMsuCw6w9jY+D8Iw8TR+SBxsJOATtkKNM0LphAbDbRxG9Bp3mAnEVIMMgCmBt0P2AxHERusGkAhgOJQ7Jyt2IUJiAIAwwIn24FgmhkAAAAASUVORK5CYII=);
}
.tui-full-calendar-icon.tui-full-calendar-ic-user-b {
  background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAwAAAAMCAYAAABWdVznAAAAAXNSR0IArs4c6QAAAJpJREFUKBVjYKA1YES3wMTExBMoNgsqnnbmzJntyGqYkDlQ9qz////LgDCQD9MIV4ZNA1wSGwObhjRGRsYnIAzUkIZNE0licE+bm5tr/fnzJx1osjPQBFmoKY+BftnLwsIy8+TJk9dAYmANxsbGoUD2YiBmBwliAT+BYrFnz55dDfNDO1AAl2KQfpAcSA0DTIMyiEMAEKMG0wgAolIjcM7Tjm8AAAAASUVORK5CYII=);
}
.tui-full-calendar-icon.tui-full-calendar-ic-edit {
  background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAwAAAAMCAYAAABWdVznAAAAAXNSR0IArs4c6QAAAMdJREFUKBVjYCARMOJTb2xsLMfIyBjLysq64Pjx409BapnwaQDKzf7//3/L79+/D1tbW0uB1LJg02BmZqYIVPgdKBf/79+//UC2xs+fP8OB/H4MG0CK//79ewCkEGQYExOTI5DawMnJuQTER/EDTDFQXA4kCQQ3QBpOnz79AsJF8gMWxTA1KDTYBhyKMUwH6WSysrKSB7kZyIY5AySOVTFIggno+5VAmijFYA1AwhzEgAKcJsMUwIMVGKPH2NnZ7ZFDBKYImQYAuO5YIMgk39gAAAAASUVORK5CYII=);
}
.tui-full-calendar-icon.tui-full-calendar-ic-delete {
  background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAwAAAAMCAYAAABWdVznAAAAAXNSR0IArs4c6QAAAFhJREFUKBVjYCARMKKrNzEx2fr//38vkDgjI+O2M2fOeCOrAWtAVoQsicyGaWZCFsTHBtr6H588Tjm4H4yNjfGacPbsWbBaop0Es3JYaQBFDMxjWOitMDEA3EEZfFEISwUAAAAASUVORK5CYII=);
}
.tui-full-calendar-icon.tui-full-calendar-ic-arrow-solid-top {
  background: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAA4AAAAOCAYAAAAfSC3RAAAAAXNSR0IArs4c6QAAAIFJREFUKBVjYBj+gBmXF2NiYiTV1dV5rl279gWbGiZsgg0NDSw/f/5cCZRbBWJjU4PVRjExsR6g4nAgln/z5g3v1atXd6JrxtAYHh4e+v///z4khZa6urrXgJqvIYkxMCJzgJo0//37dwooxoMsDmR/YWJiMlu5cuV1NPFRLrYQAADMVCaUtbG7XwAAAABJRU5ErkJggg==) no-repeat;
}
.tui-full-calendar-icon.tui-full-calendar-ic-milestone {
  background: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAwAAAAMCAYAAABWdVznAAAAAXNSR0IArs4c6QAAAGFJREFUKBVjYCARMILU/3dw+I+hj5FxG+P+/d7o4rg1IKtE0syELI6T/f+/F0yOOA0w1UCa9hpYkGxjYDxwABwIILH/jo5bGWBuZ2TcClOHogEmCKKxBSlInPZ+ANlCEgAA37EU4AHbBQUAAAAASUVORK5CYII=) no-repeat;
}
.tui-full-calendar-icon.tui-full-calendar-ic-arrow-left {
  background: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAQAAAAHCAYAAAAvZezQAAAAAXNSR0IArs4c6QAAAFZJREFUCB1jZICCyspK83///hUxgvhVVVV6f//+3c3ExJTMVFNTowqU2cHMzJzf3t6+hen379/zgIp2t7W1rQCpZmJlZU0C0q5AbREgAQwzwAIgGZgtADMCJqH/QyvhAAAAAElFTkSuQmCC) no-repeat;
}
.tui-full-calendar-icon.tui-full-calendar-ic-arrow-right {
  background: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAQAAAAHCAYAAAAvZezQAAAAAXNSR0IArs4c6QAAAFxJREFUCB1jKC8vX1lZWWnOAAVMQLD4379/m6qqqvRAYowgAsiJAAr2sbCw2IMFQIIVFRUL////r8SCpMKVlZXVnhFooA9Q+VxmZmbXtra2S0xATizQYD8QB6QaAJMLJ9BqE9yTAAAAAElFTkSuQmCC) no-repeat;
}
.tui-full-calendar-ic-repeat-b {
  background: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAwAAAAMCAYAAABWdVznAAAAAXNSR0IArs4c6QAAAQpJREFUKBVjYCARMCKrNzU1tf/3718lUMwQiP8yMjKeYWJi6j516tRhExOThjNnzjTANQAFqv///98CVHQPSO8A0ixATa5AtjyQPgDETmfPngULMpiZmbn//fu3BSg4B6ggCyjxG8hm8PT0ZH/9+vUJoJgTiA8CTCACqDgXaOJ9Xl7eTJhikDhQcSVQsQGITT8A9rSxsfF/mJVApzWCQgPGd3BwYPny5cstoNOuAZ3rAwoJOAAqviAqKtoOEwAaxPr58+dpQL4iEGeAxJFt2AfkOwA1PQTSu4Em/gGyPYC0EpCuAdraCtIADiWgQCPQOmdmZmYHoNgVoCJfIB0CpG8DI84BphgoRjoAAAzgdELI91E5AAAAAElFTkSuQmCC);
}
/*# sourceMappingURL=src/css/main.css.map */

/*# sourceMappingURL=tui-calendar.css.map*/
/*!
 * TOAST UI Date Picker
 * @version 4.0.3
 * @author NHN. FE Development Lab <dl_javascript@nhn.com>
 * @license MIT
 */
@charset "utf-8";
.tui-calendar {
    position: relative;
    background-color: #fff;
    border: 1px solid #aaa;
    width: 274px;
}

.tui-calendar * {
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
}

.tui-calendar div {
    text-align: center
}

.tui-calendar caption {
    padding: 0
}

.tui-calendar caption span {
    overflow: hidden;
    position: absolute;
    clip: rect(0 0 0 0);
    width: 1px;
    height: 1px;
    margin: -1px;
    padding: 0
}

.tui-calendar button, .tui-datepicker-dropdown button, .tui-datepicker-selector button {
    -webkit-appearance: none;
    -moz-appearance: none;
    appearance: none
}

.tui-ico-date, .tui-ico-time, .tui-datepicker-dropdown .tui-ico-check, .tui-ico-caret {
    overflow: hidden;
    display: inline-block;
    width: 1px;
    height: 1px;
    line-height: 300px;
    background: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAC8AAAA+CAYAAAC7rUKSAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2ZpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDpERjdGMzkzODVEQkRFNjExQkVCMjlDOUFDNzZDM0E5NCIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo1ODVCRTc4NkM2QkQxMUU2OTgzMzhGQjZFMjcyMTQ1RSIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo1ODVCRTc4NUM2QkQxMUU2OTgzMzhGQjZFMjcyMTQ1RSIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ1M2IChXaW5kb3dzKSI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSJ4bXAuaWlkOjFERENDMTc0QjlDNkU2MTE5OTc0QjIwOTY3QkQzNjZBIiBzdFJlZjpkb2N1bWVudElEPSJ4bXAuZGlkOkRGN0YzOTM4NURCREU2MTFCRUIyOUM5QUM3NkMzQTk0Ii8+IDwvcmRmOkRlc2NyaXB0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) no-repeat
}

.tui-ico-date {
    width: 12px;
    height: 12px;
    background-position: -17px 0
}

.tui-ico-time {
    width: 12px;
    height: 12px;
    background-position: 0 -30px
}

.tui-ico-caret {
    width: 7px;
    height: 4px;
    background-position: 0 -58px
}

.tui-calendar-month, .tui-calendar-year {
    width: 202px;
}

.tui-calendar-month .tui-calendar-body, .tui-calendar-year .tui-calendar-body {
    width: 202px;
    margin: 0 auto;
}

.tui-calendar .tui-calendar-header {
    position: relative;
    border-bottom: 1px solid #efefef
}

.tui-calendar .tui-calendar-header-inner {
    padding: 17px 50px 15px;
    height: 50px
}

.tui-calendar .tui-calendar-title-today {
    height: 30px;
    margin: 0;
    font-size: 12px;
    line-height: 34px;
    color: #777;
    background-color: #f4f4f4
}

.tui-calendar .tui-calendar-title {
    display: inline-block;
    font-size: 18px;
    font-weight: normal;
    font-style: normal;
    line-height: 1;
    color: #333;
    cursor: default;
    vertical-align: top
}

.tui-calendar-btn {
    overflow: hidden;
    position: absolute;
    top: 0;
    width: 32px;
    height: 50px;
    line-height: 400px;
    z-index: 10;
    cursor: pointer;
    border: none;
    background-color: #fff;
}

.tui-calendar .tui-calendar-btn-prev-month {
    left: 0
}

.tui-calendar .tui-calendar-btn-next-month {
    right: 0
}

.tui-calendar .tui-calendar-btn-prev-year {
    left: 0
}

.tui-calendar .tui-calendar-btn-next-year {
    right: 0
}

.tui-calendar .tui-calendar-btn-prev-month:after, .tui-calendar .tui-calendar-btn-next-month:after, .tui-calendar .tui-calendar-btn-prev-year:after, .tui-calendar .tui-calendar-btn-next-year:after {
    overflow: hidden;
    position: absolute;
    top: 50%;
    margin-top: -5px;
    line-height: 400px;
    background: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAC8AAAA+CAYAAAC7rUKSAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2ZpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDpERjdGMzkzODVEQkRFNjExQkVCMjlDOUFDNzZDM0E5NCIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo1ODVCRTc4NkM2QkQxMUU2OTgzMzhGQjZFMjcyMTQ1RSIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo1ODVCRTc4NUM2QkQxMUU2OTgzMzhGQjZFMjcyMTQ1RSIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ1M2IChXaW5kb3dzKSI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSJ4bXAuaWlkOjFERENDMTc0QjlDNkU2MTE5OTc0QjIwOTY3QkQzNjZBIiBzdFJlZjpkb2N1bWVudElEPSJ4bXAuZGlkOkRGN0YzOTM4NURCREU2MTFCRUIyOUM5QUM3NkMzQTk0Ii8+IDwvcmRmOkRlc2NyaXB0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) no-repeat;
    content: ''
}

.tui-calendar .tui-calendar-btn-prev-month:after, .tui-calendar.tui-calendar-month .tui-calendar-btn-prev-year:after {
    width: 6px;
    height: 11px;
    left: 50%;
    margin-left: -3px;
    background-position: 0 0
}

.tui-calendar .tui-calendar-btn-next-month:after, .tui-calendar.tui-calendar-month .tui-calendar-btn-next-year:after {
    width: 6px;
    height: 11px;
    right: 50%;
    margin-right: -3px;
    background-position: -8px 0
}

.tui-calendar .tui-calendar-btn-prev-year:after {
    width: 11px;
    height: 10px;
    left: 50%;
    margin-left: -6px;
    background-position: -16px -36px
}

.tui-calendar .tui-calendar-btn-next-year:after {
    width: 11px;
    height: 10px;
    right: 50%;
    margin-right: -6px;
    background-position: -16px -49px
}

.tui-calendar.tui-calendar-month .tui-calendar-btn-prev-year, .tui-calendar.tui-calendar-month .tui-calendar-btn-next-year {
    width: 50px
}

.tui-calendar .tui-calendar-has-btns .tui-calendar-btn-prev-year {
    left: 10px
}

.tui-calendar .tui-calendar-has-btns .tui-calendar-btn-next-year {
    right: 10px
}

.tui-calendar .tui-calendar-has-btns .tui-calendar-btn-prev-month {
    left: 44px
}

.tui-calendar .tui-calendar-has-btns .tui-calendar-btn-next-month {
    right: 44px
}

.tui-calendar .tui-calendar-body-header th {
    color: #777
}

.tui-calendar .tui-calendar-body-inner {
    width: 100%;
    margin: 0 auto;
    table-layout: fixed;
    border-collapse: collapse;
    text-align: center;
    font-size: 12px
}

.tui-calendar th {
    font-weight: normal;
    cursor: default
}

.tui-calendar th, .tui-calendar td {
    height: 39px;
    text-align: center;
    color: #999
}

.tui-calendar .tui-is-blocked:hover {
    cursor: default
}

.tui-calendar .tui-calendar-month {
    width: 25%;
    height: 50px
}

.tui-calendar .tui-calendar-today {
    color: #4b96e6
}

.tui-calendar .tui-calendar-prev-month, .tui-calendar .tui-calendar-next-month {
    color: #ccc
}

.tui-calendar .tui-calendar-prev-month.tui-calendar-date, .tui-calendar .tui-calendar-next-month.tui-calendar-date {
    visibility: hidden
}

.tui-calendar .tui-calendar-btn-choice {
    background-color: #4b96e6
}

.tui-calendar .tui-calendar-btn-close {
    background-color: #777
}

.tui-calendar .tui-calendar-year {
    width: 25%;
    height: 50px
}

.tui-calendar.tui-calendar-year .tui-calendar-btn-prev-year:after {
    width: 6px;
    height: 11px;
    left: 50%;
    margin-left: -3px;
    background-position: 0 0
}

.tui-calendar.tui-calendar-year .tui-calendar-btn-next-year:after {
    width: 6px;
    height: 11px;
    right: 50%;
    margin-right: -3px;
    background-position: -8px 0
}

.tui-calendar.tui-calendar-year .tui-calendar-btn-prev-year, .tui-calendar.tui-calendar-year .tui-calendar-btn-next-year {
    width: 50px
}

.tui-datepicker {
    border: 1px solid #aaa;
    background-color: white;
    position: absolute;
}

.tui-datepicker * {
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
}

.tui-datepicker-type-date {
    width: 274px;
}

.tui-datepicker-body .tui-calendar-month, .tui-datepicker-body .tui-calendar-year {
    width: auto;
}

.tui-datepicker .tui-calendar {
    border: 0;
}

.tui-datepicker .tui-calendar-title {
    cursor: pointer;
}

.tui-datepicker .tui-calendar-title.tui-calendar-title-year-to-year {
    cursor: auto;
}

.tui-datepicker-body .tui-timepicker, .tui-datepicker-footer .tui-timepicker {
    width: 274px;
    position: static;
    padding: 20px 46px 20px 47px;
    border: 0
}

.tui-datepicker-footer .tui-timepicker {
    border-top: 1px solid #eee
}

.tui-datepicker-selector {
    padding: 10px;
    font-size: 0;
    text-align: center;
    border-bottom: 1px solid #eee
}

.tui-datepicker-selector-button {
    width: 50%;
    height: 26px;
    font-size: 12px;
    line-height: 23px;
    border: 1px solid #ddd;
    background-color: #fff;
    color: #777;
    outline: none;
    cursor: pointer
}

.tui-datepicker-selector-button.tui-is-checked {
    background-color: #eee;
    color: #333
}

.tui-datepicker-selector-button+.tui-datepicker-selector-button {
    margin-left: -1px
}

.tui-datepicker-selector-button [class^=tui-ico-] {
    margin: 5px 9px 0 0;
    vertical-align: top;
}

.tui-datepicker-selector-button.tui-is-checked .tui-ico-date, .tui-datepicker-input.tui-has-focus .tui-ico-date {
    background-position: -17px -14px
}

.tui-datepicker-selector-button.tui-is-checked .tui-ico-time {
    background-position: 0 -44px
}

.tui-datepicker-area {
    position: relative
}

.tui-datepicker-input {
    position: relative;
    display: inline-block;
    width: 120px;
    height: 28px;
    vertical-align: top;
    border: 1px solid #ddd
}

.tui-datepicker-input * {
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
}

.tui-datepicker-input > input {
    width: 100%;
    height: 100%;
    padding: 6px 27px 6px 10px;
    font-size: 12px;
    line-height: 14px;
    vertical-align: top;
    border: 0;
    color: #333
}

.tui-datepicker-input > .tui-ico-date {
    position: absolute;
    top: 50%;
    right: 8px;
    margin: -6px 0 0 0
}

.tui-datepicker-input.tui-has-focus {
    border-color: #aaa
}

.tui-datetime-input {
    width: 170px
}

.tui-datepicker .tui-is-blocked {
    cursor: default;
    color: #ddd
}

.tui-datepicker .tui-is-valid {
    color: #999
}

.tui-datepicker .tui-is-selectable:hover {
    background-color: #edf4fc;
    cursor: pointer;
}

.tui-datepicker .tui-is-selectable.tui-is-selected, .tui-datepicker.tui-rangepicker .tui-is-selectable.tui-is-selected {
    background-color: #4b96e6;
    color: #fff
}

.tui-datepicker.tui-rangepicker .tui-is-selected-range {
    background-color: #edf4fc;
}

.tui-datepicker-dropdown {
    display: inline-block;
    width: 120px
}

.tui-datepicker-dropdown .tui-dropdown-button {
    width: 100%;
    height: 28px;
    padding: 0 10px;
    font-size: 12px;
    line-height: 20px;
    border: 1px solid #ddd;
    padding: 0 30px 0 10px;
    text-align: left;
    background: #fff;
    cursor: pointer
}

.tui-datepicker-dropdown {
    position: relative
}

.tui-datepicker-dropdown .tui-ico-caret {
    position: absolute;
    top: 12px;
    right: 10px
}

.tui-datepicker-dropdown .tui-dropdown-menu {
    display: none;
    position: absolute;
    top: 27px;
    left: 0;
    right: 0;
    width: 100%;
    padding: 5px 0;
    margin: 0;
    overflow-y: auto;
    min-width: 0;
    max-height: 198px;
    font-size: 12px;
    border: 1px solid #ddd;
    border-top-color: #fff;
    z-index: 10;
    box-sizing: border-box;
    box-shadow: none;
    border-radius: 0
}

.tui-datepicker-dropdown.tui-is-open .tui-dropdown-button {
    display: block
}

.tui-datepicker-dropdown.tui-is-open .tui-dropdown-menu, .tui-datepicker-dropdown.tui-is-open .tui-dropdown-button {
    display: block;
    border-color: #aaa
}

.tui-datepicker-dropdown.tui-is-open .tui-ico-caret {
    background-position: -21px -28px
}

.tui-datepicker-dropdown .tui-menu-item {
    position: relative;
    overflow: hidden;
    position: relative;
    height: 28px;
    line-height: 28px;
    background-color: #fff;
    z-index: 10
}

.tui-datepicker-dropdown .tui-menu-item-btn {
    position: relative;
    width: 100%;
    font-size: 12px;
    font-weight: normal;
    line-height: 28px;
    padding: 0 10px 0 30px;
    text-align: left;
    color: #333;
    background-color: #fff;
    border: 0;
    cursor: pointer;
    z-index: 9
}

.tui-datepicker-dropdown .tui-menu-item-btn:hover, .tui-menu-item-btn:focus, .tui-menu-item-btn:active {
    color: #333;
    background-color: #f4f4f4
}

.tui-datepicker-dropdown .tui-menu-item .tui-ico-check {
    display: none;
    overflow: hidden;
    position: absolute;
    width: 10px;
    height: 8px;
    top: 10px;
    left: 10px;
    background-position: -31px -54px;
    z-index: 10;
    content: 'aaa'
}

.tui-datepicker-dropdown .tui-menu-item.tui-is-selected .tui-ico-check {
    display: block
}

.tui-datepicker-dropdown .tui-menu-item.tui-is-selected .tui-menu-item-btn {
    font-weight: bold
}

.tui-dropdown-area {
    font-size: 0
}

.tui-dropdown-area .tui-datepicker-dropdown+.tui-datepicker-dropdown {
    margin-left: 5px
}

.tui-hidden {
    display: none;
}
/*! jQuery UI - v1.12.1 - 2016-09-14
* http://jqueryui.com
* Includes: core.css, accordion.css, autocomplete.css, menu.css, button.css, controlgroup.css, checkboxradio.css, datepicker.css, dialog.css, draggable.css, resizable.css, progressbar.css, selectable.css, selectmenu.css, slider.css, sortable.css, spinner.css, tabs.css, tooltip.css, theme.css
* To view and modify this theme, visit http://jqueryui.com/themeroller/?ffDefault=Verdana%2CArial%2Csans-serif&fwDefault=normal&fsDefault=1.1em&cornerRadius=4px&bgColorHeader=cccccc&bgTextureHeader=highlight_soft&bgImgOpacityHeader=75&borderColorHeader=aaaaaa&fcHeader=222222&iconColorHeader=222222&bgColorContent=ffffff&bgTextureContent=flat&bgImgOpacityContent=75&borderColorContent=aaaaaa&fcContent=222222&iconColorContent=222222&bgColorDefault=e6e6e6&bgTextureDefault=glass&bgImgOpacityDefault=75&borderColorDefault=d3d3d3&fcDefault=555555&iconColorDefault=888888&bgColorHover=dadada&bgTextureHover=glass&bgImgOpacityHover=75&borderColorHover=999999&fcHover=212121&iconColorHover=454545&bgColorActive=ffffff&bgTextureActive=glass&bgImgOpacityActive=65&borderColorActive=aaaaaa&fcActive=212121&iconColorActive=454545&bgColorHighlight=fbf9ee&bgTextureHighlight=glass&bgImgOpacityHighlight=55&borderColorHighlight=fcefa1&fcHighlight=363636&iconColorHighlight=2e83ff&bgColorError=fef1ec&bgTextureError=glass&bgImgOpacityError=95&borderColorError=cd0a0a&fcError=cd0a0a&iconColorError=cd0a0a&bgColorOverlay=aaaaaa&bgTextureOverlay=flat&bgImgOpacityOverlay=0&opacityOverlay=30&bgColorShadow=aaaaaa&bgTextureShadow=flat&bgImgOpacityShadow=0&opacityShadow=30&thicknessShadow=8px&offsetTopShadow=-8px&offsetLeftShadow=-8px&cornerRadiusShadow=8px
* Copyright jQuery Foundation and other contributors; Licensed MIT */

/* Layout helpers
----------------------------------*/
.ui-helper-hidden {
	display: none;
}
.ui-helper-hidden-accessible {
	border: 0;
	clip: rect(0 0 0 0);
	height: 1px;
	margin: -1px;
	overflow: hidden;
	padding: 0;
	position: absolute;
	width: 1px;
}
.ui-helper-reset {
	margin: 0;
	padding: 0;
	border: 0;
	outline: 0;
	line-height: 1.3;
	text-decoration: none;
	font-size: 100%;
	list-style: none;
}
.ui-helper-clearfix:before,
.ui-helper-clearfix:after {
	content: "";
	display: table;
	border-collapse: collapse;
}
.ui-helper-clearfix:after {
	clear: both;
}
.ui-helper-zfix {
	width: 100%;
	height: 100%;
	top: 0;
	left: 0;
	position: absolute;
	opacity: 0;
	filter:Alpha(Opacity=0); /* support: IE8 */
}

.ui-front {
	z-index: 100;
}


/* Interaction Cues
----------------------------------*/
.ui-state-disabled {
	cursor: default !important;
	pointer-events: none;
}


/* Icons
----------------------------------*/
.ui-icon {
	display: inline-block;
	vertical-align: middle;
	margin-top: -.25em;
	position: relative;
	text-indent: -99999px;
	overflow: hidden;
	background-repeat: no-repeat;
}

.ui-widget-icon-block {
	left: 50%;
	margin-left: -8px;
	display: block;
}

/* Misc visuals
----------------------------------*/

/* Overlays */
.ui-widget-overlay {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
}
.ui-accordion .ui-accordion-header {
	display: block;
	cursor: pointer;
	position: relative;
	margin: 2px 0 0 0;
	padding: .5em .5em .5em .7em;
	font-size: 100%;
}
.ui-accordion .ui-accordion-content {
	padding: 1em 2.2em;
	border-top: 0;
	overflow: auto;
}
.ui-autocomplete {
	position: absolute;
	top: 0;
	left: 0;
	cursor: default;
}
.ui-menu {
	list-style: none;
	padding: 0;
	margin: 0;
	display: block;
	outline: 0;
}
.ui-menu .ui-menu {
	position: absolute;
}
.ui-menu .ui-menu-item {
	margin: 0;
	cursor: pointer;
	/* support: IE10, see #8844 */
	list-style-image: url("data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7");
}
.ui-menu .ui-menu-item-wrapper {
	position: relative;
	padding: 3px 1em 3px .4em;
}
.ui-menu .ui-menu-divider {
	margin: 5px 0;
	height: 0;
	font-size: 0;
	line-height: 0;
	border-width: 1px 0 0 0;
}
.ui-menu .ui-state-focus,
.ui-menu .ui-state-active {
	margin: -1px;
}

/* icon support */
.ui-menu-icons {
	position: relative;
}
.ui-menu-icons .ui-menu-item-wrapper {
	padding-left: 2em;
}

/* left-aligned */
.ui-menu .ui-icon {
	position: absolute;
	top: 0;
	bottom: 0;
	left: .2em;
	margin: auto 0;
}

/* right-aligned */
.ui-menu .ui-menu-icon {
	left: auto;
	right: 0;
}
.ui-button {
	padding: .4em 1em;
	display: inline-block;
	position: relative;
	line-height: normal;
	margin-right: .1em;
	cursor: pointer;
	vertical-align: middle;
	text-align: center;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;

	/* Support: IE <= 11 */
	overflow: visible;
}

.ui-button,
.ui-button:link,
.ui-button:visited,
.ui-button:hover,
.ui-button:active {
	text-decoration: none;
}

/* to make room for the icon, a width needs to be set here */
.ui-button-icon-only {
	width: 2em;
	box-sizing: border-box;
	text-indent: -9999px;
	white-space: nowrap;
}

/* no icon support for input elements */
input.ui-button.ui-button-icon-only {
	text-indent: 0;
}

/* button icon element(s) */
.ui-button-icon-only .ui-icon {
	position: absolute;
	top: 50%;
	left: 50%;
	margin-top: -8px;
	margin-left: -8px;
}

.ui-button.ui-icon-notext .ui-icon {
	padding: 0;
	width: 2.1em;
	height: 2.1em;
	text-indent: -9999px;
	white-space: nowrap;

}

input.ui-button.ui-icon-notext .ui-icon {
	width: auto;
	height: auto;
	text-indent: 0;
	white-space: normal;
	padding: .4em 1em;
}

/* workarounds */
/* Support: Firefox 5 - 40 */
input.ui-button::-moz-focus-inner,
button.ui-button::-moz-focus-inner {
	border: 0;
	padding: 0;
}
.ui-controlgroup {
	vertical-align: middle;
	display: inline-block;
}
.ui-controlgroup > .ui-controlgroup-item {
	float: left;
	margin-left: 0;
	margin-right: 0;
}
.ui-controlgroup > .ui-controlgroup-item:focus,
.ui-controlgroup > .ui-controlgroup-item.ui-visual-focus {
	z-index: 9999;
}
.ui-controlgroup-vertical > .ui-controlgroup-item {
	display: block;
	float: none;
	width: 100%;
	margin-top: 0;
	margin-bottom: 0;
	text-align: left;
}
.ui-controlgroup-vertical .ui-controlgroup-item {
	box-sizing: border-box;
}
.ui-controlgroup .ui-controlgroup-label {
	padding: .4em 1em;
}
.ui-controlgroup .ui-controlgroup-label span {
	font-size: 80%;
}
.ui-controlgroup-horizontal .ui-controlgroup-label + .ui-controlgroup-item {
	border-left: none;
}
.ui-controlgroup-vertical .ui-controlgroup-label + .ui-controlgroup-item {
	border-top: none;
}
.ui-controlgroup-horizontal .ui-controlgroup-label.ui-widget-content {
	border-right: none;
}
.ui-controlgroup-vertical .ui-controlgroup-label.ui-widget-content {
	border-bottom: none;
}

/* Spinner specific style fixes */
.ui-controlgroup-vertical .ui-spinner-input {

	/* Support: IE8 only, Android < 4.4 only */
	width: 75%;
	width: calc( 100% - 2.4em );
}
.ui-controlgroup-vertical .ui-spinner .ui-spinner-up {
	border-top-style: solid;
}

.ui-checkboxradio-label .ui-icon-background {
	box-shadow: inset 1px 1px 1px #ccc;
	border-radius: .12em;
	border: none;
}
.ui-checkboxradio-radio-label .ui-icon-background {
	width: 16px;
	height: 16px;
	border-radius: 1em;
	overflow: visible;
	border: none;
}
.ui-checkboxradio-radio-label.ui-checkboxradio-checked .ui-icon,
.ui-checkboxradio-radio-label.ui-checkboxradio-checked:hover .ui-icon {
	background-image: none;
	width: 8px;
	height: 8px;
	border-width: 4px;
	border-style: solid;
}
.ui-checkboxradio-disabled {
	pointer-events: none;
}
.ui-datepicker {
	width: 17em;
	padding: .2em .2em 0;
	display: none;
}
.ui-datepicker .ui-datepicker-header {
	position: relative;
	padding: .2em 0;
}
.ui-datepicker .ui-datepicker-prev,
.ui-datepicker .ui-datepicker-next {
	position: absolute;
	top: 2px;
	width: 1.8em;
	height: 1.8em;
}
.ui-datepicker .ui-datepicker-prev-hover,
.ui-datepicker .ui-datepicker-next-hover {
	top: 1px;
}
.ui-datepicker .ui-datepicker-prev {
	left: 2px;
}
.ui-datepicker .ui-datepicker-next {
	right: 2px;
}
.ui-datepicker .ui-datepicker-prev-hover {
	left: 1px;
}
.ui-datepicker .ui-datepicker-next-hover {
	right: 1px;
}
.ui-datepicker .ui-datepicker-prev span,
.ui-datepicker .ui-datepicker-next span {
	display: block;
	position: absolute;
	left: 50%;
	margin-left: -8px;
	top: 50%;
	margin-top: -8px;
}
.ui-datepicker .ui-datepicker-title {
	margin: 0 2.3em;
	line-height: 1.8em;
	text-align: center;
}
.ui-datepicker .ui-datepicker-title select {
	font-size: 1em;
	margin: 1px 0;
}
.ui-datepicker select.ui-datepicker-month,
.ui-datepicker select.ui-datepicker-year {
	width: 45%;
}
.ui-datepicker table {
	width: 100%;
	font-size: .9em;
	border-collapse: collapse;
	margin: 0 0 .4em;
}
.ui-datepicker th {
	padding: .7em .3em;
	text-align: center;
	font-weight: bold;
	border: 0;
}
.ui-datepicker td {
	border: 0;
	padding: 1px;
}
.ui-datepicker td span,
.ui-datepicker td a {
	display: block;
	padding: .2em;
	text-align: right;
	text-decoration: none;
}
.ui-datepicker .ui-datepicker-buttonpane {
	background-image: none;
	margin: .7em 0 0 0;
	padding: 0 .2em;
	border-left: 0;
	border-right: 0;
	border-bottom: 0;
}
.ui-datepicker .ui-datepicker-buttonpane button {
	float: right;
	margin: .5em .2em .4em;
	cursor: pointer;
	padding: .2em .6em .3em .6em;
	width: auto;
	overflow: visible;
}
.ui-datepicker .ui-datepicker-buttonpane button.ui-datepicker-current {
	float: left;
}

/* with multiple calendars */
.ui-datepicker.ui-datepicker-multi {
	width: auto;
}
.ui-datepicker-multi .ui-datepicker-group {
	float: left;
}
.ui-datepicker-multi .ui-datepicker-group table {
	width: 95%;
	margin: 0 auto .4em;
}
.ui-datepicker-multi-2 .ui-datepicker-group {
	width: 50%;
}
.ui-datepicker-multi-3 .ui-datepicker-group {
	width: 33.3%;
}
.ui-datepicker-multi-4 .ui-datepicker-group {
	width: 25%;
}
.ui-datepicker-multi .ui-datepicker-group-last .ui-datepicker-header,
.ui-datepicker-multi .ui-datepicker-group-middle .ui-datepicker-header {
	border-left-width: 0;
}
.ui-datepicker-multi .ui-datepicker-buttonpane {
	clear: left;
}
.ui-datepicker-row-break {
	clear: both;
	width: 100%;
	font-size: 0;
}

/* RTL support */
.ui-datepicker-rtl {
	direction: rtl;
}
.ui-datepicker-rtl .ui-datepicker-prev {
	right: 2px;
	left: auto;
}
.ui-datepicker-rtl .ui-datepicker-next {
	left: 2px;
	right: auto;
}
.ui-datepicker-rtl .ui-datepicker-prev:hover {
	right: 1px;
	left: auto;
}
.ui-datepicker-rtl .ui-datepicker-next:hover {
	left: 1px;
	right: auto;
}
.ui-datepicker-rtl .ui-datepicker-buttonpane {
	clear: right;
}
.ui-datepicker-rtl .ui-datepicker-buttonpane button {
	float: left;
}
.ui-datepicker-rtl .ui-datepicker-buttonpane button.ui-datepicker-current,
.ui-datepicker-rtl .ui-datepicker-group {
	float: right;
}
.ui-datepicker-rtl .ui-datepicker-group-last .ui-datepicker-header,
.ui-datepicker-rtl .ui-datepicker-group-middle .ui-datepicker-header {
	border-right-width: 0;
	border-left-width: 1px;
}

/* Icons */
.ui-datepicker .ui-icon {
	display: block;
	text-indent: -99999px;
	overflow: hidden;
	background-repeat: no-repeat;
	left: .5em;
	top: .3em;
}
.ui-dialog {
	position: absolute;
	top: 0;
	left: 0;
	padding: .2em;
	outline: 0;
}
.ui-dialog .ui-dialog-titlebar {
	padding: .4em 1em;
	position: relative;
}
.ui-dialog .ui-dialog-title {
	float: left;
	margin: .1em 0;
	white-space: nowrap;
	width: 90%;
	overflow: hidden;
	text-overflow: ellipsis;
}
.ui-dialog .ui-dialog-titlebar-close {
	position: absolute;
	right: .3em;
	top: 50%;
	width: 20px;
	margin: -10px 0 0 0;
	padding: 1px;
	height: 20px;
}
.ui-dialog .ui-dialog-content {
	position: relative;
	border: 0;
	padding: .5em 1em;
	background: none;
	overflow: auto;
}
.ui-dialog .ui-dialog-buttonpane {
	text-align: left;
	border-width: 1px 0 0 0;
	background-image: none;
	margin-top: .5em;
	padding: .3em 1em .5em .4em;
}
.ui-dialog .ui-dialog-buttonpane .ui-dialog-buttonset {
	float: right;
}
.ui-dialog .ui-dialog-buttonpane button {
	margin: .5em .4em .5em 0;
	cursor: pointer;
}
.ui-dialog .ui-resizable-n {
	height: 2px;
	top: 0;
}
.ui-dialog .ui-resizable-e {
	width: 2px;
	right: 0;
}
.ui-dialog .ui-resizable-s {
	height: 2px;
	bottom: 0;
}
.ui-dialog .ui-resizable-w {
	width: 2px;
	left: 0;
}
.ui-dialog .ui-resizable-se,
.ui-dialog .ui-resizable-sw,
.ui-dialog .ui-resizable-ne,
.ui-dialog .ui-resizable-nw {
	width: 7px;
	height: 7px;
}
.ui-dialog .ui-resizable-se {
	right: 0;
	bottom: 0;
}
.ui-dialog .ui-resizable-sw {
	left: 0;
	bottom: 0;
}
.ui-dialog .ui-resizable-ne {
	right: 0;
	top: 0;
}
.ui-dialog .ui-resizable-nw {
	left: 0;
	top: 0;
}
.ui-draggable .ui-dialog-titlebar {
	cursor: move;
}
.ui-draggable-handle {
	-ms-touch-action: none;
	touch-action: none;
}
.ui-resizable {
	position: relative;
}
.ui-resizable-handle {
	position: absolute;
	font-size: 0.1px;
	display: block;
	-ms-touch-action: none;
	touch-action: none;
}
.ui-resizable-disabled .ui-resizable-handle,
.ui-resizable-autohide .ui-resizable-handle {
	display: none;
}
.ui-resizable-n {
	cursor: n-resize;
	height: 7px;
	width: 100%;
	top: -5px;
	left: 0;
}
.ui-resizable-s {
	cursor: s-resize;
	height: 7px;
	width: 100%;
	bottom: -5px;
	left: 0;
}
.ui-resizable-e {
	cursor: e-resize;
	width: 7px;
	right: -5px;
	top: 0;
	height: 100%;
}
.ui-resizable-w {
	cursor: w-resize;
	width: 7px;
	left: -5px;
	top: 0;
	height: 100%;
}
.ui-resizable-se {
	cursor: se-resize;
	width: 12px;
	height: 12px;
	right: 1px;
	bottom: 1px;
}
.ui-resizable-sw {
	cursor: sw-resize;
	width: 9px;
	height: 9px;
	left: -5px;
	bottom: -5px;
}
.ui-resizable-nw {
	cursor: nw-resize;
	width: 9px;
	height: 9px;
	left: -5px;
	top: -5px;
}
.ui-resizable-ne {
	cursor: ne-resize;
	width: 9px;
	height: 9px;
	right: -5px;
	top: -5px;
}
.ui-progressbar {
	height: 2em;
	text-align: left;
	overflow: hidden;
}
.ui-progressbar .ui-progressbar-value {
	margin: -1px;
	height: 100%;
}
.ui-progressbar .ui-progressbar-overlay {
	background: url("data:image/gif;base64,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");
	height: 100%;
	filter: alpha(opacity=25); /* support: IE8 */
	opacity: 0.25;
}
.ui-progressbar-indeterminate .ui-progressbar-value {
	background-image: none;
}
.ui-selectable {
	-ms-touch-action: none;
	touch-action: none;
}
.ui-selectable-helper {
	position: absolute;
	z-index: 100;
	border: 1px dotted black;
}
.ui-selectmenu-menu {
	padding: 0;
	margin: 0;
	position: absolute;
	top: 0;
	left: 0;
	display: none;
}
.ui-selectmenu-menu .ui-menu {
	overflow: auto;
	overflow-x: hidden;
	padding-bottom: 1px;
}
.ui-selectmenu-menu .ui-menu .ui-selectmenu-optgroup {
	font-size: 1em;
	font-weight: bold;
	line-height: 1.5;
	padding: 2px 0.4em;
	margin: 0.5em 0 0 0;
	height: auto;
	border: 0;
}
.ui-selectmenu-open {
	display: block;
}
.ui-selectmenu-text {
	display: block;
	margin-right: 20px;
	overflow: hidden;
	text-overflow: ellipsis;
}
.ui-selectmenu-button.ui-button {
	text-align: left;
	white-space: nowrap;
	width: 14em;
}
.ui-selectmenu-icon.ui-icon {
	float: right;
	margin-top: 0;
}
.ui-slider {
	position: relative;
	text-align: left;
}
.ui-slider .ui-slider-handle {
	position: absolute;
	z-index: 2;
	width: 1.2em;
	height: 1.2em;
	cursor: default;
	-ms-touch-action: none;
	touch-action: none;
}
.ui-slider .ui-slider-range {
	position: absolute;
	z-index: 1;
	font-size: .7em;
	display: block;
	border: 0;
	background-position: 0 0;
}

/* support: IE8 - See #6727 */
.ui-slider.ui-state-disabled .ui-slider-handle,
.ui-slider.ui-state-disabled .ui-slider-range {
	filter: inherit;
}

.ui-slider-horizontal {
	height: .8em;
}
.ui-slider-horizontal .ui-slider-handle {
	top: -.3em;
	margin-left: -.6em;
}
.ui-slider-horizontal .ui-slider-range {
	top: 0;
	height: 100%;
}
.ui-slider-horizontal .ui-slider-range-min {
	left: 0;
}
.ui-slider-horizontal .ui-slider-range-max {
	right: 0;
}

.ui-slider-vertical {
	width: .8em;
	height: 100px;
}
.ui-slider-vertical .ui-slider-handle {
	left: -.3em;
	margin-left: 0;
	margin-bottom: -.6em;
}
.ui-slider-vertical .ui-slider-range {
	left: 0;
	width: 100%;
}
.ui-slider-vertical .ui-slider-range-min {
	bottom: 0;
}
.ui-slider-vertical .ui-slider-range-max {
	top: 0;
}
.ui-sortable-handle {
	-ms-touch-action: none;
	touch-action: none;
}
.ui-spinner {
	position: relative;
	display: inline-block;
	overflow: hidden;
	padding: 0;
	vertical-align: middle;
}
.ui-spinner-input {
	border: none;
	background: none;
	color: inherit;
	padding: .222em 0;
	margin: .2em 0;
	vertical-align: middle;
	margin-left: .4em;
	margin-right: 2em;
}
.ui-spinner-button {
	width: 1.6em;
	height: 50%;
	font-size: .5em;
	padding: 0;
	margin: 0;
	text-align: center;
	position: absolute;
	cursor: default;
	display: block;
	overflow: hidden;
	right: 0;
}
/* more specificity required here to override default borders */
.ui-spinner a.ui-spinner-button {
	border-top-style: none;
	border-bottom-style: none;
	border-right-style: none;
}
.ui-spinner-up {
	top: 0;
}
.ui-spinner-down {
	bottom: 0;
}
.ui-tabs {
	position: relative;/* position: relative prevents IE scroll bug (element with position: relative inside container with overflow: auto appear as "fixed") */
	padding: .2em;
}
.ui-tabs .ui-tabs-nav {
	margin: 0;
	padding: .2em .2em 0;
}
.ui-tabs .ui-tabs-nav li {
	list-style: none;
	float: left;
	position: relative;
	top: 0;
	margin: 1px .2em 0 0;
	border-bottom-width: 0;
	padding: 0;
	white-space: nowrap;
}
.ui-tabs .ui-tabs-nav .ui-tabs-anchor {
	float: left;
	padding: .5em 1em;
	text-decoration: none;
}
.ui-tabs .ui-tabs-nav li.ui-tabs-active {
	margin-bottom: -1px;
	padding-bottom: 1px;
}
.ui-tabs .ui-tabs-nav li.ui-tabs-active .ui-tabs-anchor,
.ui-tabs .ui-tabs-nav li.ui-state-disabled .ui-tabs-anchor,
.ui-tabs .ui-tabs-nav li.ui-tabs-loading .ui-tabs-anchor {
	cursor: text;
}
.ui-tabs-collapsible .ui-tabs-nav li.ui-tabs-active .ui-tabs-anchor {
	cursor: pointer;
}
.ui-tabs .ui-tabs-panel {
	display: block;
	border-width: 0;
	padding: 1em 1.4em;
	background: none;
}
.ui-tooltip {
	padding: 8px;
	position: absolute;
	z-index: 9999;
	max-width: 300px;
}
body .ui-tooltip {
	border-width: 2px;
}
/* Component containers
----------------------------------*/
.ui-widget {
	font-family: Verdana,Arial,sans-serif;
	font-size: 1.1em;
}
.ui-widget .ui-widget {
	font-size: 1em;
}
.ui-widget input,
.ui-widget select,
.ui-widget textarea,
.ui-widget button {
	font-family: Verdana,Arial,sans-serif;
	font-size: 1em;
}
.ui-widget.ui-widget-content {
	border: 1px solid #d3d3d3;
}
.ui-widget-content {
	border: 1px solid #aaaaaa;
	background: #ffffff;
	color: #222222;
}
.ui-widget-content a {
	color: #222222;
}
.ui-widget-header {
	border: 1px solid #aaaaaa;
	background: #cccccc url("images/ui-bg_highlight-soft_75_cccccc_1x100.png") 50% 50% repeat-x;
	color: #222222;
	font-weight: bold;
}
.ui-widget-header a {
	color: #222222;
}

/* Interaction states
----------------------------------*/
.ui-state-default,
.ui-widget-content .ui-state-default,
.ui-widget-header .ui-state-default,
.ui-button,

/* We use html here because we need a greater specificity to make sure disabled
works properly when clicked or hovered */
html .ui-button.ui-state-disabled:hover,
html .ui-button.ui-state-disabled:active {
	border: 1px solid #d3d3d3;
	background: #e6e6e6 url("images/ui-bg_glass_75_e6e6e6_1x400.png") 50% 50% repeat-x;
	font-weight: normal;
	color: #555555;
}
.ui-state-default a,
.ui-state-default a:link,
.ui-state-default a:visited,
a.ui-button,
a:link.ui-button,
a:visited.ui-button,
.ui-button {
	color: #555555;
	text-decoration: none;
}
.ui-state-hover,
.ui-widget-content .ui-state-hover,
.ui-widget-header .ui-state-hover,
.ui-state-focus,
.ui-widget-content .ui-state-focus,
.ui-widget-header .ui-state-focus,
.ui-button:hover,
.ui-button:focus {
	border: 1px solid #999999;
	background: #dadada url("images/ui-bg_glass_75_dadada_1x400.png") 50% 50% repeat-x;
	font-weight: normal;
	color: #212121;
}
.ui-state-hover a,
.ui-state-hover a:hover,
.ui-state-hover a:link,
.ui-state-hover a:visited,
.ui-state-focus a,
.ui-state-focus a:hover,
.ui-state-focus a:link,
.ui-state-focus a:visited,
a.ui-button:hover,
a.ui-button:focus {
	color: #212121;
	text-decoration: none;
}

.ui-visual-focus {
	box-shadow: 0 0 3px 1px rgb(94, 158, 214);
}
.ui-state-active,
.ui-widget-content .ui-state-active,
.ui-widget-header .ui-state-active,
a.ui-button:active,
.ui-button:active,
.ui-button.ui-state-active:hover {
	border: 1px solid #aaaaaa;
	background: #ffffff url("images/ui-bg_glass_65_ffffff_1x400.png") 50% 50% repeat-x;
	font-weight: normal;
	color: #212121;
}
.ui-icon-background,
.ui-state-active .ui-icon-background {
	border: #aaaaaa;
	background-color: #212121;
}
.ui-state-active a,
.ui-state-active a:link,
.ui-state-active a:visited {
	color: #212121;
	text-decoration: none;
}

/* Interaction Cues
----------------------------------*/
.ui-state-highlight,
.ui-widget-content .ui-state-highlight,
.ui-widget-header .ui-state-highlight {
	border: 1px solid #fcefa1;
	background: #fbf9ee url("images/ui-bg_glass_55_fbf9ee_1x400.png") 50% 50% repeat-x;
	color: #363636;
}
.ui-state-checked {
	border: 1px solid #fcefa1;
	background: #fbf9ee;
}
.ui-state-highlight a,
.ui-widget-content .ui-state-highlight a,
.ui-widget-header .ui-state-highlight a {
	color: #363636;
}
.ui-state-error,
.ui-widget-content .ui-state-error,
.ui-widget-header .ui-state-error {
	border: 1px solid #cd0a0a;
	background: #fef1ec url("images/ui-bg_glass_95_fef1ec_1x400.png") 50% 50% repeat-x;
	color: #cd0a0a;
}
.ui-state-error a,
.ui-widget-content .ui-state-error a,
.ui-widget-header .ui-state-error a {
	color: #cd0a0a;
}
.ui-state-error-text,
.ui-widget-content .ui-state-error-text,
.ui-widget-header .ui-state-error-text {
	color: #cd0a0a;
}
.ui-priority-primary,
.ui-widget-content .ui-priority-primary,
.ui-widget-header .ui-priority-primary {
	font-weight: bold;
}
.ui-priority-secondary,
.ui-widget-content .ui-priority-secondary,
.ui-widget-header .ui-priority-secondary {
	opacity: .7;
	filter:Alpha(Opacity=70); /* support: IE8 */
	font-weight: normal;
}
.ui-state-disabled,
.ui-widget-content .ui-state-disabled,
.ui-widget-header .ui-state-disabled {
	opacity: .35;
	filter:Alpha(Opacity=35); /* support: IE8 */
	background-image: none;
}
.ui-state-disabled .ui-icon {
	filter:Alpha(Opacity=35); /* support: IE8 - See #6059 */
}

/* Icons
----------------------------------*/

/* states and images */
.ui-icon {
	width: 16px;
	height: 16px;
}
.ui-icon,
.ui-widget-content .ui-icon {
	background-image: url("images/ui-icons_222222_256x240.png");
}
.ui-widget-header .ui-icon {
	background-image: url("images/ui-icons_222222_256x240.png");
}
.ui-state-hover .ui-icon,
.ui-state-focus .ui-icon,
.ui-button:hover .ui-icon,
.ui-button:focus .ui-icon {
	background-image: url("images/ui-icons_454545_256x240.png");
}
.ui-state-active .ui-icon,
.ui-button:active .ui-icon {
	background-image: url("images/ui-icons_454545_256x240.png");
}
.ui-state-highlight .ui-icon,
.ui-button .ui-state-highlight.ui-icon {
	background-image: url("images/ui-icons_2e83ff_256x240.png");
}
.ui-state-error .ui-icon,
.ui-state-error-text .ui-icon {
	background-image: url("images/ui-icons_cd0a0a_256x240.png");
}
.ui-button .ui-icon {
	background-image: url("images/ui-icons_888888_256x240.png");
}

/* positioning */
.ui-icon-blank { background-position: 16px 16px; }
.ui-icon-caret-1-n { background-position: 0 0; }
.ui-icon-caret-1-ne { background-position: -16px 0; }
.ui-icon-caret-1-e { background-position: -32px 0; }
.ui-icon-caret-1-se { background-position: -48px 0; }
.ui-icon-caret-1-s { background-position: -65px 0; }
.ui-icon-caret-1-sw { background-position: -80px 0; }
.ui-icon-caret-1-w { background-position: -96px 0; }
.ui-icon-caret-1-nw { background-position: -112px 0; }
.ui-icon-caret-2-n-s { background-position: -128px 0; }
.ui-icon-caret-2-e-w { background-position: -144px 0; }
.ui-icon-triangle-1-n { background-position: 0 -16px; }
.ui-icon-triangle-1-ne { background-position: -16px -16px; }
.ui-icon-triangle-1-e { background-position: -32px -16px; }
.ui-icon-triangle-1-se { background-position: -48px -16px; }
.ui-icon-triangle-1-s { background-position: -65px -16px; }
.ui-icon-triangle-1-sw { background-position: -80px -16px; }
.ui-icon-triangle-1-w { background-position: -96px -16px; }
.ui-icon-triangle-1-nw { background-position: -112px -16px; }
.ui-icon-triangle-2-n-s { background-position: -128px -16px; }
.ui-icon-triangle-2-e-w { background-position: -144px -16px; }
.ui-icon-arrow-1-n { background-position: 0 -32px; }
.ui-icon-arrow-1-ne { background-position: -16px -32px; }
.ui-icon-arrow-1-e { background-position: -32px -32px; }
.ui-icon-arrow-1-se { background-position: -48px -32px; }
.ui-icon-arrow-1-s { background-position: -65px -32px; }
.ui-icon-arrow-1-sw { background-position: -80px -32px; }
.ui-icon-arrow-1-w { background-position: -96px -32px; }
.ui-icon-arrow-1-nw { background-position: -112px -32px; }
.ui-icon-arrow-2-n-s { background-position: -128px -32px; }
.ui-icon-arrow-2-ne-sw { background-position: -144px -32px; }
.ui-icon-arrow-2-e-w { background-position: -160px -32px; }
.ui-icon-arrow-2-se-nw { background-position: -176px -32px; }
.ui-icon-arrowstop-1-n { background-position: -192px -32px; }
.ui-icon-arrowstop-1-e { background-position: -208px -32px; }
.ui-icon-arrowstop-1-s { background-position: -224px -32px; }
.ui-icon-arrowstop-1-w { background-position: -240px -32px; }
.ui-icon-arrowthick-1-n { background-position: 1px -48px; }
.ui-icon-arrowthick-1-ne { background-position: -16px -48px; }
.ui-icon-arrowthick-1-e { background-position: -32px -48px; }
.ui-icon-arrowthick-1-se { background-position: -48px -48px; }
.ui-icon-arrowthick-1-s { background-position: -64px -48px; }
.ui-icon-arrowthick-1-sw { background-position: -80px -48px; }
.ui-icon-arrowthick-1-w { background-position: -96px -48px; }
.ui-icon-arrowthick-1-nw { background-position: -112px -48px; }
.ui-icon-arrowthick-2-n-s { background-position: -128px -48px; }
.ui-icon-arrowthick-2-ne-sw { background-position: -144px -48px; }
.ui-icon-arrowthick-2-e-w { background-position: -160px -48px; }
.ui-icon-arrowthick-2-se-nw { background-position: -176px -48px; }
.ui-icon-arrowthickstop-1-n { background-position: -192px -48px; }
.ui-icon-arrowthickstop-1-e { background-position: -208px -48px; }
.ui-icon-arrowthickstop-1-s { background-position: -224px -48px; }
.ui-icon-arrowthickstop-1-w { background-position: -240px -48px; }
.ui-icon-arrowreturnthick-1-w { background-position: 0 -64px; }
.ui-icon-arrowreturnthick-1-n { background-position: -16px -64px; }
.ui-icon-arrowreturnthick-1-e { background-position: -32px -64px; }
.ui-icon-arrowreturnthick-1-s { background-position: -48px -64px; }
.ui-icon-arrowreturn-1-w { background-position: -64px -64px; }
.ui-icon-arrowreturn-1-n { background-position: -80px -64px; }
.ui-icon-arrowreturn-1-e { background-position: -96px -64px; }
.ui-icon-arrowreturn-1-s { background-position: -112px -64px; }
.ui-icon-arrowrefresh-1-w { background-position: -128px -64px; }
.ui-icon-arrowrefresh-1-n { background-position: -144px -64px; }
.ui-icon-arrowrefresh-1-e { background-position: -160px -64px; }
.ui-icon-arrowrefresh-1-s { background-position: -176px -64px; }
.ui-icon-arrow-4 { background-position: 0 -80px; }
.ui-icon-arrow-4-diag { background-position: -16px -80px; }
.ui-icon-extlink { background-position: -32px -80px; }
.ui-icon-newwin { background-position: -48px -80px; }
.ui-icon-refresh { background-position: -64px -80px; }
.ui-icon-shuffle { background-position: -80px -80px; }
.ui-icon-transfer-e-w { background-position: -96px -80px; }
.ui-icon-transferthick-e-w { background-position: -112px -80px; }
.ui-icon-folder-collapsed { background-position: 0 -96px; }
.ui-icon-folder-open { background-position: -16px -96px; }
.ui-icon-document { background-position: -32px -96px; }
.ui-icon-document-b { background-position: -48px -96px; }
.ui-icon-note { background-position: -64px -96px; }
.ui-icon-mail-closed { background-position: -80px -96px; }
.ui-icon-mail-open { background-position: -96px -96px; }
.ui-icon-suitcase { background-position: -112px -96px; }
.ui-icon-comment { background-position: -128px -96px; }
.ui-icon-person { background-position: -144px -96px; }
.ui-icon-print { background-position: -160px -96px; }
.ui-icon-trash { background-position: -176px -96px; }
.ui-icon-locked { background-position: -192px -96px; }
.ui-icon-unlocked { background-position: -208px -96px; }
.ui-icon-bookmark { background-position: -224px -96px; }
.ui-icon-tag { background-position: -240px -96px; }
.ui-icon-home { background-position: 0 -112px; }
.ui-icon-flag { background-position: -16px -112px; }
.ui-icon-calendar { background-position: -32px -112px; }
.ui-icon-cart { background-position: -48px -112px; }
.ui-icon-pencil { background-position: -64px -112px; }
.ui-icon-clock { background-position: -80px -112px; }
.ui-icon-disk { background-position: -96px -112px; }
.ui-icon-calculator { background-position: -112px -112px; }
.ui-icon-zoomin { background-position: -128px -112px; }
.ui-icon-zoomout { background-position: -144px -112px; }
.ui-icon-search { background-position: -160px -112px; }
.ui-icon-wrench { background-position: -176px -112px; }
.ui-icon-gear { background-position: -192px -112px; }
.ui-icon-heart { background-position: -208px -112px; }
.ui-icon-star { background-position: -224px -112px; }
.ui-icon-link { background-position: -240px -112px; }
.ui-icon-cancel { background-position: 0 -128px; }
.ui-icon-plus { background-position: -16px -128px; }
.ui-icon-plusthick { background-position: -32px -128px; }
.ui-icon-minus { background-position: -48px -128px; }
.ui-icon-minusthick { background-position: -64px -128px; }
.ui-icon-close { background-position: -80px -128px; }
.ui-icon-closethick { background-position: -96px -128px; }
.ui-icon-key { background-position: -112px -128px; }
.ui-icon-lightbulb { background-position: -128px -128px; }
.ui-icon-scissors { background-position: -144px -128px; }
.ui-icon-clipboard { background-position: -160px -128px; }
.ui-icon-copy { background-position: -176px -128px; }
.ui-icon-contact { background-position: -192px -128px; }
.ui-icon-image { background-position: -208px -128px; }
.ui-icon-video { background-position: -224px -128px; }
.ui-icon-script { background-position: -240px -128px; }
.ui-icon-alert { background-position: 0 -144px; }
.ui-icon-info { background-position: -16px -144px; }
.ui-icon-notice { background-position: -32px -144px; }
.ui-icon-help { background-position: -48px -144px; }
.ui-icon-check { background-position: -64px -144px; }
.ui-icon-bullet { background-position: -80px -144px; }
.ui-icon-radio-on { background-position: -96px -144px; }
.ui-icon-radio-off { background-position: -112px -144px; }
.ui-icon-pin-w { background-position: -128px -144px; }
.ui-icon-pin-s { background-position: -144px -144px; }
.ui-icon-play { background-position: 0 -160px; }
.ui-icon-pause { background-position: -16px -160px; }
.ui-icon-seek-next { background-position: -32px -160px; }
.ui-icon-seek-prev { background-position: -48px -160px; }
.ui-icon-seek-end { background-position: -64px -160px; }
.ui-icon-seek-start { background-position: -80px -160px; }
/* ui-icon-seek-first is deprecated, use ui-icon-seek-start instead */
.ui-icon-seek-first { background-position: -80px -160px; }
.ui-icon-stop { background-position: -96px -160px; }
.ui-icon-eject { background-position: -112px -160px; }
.ui-icon-volume-off { background-position: -128px -160px; }
.ui-icon-volume-on { background-position: -144px -160px; }
.ui-icon-power { background-position: 0 -176px; }
.ui-icon-signal-diag { background-position: -16px -176px; }
.ui-icon-signal { background-position: -32px -176px; }
.ui-icon-battery-0 { background-position: -48px -176px; }
.ui-icon-battery-1 { background-position: -64px -176px; }
.ui-icon-battery-2 { background-position: -80px -176px; }
.ui-icon-battery-3 { background-position: -96px -176px; }
.ui-icon-circle-plus { background-position: 0 -192px; }
.ui-icon-circle-minus { background-position: -16px -192px; }
.ui-icon-circle-close { background-position: -32px -192px; }
.ui-icon-circle-triangle-e { background-position: -48px -192px; }
.ui-icon-circle-triangle-s { background-position: -64px -192px; }
.ui-icon-circle-triangle-w { background-position: -80px -192px; }
.ui-icon-circle-triangle-n { background-position: -96px -192px; }
.ui-icon-circle-arrow-e { background-position: -112px -192px; }
.ui-icon-circle-arrow-s { background-position: -128px -192px; }
.ui-icon-circle-arrow-w { background-position: -144px -192px; }
.ui-icon-circle-arrow-n { background-position: -160px -192px; }
.ui-icon-circle-zoomin { background-position: -176px -192px; }
.ui-icon-circle-zoomout { background-position: -192px -192px; }
.ui-icon-circle-check { background-position: -208px -192px; }
.ui-icon-circlesmall-plus { background-position: 0 -208px; }
.ui-icon-circlesmall-minus { background-position: -16px -208px; }
.ui-icon-circlesmall-close { background-position: -32px -208px; }
.ui-icon-squaresmall-plus { background-position: -48px -208px; }
.ui-icon-squaresmall-minus { background-position: -64px -208px; }
.ui-icon-squaresmall-close { background-position: -80px -208px; }
.ui-icon-grip-dotted-vertical { background-position: 0 -224px; }
.ui-icon-grip-dotted-horizontal { background-position: -16px -224px; }
.ui-icon-grip-solid-vertical { background-position: -32px -224px; }
.ui-icon-grip-solid-horizontal { background-position: -48px -224px; }
.ui-icon-gripsmall-diagonal-se { background-position: -64px -224px; }
.ui-icon-grip-diagonal-se { background-position: -80px -224px; }


/* Misc visuals
----------------------------------*/

/* Corner radius */
.ui-corner-all,
.ui-corner-top,
.ui-corner-left,
.ui-corner-tl {
	border-top-left-radius: 4px;
}
.ui-corner-all,
.ui-corner-top,
.ui-corner-right,
.ui-corner-tr {
	border-top-right-radius: 4px;
}
.ui-corner-all,
.ui-corner-bottom,
.ui-corner-left,
.ui-corner-bl {
	border-bottom-left-radius: 4px;
}
.ui-corner-all,
.ui-corner-bottom,
.ui-corner-right,
.ui-corner-br {
	border-bottom-right-radius: 4px;
}

/* Overlays */
.ui-widget-overlay {
	background: #aaaaaa;
	opacity: .3;
	filter: Alpha(Opacity=30); /* support: IE8 */
}
.ui-widget-shadow {
	-webkit-box-shadow: -8px -8px 8px #aaaaaa;
	box-shadow: -8px -8px 8px #aaaaaa;
}


.d_flex {
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
}
.item_cent {
    -webkit-box-align: center;
    -ms-flex-align: center;
    align-items: center;
}
.space_btwn {
    -webkit-box-pack: justify;
    -ms-flex-pack: justify;
    justify-content: space-between;
}
.schedule_calender_header {
    margin-bottom: 15px;
}
.item_cent {
    -webkit-box-align: center;
    -ms-flex-align: center;
    align-items: center;
}
.schedule_calender_header .render-range {
    font-size: 15px;
    color: #000;
    font-weight: 700;
    margin-right: 15px;
}
.schedule_calender_header .move-day {
    width: 22px;
    height: 22px;
    border-radius: 50%;
    -webkit-transform: rotate(90deg);
    transform: rotate(90deg);
    padding: 6px;
}
.schedule_calender_header .move-day.move-next {
    -webkit-transform: rotate(-90deg);
    transform: rotate(-90deg);
}
.schedule_calender_header .move-today {
    background: #fff;
    font-size: 13px;
    color: #000;
    padding: 9px 16px;
    border: 1px solid #E1E4ED;
    border-radius: 6px;
    margin-left: 15px;
}

.card {
    width: 460px;
    margin: 15px auto;
    -webkit-box-shadow: 0px 4px 11px rgba(0,0,0,0.2);
    box-shadow: 0px 4px 11px rgba(0,0,0,0.2);
    border-radius: 15px;
    opacity: 0;
    visibility: hidden;
    -webkit-transition: all .6s;
    transition: all .6s;
    position: absolute;
    top: 0;
    left: 0;
}

.promo_card {
    width: 50%;
    margin: 15px auto;
    box-shadow: 0px 4px 11px rgba(0,0,0,0.2);
    border-radius: 15px;
    -webkit-transition: all .6s;
    transition: all .6s;
    position: fixed;
    top: 0;
    left: 0;
    z-index: 22241;
    background: red;
    display: none;
}
#event.promo_card {
    background: green;
}
#offer.promo_card {
    background: blue;
}
#create.promo_card {
    background: black;
}
.tui-full-calendar-layout {
    margin:0 auto;
    width:80%;
    
}
h2 {
    font-size: 25px;
    padding: 15px 40px;
    color: #fff;
}
.btn_prev{
	border:2px solid red;
	width: 80%;
	text-align: right;
}
.calendar_range{
	border:2px solid red;
	width: 20%;	
	text-align: center;
	font-size: 30px;
	font-weight: 700;
	margin-left:10px;
}
.btn_next{
	border:2px solid red;
	width: 80%;
	text-align: left;
	margin-left:10px;
}
.btn_all{
	border:2px solid blue;
	width: 100%;
	display:flex;
	margin-bottom:30px;
	
}

</style>
<!-- <section class="mt-5">
	<div class="container mx-auto px-3">
		Lorem ipsum dolor sit amet, consectetur adipisicing elit. Explicabo beatae
		veniam placeat odio voluptatibus est error consequatur enim optio consectetur sunt accusantium molestiae cupiditate
		quis repellendus facere atque ducimus velit.


		<h1 class=" main-top">Toast UI</h1>
		<h2 id="calendarTitle"></h2>
		<div>
			<button type="button" class="btn btn-default js-calendar-prev">&lt;</button>
			<button type="button" class="btn btn-default js-calendar-next">&gt;</button>
			<button type="button" class="btn btn-default js-calendar-today">today</button>			
			
			<button type="button" class="btn btn-default js-calendar-day-view">Day</button>
		</div>
		<div id="calendar">
	</div>
</section>
 -->


<section class="mt-5">
	<div class="container mx-auto px-3">
      <div id="menu-navi">
        <button type="button" class="js-calendar-today btn btn-default btn-sm move-today" data-action="move-today">Today</button>
        <button type="button" class="js-calendar-month-view btn btn-default btn-sm move-month">Month</button>
		<button type="button" class="js-calendar-week-view btn btn-default btn-sm move-week">Week</button>
        
        <div class="btn_all">
      <div class="btn_prev">
        <button type="button" class=" btn btn-default btn-md move-day" data-action="move-prev">
         &lt;
        </button>
      </div>
        <!-- 월/년 -->
        <div class="calendar_range">
      <span id="renderRange" class="render-range"></span>
      </div>
      
      <div class="btn_next">
        <button type="button" class="btn btn-default btn-md move-day" data-action="move-next">
          &gt;
        </button>
        </div>
        	</div>
        
      </div>
      </div>
</section>

<div class="promo_card" id="post">
	<h2>Custom popUp Post </h2>
</div>
<div class="promo_card" id="event">
	<h2>Custom popUp Event </h2>
</div>
<div class="promo_card" id="offer">
	<h2>Custom popUp Offer </h2>
</div>
<div class="promo_card" id="create">
	<h2>Custom Create Schedule popUp </h2>
</div>



<script>



'use strict';

var CalendarList = [];

function CalendarInfo() {
    this.id = null;
    this.name = null;
    this.checked = true;
    this.color = null;
    this.bgColor = null;
    this.borderColor = null;
    this.dragBgColor = null;
}

function addCalendar(calendar) {
    CalendarList.push(calendar);
}

function findCalendar(id) {
    var found;

    CalendarList.forEach(function(calendar) {
        if (calendar.id === id) {
            found = calendar;
        }
    });

    return found || CalendarList[0];
}

function hexToRGBA(hex) {
    var radix = 16;
    var r = parseInt(hex.slice(1, 3), radix),
        g = parseInt(hex.slice(3, 5), radix),
        b = parseInt(hex.slice(5, 7), radix),
        a = parseInt(hex.slice(7, 9), radix) / 255 || 1;
    var rgba = 'rgba(' + r + ', ' + g + ', ' + b + ', ' + a + ')';

    return rgba;
}

/* 달력스케줄 등록폼에서 프로젝트/개인업무 구분 */

(function() {
    var calendar;
    var id = 0;

    calendar = new CalendarInfo();
    id += 1;
    calendar.id = String(id);
    calendar.name = '프로젝트';
    calendar.color = '#ffffff';
    calendar.bgColor = '#19A7CE';
    calendar.dragBgColor = '#F0EFF6';
    calendar.borderColor = '#F0EFF6';
    addCalendar(calendar);

    calendar = new CalendarInfo();
    id += 1;
    calendar.id = String(id);
    calendar.name = '개인업무';
    calendar.color = '#ffffff';
    calendar.bgColor = '#F7D060';
    calendar.dragBgColor = '#FDF8F3';
    calendar.borderColor = '#FDF8F3';
    addCalendar(calendar);

  
})();

/* 여까지 */

(function(window, Calendar) {

    var cal, resizeThrottled;
    var useCreationPopup = true;
    var useDetailPopup = true;
    var datePicker, selectedCalendar;

    cal = new Calendar('#calendar', {
        defaultView: 'month',
        useCreationPopup: useCreationPopup,
        useDetailPopup: useDetailPopup,
        calendars: CalendarList,
        template: {
            milestone: function(model) {
                return '<span class="calendar-font-icon ic-milestone-b"></span> <span style="background-color: ' + model.bgColor + '">' + model.title + '</span>';
            },
            allday: function(schedule) {
                return getTimeTemplate(schedule, true);
            },
            time: function(schedule) {
                return getTimeTemplate(schedule, false);
            }
        }
    });

    // event handlers
    cal.on({
        'clickMore': function(e) {
            console.log('clickMore', e);
        },
        'clickSchedule': function(e) {
            // var topValue;
            // var leftValue;
            // topValue = (e.event.clientY/2)+45;
            // leftValue = e.event.clientX;
            // if ( e.schedule.calendarId === '1' ) {
            //     console.log('clickSchedule', e.schedule.calendarId);
            // 				$("#post").fadeIn();
            // $("#offer").fadeOut();
            // $("#event").fadeOut();
            // $("#create").fadeOut();
            //     $(".promo_card").css({
            //         top: topValue,
            //         left: leftValue
            //     })
            //     return;
            // }
            // if ( e.schedule.calendarId === '2' ) {
            //     console.log('clickSchedule', e.schedule.calendarId);
            // 				$("#event").fadeIn();
            // $("#post").fadeOut();
            // $("#offer").fadeOut();
            // $("#create").fadeOut();
            //     $(".promo_card").css({
            //         top: topValue,
            //         left: leftValue
            //     })
            //     return;
            // }
            // if ( e.schedule.calendarId === '3' ) {
            //     console.log('clickSchedule', e.schedule.calendarId);
            // 				$("#offer").fadeIn();
            // $("#post").fadeOut();
            // $("#event").fadeOut();
            // $("#create").fadeOut();
            //     $(".promo_card").css({
            //         top: topValue,
            //         left: leftValue
            //     })
            //     return;
            // }
            // console.log('ada ', e.event.clientX)
            // if( e.event.clientX > (window.windth - 200) ) {
            // }
            // console.log('clickSchedule', e);
        },
        'clickDayname': function(date) {
            console.log('clickDayname', date);
        },
        'beforeCreateSchedule': function(e) {

            // $("#create").fadeIn();
									
            saveNewSchedule(e);
        },
        'beforeUpdateSchedule': function(e) {
            var schedule = e.schedule;
            var changes = e.changes;

            console.log('beforeUpdateSchedule', e);

            cal.updateSchedule(schedule.id, schedule.calendarId, changes);
            refreshScheduleVisibility();
        },
        'beforeDeleteSchedule': function(e) {
            console.log('beforeDeleteSchedule', e);
            cal.deleteSchedule(e.schedule.id, e.schedule.calendarId);
        },
        'afterRenderSchedule': function(e) {
            var schedule = e.schedule;
            // var element = cal.getElement(schedule.id, schedule.calendarId);
            // console.log('afterRenderSchedule', element);
        },
        'clickTimezonesCollapseBtn': function(timezonesCollapsed) {
            console.log('timezonesCollapsed', timezonesCollapsed);

            if (timezonesCollapsed) {
                cal.setTheme({
                    'week.daygridLeft.width': '77px',
                    'week.timegridLeft.width': '77px'
                });
            } else {
                cal.setTheme({
                    'week.daygridLeft.width': '60px',
                    'week.timegridLeft.width': '60px'
                });
            }

            return true;
        }
    });

    function getTimeTemplate(schedule, isAllDay) {
        var html = [];
        var start = moment(schedule.start.toUTCString());
        if (!isAllDay) {
            html.push('<strong>' + start.format('HH:mm') + '</strong> ');
        }
        if (schedule.isPrivate) {
            html.push('<span class="calendar-font-icon ic-lock-b"></span>');
            html.push(' Private');
        } else {
            if (schedule.isReadOnly) {
                html.push('<span class="calendar-font-icon ic-readonly-b"></span>');
            } else if (schedule.recurrenceRule) {
                html.push('<span class="calendar-font-icon ic-repeat-b"></span>');
            } else if (schedule.attendees.length) {
                html.push('<span class="calendar-font-icon ic-user-b"></span>');
            } else if (schedule.location) {
                html.push('<span class="calendar-font-icon ic-location-b"></span>');
            }
            html.push(' ' + schedule.title);
        }

        return html.join('');
    }

    function onClickNavi(e) {
        var action = getDataAction(e.target);

        switch (action) {
            case 'move-prev':
                cal.prev();
                break;
            case 'move-next':
                cal.next();
                break;
            case 'move-today':
                cal.today();
                break;
            default:
                return;
        }

        setRenderRangeText();
        setSchedules();
    }

    function onNewSchedule() {
        var title = $('#new-schedule-title').val();
        var location = $('#new-schedule-location').val();
        var isAllDay = document.getElementById('new-schedule-allday').checked;
        var start = datePicker.getStartDate();
        var end = datePicker.getEndDate();
        var calendar = selectedCalendar ? selectedCalendar : CalendarList[0];

        if (!title) {
            return;
        }

        console.log('calendar.id ', calendar.id)
        cal.createSchedules([{
            id: '1',
            calendarId: calendar.id,
            title: title,
            isAllDay: isAllDay,
            start: start,
            end: end,
            category: isAllDay ? 'allday' : 'time',
            dueDateClass: '',
            color: calendar.color,
            bgColor: calendar.bgColor,
            dragBgColor: calendar.bgColor,
            borderColor: calendar.borderColor,
            raw: {
                location: location
            },
            state: 'Busy'
        }]);

        $('#modal-new-schedule').modal('hide');
    }

    function onChangeNewScheduleCalendar(e) {
        var target = $(e.target).closest('a[role="menuitem"]')[0];
        var calendarId = getDataAction(target);
        changeNewScheduleCalendar(calendarId);
    }

    function changeNewScheduleCalendar(calendarId) {
        var calendarNameElement = document.getElementById('calendarName');
        var calendar = findCalendar(calendarId);
        var html = [];

        html.push('<span class="calendar-bar" style="background-color: ' + calendar.bgColor + '; border-color:' + calendar.borderColor + ';"></span>');
        html.push('<span class="calendar-name">' + calendar.name + '</span>');

        calendarNameElement.innerHTML = html.join('');

        selectedCalendar = calendar;
    }

    function createNewSchedule(event) {
        var start = event.start ? new Date(event.start.getTime()) : new Date();
        var end = event.end ? new Date(event.end.getTime()) : moment().add(1, 'hours').toDate();

        if (useCreationPopup) {
            cal.openCreationPopup({
                start: start,
                end: end
            });
        }
    }
    function saveNewSchedule(scheduleData) {
        console.log('scheduleData ', scheduleData)
        var calendar = scheduleData.calendar || findCalendar(scheduleData.calendarId);
        var schedule = {
            id: '1',
            title: scheduleData.title,
            // isAllDay: scheduleData.isAllDay,
            start: scheduleData.start,
            end: scheduleData.end,
            category: 'allday',
            // category: scheduleData.isAllDay ? 'allday' : 'time',
            // dueDateClass: '',
            color: calendar.color,
            bgColor: calendar.bgColor,
            dragBgColor: calendar.bgColor,
            borderColor: calendar.borderColor,
            location: scheduleData.location,
            // raw: {
            //     class: scheduleData.raw['class']
            // },
            // state: scheduleData.state
        };
        if (calendar) {
            schedule.calendarId = calendar.id;
            schedule.color = calendar.color;
            schedule.bgColor = calendar.bgColor;
            schedule.borderColor = calendar.borderColor;
        }

        cal.createSchedules([schedule]);

        refreshScheduleVisibility();
    }


    function refreshScheduleVisibility() {
        var calendarElements = Array.prototype.slice.call(document.querySelectorAll('#calendarList input'));

        CalendarList.forEach(function(calendar) {
            cal.toggleSchedules(calendar.id, !calendar.checked, false);
        });

        cal.render(true);

        calendarElements.forEach(function(input) {
            var span = input.nextElementSibling;
            span.style.backgroundColor = input.checked ? span.style.borderColor : 'transparent';
        });
    }


    function setRenderRangeText() {
        var renderRange = document.getElementById('renderRange');
        var options = cal.getOptions();
        var viewName = cal.getViewName();
        var html = [];
        if (viewName === 'day') {
            html.push(moment(cal.getDate().getTime()).format('MMM YYYY DD'));
        } else if (viewName === 'month' &&
            (!options.month.visibleWeeksCount || options.month.visibleWeeksCount > 4)) {
            html.push(moment(cal.getDate().getTime()).format('MMM YYYY'));
        } else {
            html.push(moment(cal.getDateRangeStart().getTime()).format('MMM YYYY DD'));
            html.push(' ~ ');
            html.push(moment(cal.getDateRangeEnd().getTime()).format(' MMM DD'));
        }
        renderRange.innerHTML = html.join('');
    }

    function setSchedules() {
        cal.clear();
        var schedules = [
            {id: 489273, title: 'Workout for 2020-04-05', isAllDay: false, start: '2020-03-03T11:30:00+09:00', end: '2020-03-03T12:00:00+09:00', goingDuration: 30, comingDuration: 30, color: '#ffffff', isVisible: true, bgColor: '#69BB2D', dragBgColor: '#69BB2D', borderColor: '#69BB2D', calendarId: '1', category: 'allday', dueDateClass: '', customStyle: 'cursor: default;', isPending: false, isFocused: false, isReadOnly: false, isPrivate: false, location: '', attendees: '', recurrenceRule: '', state: ''},
            {id: 489273, title: 'Workout for 2020-04-05', isAllDay: false, start: '2020-03-11T11:30:00+09:00', end: '2020-03-11T12:00:00+09:00', goingDuration: 30, comingDuration: 30, color: '#ffffff', isVisible: true, bgColor: '#69BB2D', dragBgColor: '#69BB2D', borderColor: '#69BB2D', calendarId: '2', category: 'allday', dueDateClass: '', customStyle: 'cursor: default;', isPending: false, isFocused: false, isReadOnly: false, isPrivate: false, location: '', attendees: '', recurrenceRule: '', state: ''},
            {id: 18073, title: 'completed with blocks', isAllDay: false, start: '2020-03-20T09:00:00+09:00', end: '2020-03-20T10:00:00+09:00', color: '#ffffff', isVisible: true, bgColor: '#54B8CC', dragBgColor: '#54B8CC', borderColor: '#54B8CC', calendarId: '1', category: 'allday', dueDateClass: '', customStyle: '', isPending: false, isFocused: false, isReadOnly: false, isPrivate: false, location: '', attendees: '', recurrenceRule: '', state: ''},
            {id: 18073, title: 'completed with blocks', isAllDay: false, start: '2020-03-25T09:00:00+09:00', end: '2020-03-25T10:00:00+09:00', color: '#ffffff', isVisible: true, bgColor: '#54B8CC', dragBgColor: '#54B8CC', borderColor: '#54B8CC', calendarId: '1', category: 'allday', dueDateClass: '', customStyle: '', isPending: false, isFocused: false, isReadOnly: false, isPrivate: false, location: '', attendees: '', recurrenceRule: '', state: ''},
            {id: 18073, title: 'completed with blocks', isAllDay: false, start: '2020-01-28T09:00:00+09:00', end: '2020-01-28T10:00:00+09:00', color: '#ffffff', isVisible: true, bgColor: '#54B8CC', dragBgColor: '#54B8CC', borderColor: '#54B8CC', calendarId: '1', category: 'allday', dueDateClass: '', customStyle: '', isPending: false, isFocused: false, isReadOnly: false, isPrivate: false, location: '', attendees: '', recurrenceRule: '', state: ''},
            {id: 18073, title: 'completed with blocks', isAllDay: false, start: '2020-03-07T09:00:00+09:00', end: '2020-03-07T10:00:00+09:00', color: '#ffffff', isVisible: true, bgColor: '#54B8CC', dragBgColor: '#54B8CC', borderColor: '#54B8CC', calendarId: '1', category: 'allday', dueDateClass: '', customStyle: '', isPending: false, isFocused: false, isReadOnly: false, isPrivate: false, location: '', attendees: '', recurrenceRule: '', state: ''},
            {id: 18073, title: 'Time Schedule Need BGCOLOR', isAllDay: false, start: '2020-03-28T09:00:00+09:00', end: '2020-03-28T10:00:00+09:00', color: '#ffffff', isVisible: true, bgColor: '#54B8CC', dragBgColor: '#54B8CC', borderColor: '#54B8CC', calendarId: '1', category: 'time', dueDateClass: '', customStyle: '', isPending: false, isFocused: false, isReadOnly: false, isPrivate: false, location: '', attendees: '', recurrenceRule: '', state: ''},
            {id: 18073, title: 'Time Schedule Need BGCOLOR', isAllDay: false, start: '2020-03-17T09:00:00+09:00', end: '2020-03-17T10:00:00+09:00', color: '#ffffff', isVisible: true, bgColor: '#54B8CC', dragBgColor: '#54B8CC', borderColor: '#54B8CC', calendarId: '3', category: 'time', dueDateClass: '', customStyle: '', isPending: false, isFocused: false, isReadOnly: false, isPrivate: false, location: '', attendees: '', recurrenceRule: '', state: ''}
        ];
        // generateSchedule(cal.getViewName(), cal.getDateRangeStart(), cal.getDateRangeEnd());
        cal.createSchedules(schedules);
        // cal.createSchedules(schedules);
        refreshScheduleVisibility();
    }

    function setEventListener() {
        $('#menu-navi').on('click', onClickNavi);
        // $('.dropdown-menu a[role="menuitem"]').on('click', onClickMenu);
        // $('#lnb-calendars').on('change', onChangeCalendars);

        $('#btn-save-schedule').on('click', onNewSchedule);
        $('#btn-new-schedule').on('click', createNewSchedule);

        $('#dropdownMenu-calendars-list').on('click', onChangeNewScheduleCalendar);

        window.addEventListener('resize', resizeThrottled);
    }

    function getDataAction(target) {
        return target.dataset ? target.dataset.action : target.getAttribute('data-action');
    }

    resizeThrottled = tui.util.throttle(function() {
        cal.render();
    }, 50);

    window.cal = cal;

    // setDropdownCalendarType();
    setRenderRangeText();
    setSchedules();
    setEventListener();
})(window, tui.Calendar);

// set calendars
(function() {
    // var calendarList = document.getElementById('calendarList');
    // var html = [];
    // CalendarList.forEach(function(calendar) {
    //     html.push('<div class="lnb-calendars-item"><label>' +
    //         '<input type="checkbox" class="tui-full-calendar-checkbox-round" value="' + calendar.id + '" checked>' +
    //         '<span style="border-color: ' + calendar.borderColor + '; background-color: ' + calendar.borderColor + ';"></span>' +
    //         '<span>' + calendar.name + '</span>' +
    //         '</label></div>'
    //     );
    // });
    // calendarList.innerHTML = html.join('\n');
})();







</script>






</body>
</html>