package com.ducks.demys.boot.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Tasks {
	
	private int TASKS_NUM;
	private String TASKS_CONTENT;
	private Date REGDATE;
	private int TASKS_STATUS;
	private int TASKS_IMP;
	private Date ENDDATE;
	private int TASKS_SHARE;
	private int MEMBER_NUM;

}
