package com.ducks.demys.boot.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Schedule {
	
	private int SC_NUM;	//일정번호
	private String SC_NAME;
	private String SC_CONTENT;
	private int SC_IMP;	
	private String SC_TYPE;	//일정구분(내부회의, 외부회의, 출장, 휴가)
	private Date SC_STARTDATE;
	private Date SC_ENDDATE;
	private Date SC_REGDATE;
	private Date SC_UPDATEDATE;
	private String SC_PLACE; //일정장소(회의실, 컨퍼런스룸)
	private int SC_STATUS; //일정상태(1:프로젝트, 2:개인업무)
	private int PJ_NUM;
	private int MEMBER_NUM;
	private int TASKS_NUM;

}
