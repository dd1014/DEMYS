<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="head.jsp" %>

<style>
/* p-main-body 고정 수정X, border만 씌워서 작업!! */
.p-main-body{
	margin-top:5px;
	width:100%;
	height: calc(930px - 65px - 63px); 
	background-color:#F2F2F2;
	padding:5px;
}

.budget_title{
	padding-top:20px;
	letter-spacing:2px;
	font-weight:bold;
	width:95%;
	margin-top:10px; 
	border-bottom:2px solid;
	margin:0 auto;
}
.budget_head{
	width:95%;
	height:50px;
	border:2px solid;
	margin:0 auto;
	margin-top:20px;
	background-color:#153A66;
	display:flex;
}

.budget_head_b{
	font-weight:bold;
	font-size:20px;
	color:white;
	line-height: 50px;
	margin-left:auto;
	margin-right:20px;
	
}
.budget_body{
	border:1px solid;
	width:95%;
	height:600px;
	margin:0 auto; 
	background-color:#d7d7d7;
	
}
.card_head{
	width:375px;
	height:120px;
	border-left:1px solid;
	border-top:1px solid;
	border-right:1px solid;
	border-bottom:1px solid #F0F8FF;
	margin-left:20px;
	margin-top:20px;
	background-color:#F0F8FF;
	display:flex;
	border-radius: 8px 8px 0 0;
	flex-direction: column;

	
}
.card_head_a{
	display:flex;
	margin-top:20px;
	height:30px;
	width:100%;
	margin-left:35px;

}
.head_status{
	width:50px;
	height:25px;
	line-height:20px;
	font-size:13px;
	text-align:center;
	border:1px solid;
	border-radius:5px;
	background-color: #153A66;
	color:white;
	margin:5px;
}
.head_status_a{
	width:70px;
	height:25px;
	line-height:20px;
	font-size:15px;
	font-weight:600;
	margin:5px;
	
}
.card_head_b{
	display: flex;
	width:100%;
	margin-left:20px;
}
.head_title{
	width:100%;
	font-size:20px;
	font-weight: bold;
	margin-top:5px;
	margin-left:20px;
}
.card_head_c{
	display:flex;
	height:30px;
	width:100%;
	margin-left:20px;
}
.head_reg{
	width:100%;
	font-size:12px;
	font-weight: bold;
	color:#AAAAA;
	margin-top:5px;
	margin-left:23px;
}
.card_body{
	width:375px;
	height:220px;
	border-left:1px solid;
	border-top:1px solid #F0F8FF;
	border-right:1px solid;
	border-bottom:1px solid;
	margin-left:20px;
	margin-top:20px;
	background-color:white;
	display:flex;
	border-radius: 0 0 8px 8px;
	flex-direction: column;
	margin:0 0 0 20px;
}
.card_body_a{
	width:450px;
	margin-left:15px;
}
.table{
	margin:10px;
	margin-top:15px;
	width:73%;
}
.table_tbody{
	font-weight:bold;
/* 	width:300px; */
	
}
td, th{
	border: none;
	
}
th{
	margin-left:5px;
}
td{
	text-align:right;
}
.table :where(th,td) {
    white-space: nowrap;
    vertical-align: middle;
    padding: 10px;
}
.card{
	margin:10px;

}
</style>

<link rel="stylesheet" href="/resource/css/project/list.css" />
<link rel="stylesheet" href="/resource/css/project/phead.css" />


