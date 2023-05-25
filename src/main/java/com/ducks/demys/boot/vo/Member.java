package com.ducks.demys.boot.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Member {
	
	private int MEMBER_NUM;
	private String MEMBER_ID;
	private String MEMBER_PW;
	private String MEMBER_NAME;

	private String MEMBER_PIC;
	
	
	private String MEMBER_PHONE;
	private String MEMBER_EMAIL;
	private Date REGDATE;
	private Date QUITDATE;
	private Date UPDATEDATE;
<<<<<<< HEAD
	private int MEMBER_AUTHORITY;
	private String MEMBER_DEP;
	private int MEMBER_STATUS;
	private int MEMBER_POSITION;
	private String VERTIFICATION_CODE;

=======
	private int MEMBER_AUTHORITY; //직책(1:팀원 2:팀장 3:인사팀)
	private String MEMBER_DEP; //담당부서
	private int MEMBER_STATUS; //직원상태(1:재직 2:휴직 3:퇴사)
	private int MEMBER_POSITION; //직급(1:사원 2:선임 3:책임)
	
>>>>>>> 14ee467a43b319ae0c45171d5facfc425f61200c
}
