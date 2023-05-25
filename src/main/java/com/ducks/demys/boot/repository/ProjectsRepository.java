package com.ducks.demys.boot.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ducks.demys.boot.command.SearchCriteria;
import com.ducks.demys.boot.vo.Projects;
import com.ducks.demys.boot.vo.ProjectsForPrint;

@Mapper
public interface ProjectsRepository {

<<<<<<< HEAD
	//public List<Projects> getPJList();
=======
	public List<Projects> getPJList();
	public List<Projects> getPJCalList(int MEMBER_NUM);

	public List<Projects> getPJListByMEMBER_NUM(int MEMBER_NUM);
>>>>>>> 14ee467a43b319ae0c45171d5facfc425f61200c
	
	public List<Projects> getPJList(SearchCriteria cri);
	
	public List<Projects> getPJCalList(int MEMBER_NUM);
	
	int getPJListCount (SearchCriteria cri);
	
	public List<ProjectsForPrint> getPJListForDashboard(int MEMBER_NUM, int PJ_IMP, String SORT);

	//public List<Projects> getPJListByMEMBER_NUM(int MEMBER_NUM);

	public List<Projects> getPJListOrderByPJ_ENDDATE();
	
	public int getPJListCount();

	public int getPJListSTATUSCount(int PJ_STATUS);

	public Projects getPJByPJ_NUM(int PJ_NUM);
	
	public int selectPJSequenceNextValue();
	
	public void registPJ(Projects project);
	
	public void modifyPJ(Projects project);
	
	public void removePJ(int PJ_NUM);
}