<div class="project-part">

	<div class="p-sidbar">
		<div class="p-bt">
			<div class="p-regist">
				<button class="p-rg-bt">
					<i class="fa-regular fa-square-plus"></i>
					프로젝트등록
				</button>
				<div class="p-inend">
					<button class="p-inpro">진행중 </button>
					<button class="p-end">완료 </button>
				</div>
				<div class="p-check">
					<div style="padding-top:3px;">
					  <label class="cursor-pointer label">
					    <input type="checkbox" checked="checked" class="checkbox checkbox-info" />
					    <span class="label-text">&nbsp;전체 프로젝트</span>
					  </label>
					</div>
					<div class="w-42">
						<select class="select w-full max-w-xs">
						  	<option disabled selected>프로젝트명</option>
						  	<option>프로젝트명</option>
						  	<option>업체명</option>
						</select>
					</div>
				</div>
			</div>
			<div class="p-searchbar">
				<input type="text" placeholder="검색어를 입력하세요." class="input input-bordered" style="width:85%;"/>
				<i class="fa-solid fa-magnifying-glass" style="font-size:30px;width:15%;display:flex;align-items: center;justify-content: space-around;"></i>
			</div>
			
		</div>
		<div class="p-list">
 			<c:forEach begin="0" end="4" step="1" >
			    <div class="p-list-box">
					<div style="border-bottom:1px solid #797979;">
						<div class="ellipsis p-list-title">
							<span style="color:red;font-size:20px;"><i class="fa-sharp fa-solid fa-flag"></i></span>
							<span >프로젝트제목들어가야함계속길게적는중</span>
						</div>
						<div class="p-list-date">
							<span>2023.05.02 ~ </span>
							<span> 2023.07.02</span>
						</div>
					</div>
					<div class="p-list-box-bottom">
						<span style="font-size:15px;">(주)오싸거</span>
						<span class="p-list-issu">이슈 3</span>
					</div>
				</div>
			</c:forEach>
		
			<div class="p-list-pagination">
			
			</div>
			
		</div>
	
	</div>
	 <div class="p-body">
		<div class="p-body-header">
	 	 	<div class="p-main-title">
		     	<div>
		     		<i class="fa-solid fa-flag ml-6" style="color:red;"></i> 
		      		<span class="p-main-title-sty">정보통신 연구개발사업($프로젝트명)</span>
		     	</div>
	   			<div class="p-main-reg-date">등록일 : 2023.05.09</div>
		 	 </div>
		 	 
	      	<div class="p-body-header-1">
			      <div style="display: flex;">
			         <div class="header-1-menu"><a href="#">프로젝트</a></div> |
			         <div class="header-1-menu"><a href="#">단위업무</a></div> |
			         <div class="header-1-menu"><a href="#">이슈관리</a></div> |
			         <div class="header-1-menu"><a href="#">예산수립</a></div> |
			         <div class="header-1-menu"><a href="#">회의록</a></div> |
			         <div class="header-1-menu"><a href="#">산출물관리 &nbsp;</a></div>
			      </div>
	      	</div>
	   </div> 
	   <!-- project작업공간 -->
		<div class="p-main-body">
   			<!-- 예산수립 타이틀 -->
   			<div class="budget_title">
   			<span>예산수립</span>
   			</div>
   			 
   			 <!-- 신규예산서 등록버튼있는 바?부분 -->
   			<div class="budget_head">
   				<button class="budget_head_b">
   				 <i class="fas fa-regular fa-circle-plus"></i>&nbsp;&nbsp;신규 예산서
   				</button>
   			</div>
   			
   			<!-- 리스트가 들어가는 바디부분 -->
   			<div class="budget_body">
   				<!-- 바디 안 리스트(카드 전체부분) -->
   				<div class="card">
   				<!-- 카드 하늘색부분(헤드) -->
   				<div class="card_head">
   					<!-- 상태 or 팀장/팀원에따라서 상태가 나와야함 그럼 if문을 써야할까?  -->	
   					<!-- 팀장한테 보일 부분 -->
   					<div class="card_head_a" >
	   					<div class="head_status">진행</div><%-- ${상태가 들어가겠쥬 } --%>
	   					<div class="head_status">승인</div>
	   					<div class="head_status">반려</div>
	   					<div class="head_status_a" style="color:#153A66"><i class="fas fa-solid fa-circle-pause"></i>&nbsp;진행중</div>
	   				</div>	
	   				
	   				<!-- 팀원한테 보일 부분 -->
	   				<div class="card_head_aa">
	   					
	   				</div>
   					
   					<div class="card_head_b">
   						<div class="head_title" style="color:#153A66">예산제목이들어가겟쥐</div><%-- ${예산 제목이 들어가겠쥬 } --%>
   					</div>
   					<div class="card_head_c">
	   					<div class="head_reg">2023.05.11&nbsp;12:24&nbsp;등록</div><%-- ${등록시간이 들어가겠쥬 } --%>
	   				</div>
   				</div>
   				
   				<!-- 리스트 하얀부분(바디) -->
   				<div class="card_body">
   					<div class="card_body_a">
						  <table class="table">
						    <tbody class="table_tbody">
						      <!-- row 1 -->
						      <tr style="color:#115db7;">
						        <th>예상 매출액</th>
						        <td>120,000,000 원</td><%-- ${돈이 들어가겟지요 } --%>
						      </tr>
						      <!-- row 2 -->
						      <tr>
						        <th>예상 지출액</th>
						        <td>30,000,000 원 </td>
						      </tr>
						      <!-- row 3 -->
						      <tr>
						        <th>매출이익</th>
						        <td>90,000,000 원</td>
						      </tr>
						      <!-- row 4 -->
						      <tr>
						        <th>이익률</th>
						        <td>75 %</td>
						      </tr>
						    </tbody>
						 </table>				
   					</div>
   				</div>
   			</div>
   		</div>
   			
   			
 	
   		<!-- p-main-body끝나는 태그 -->
		</div>   
	<!-- project/phead.jsp (t-body) 화면 끝나는 태그 -->
	</div>
<!-- project/list.jsp 화면끝나는 태그 -->
</div>


	


<%@ include file="foot.jsp" %>