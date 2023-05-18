<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="../common/head.jsp" %>

<style>
/* p-main-body 고정 수정X, border만 씌워서 작업!! */
.p-main-body{
	margin-top:5px;
	width:100%;
	height: calc(930px - 65px - 63px); 
	padding:5px;
	border:2px solid #797979;
	/* background-color:#F2F2F2; */
}
</style>
 
<link rel="stylesheet" href="/resource/css/project/list.css" />
<link rel="stylesheet" href="/resource/css/project/phead.css" />
<link rel="stylesheet" href="/resource/css/project/regist_detail.css" />
<link rel="stylesheet" href="/resource/css/project/contacts_modal.css" />

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
   			
   			<div class="p-regist-view">
   				<div class="p-regi">
   					<span class="p-regi_1">프로젝트 등록</span>
   					<span class="p-regi_2">신규 프로젝트를 등록하세요.</span>
   				</div>
   				<div class="p-regi-2">
   					<div class="p-regi-made">
   						Step1. 프로젝트 만들기
   						<i class="fa-regular fa-circle-right"></i>
   					</div>
   					<div class="p-regi-detail">
   						Step2. 상세정보 등록
   						<i class="fa-regular fa-circle-right"></i>
   					</div>
   				</div>
   				<span style="font-weight:bold;">* 프로젝트 정보를 입력하세요.</span>
   				<div class="p-detail-select">
   					<table style="width:100%;">
	   					<tr>
	   						<td>프로젝트명</td>
	   						<td><input type="text" placeholder="프로젝트명을 입력하세요." class="input input-bordered p-reg-input" /></td>
	   					</tr>
	   					<tr>
	   						<td>프로젝트 기간</td>
	   						<td style="display:flex;flex-direction:row;width:60%;" >
	   							<div>
	   								<input type="date" />
	   							</div>
	   							<span>&nbsp;~&nbsp;</span>
	   							<div>
	   								<input type="date" />
	   							</div>
	   						</td>
	   					</tr>
	   					<tr>
	   						<td>프로젝트 내용</td>
	   						<td><input type="text" placeholder="프로젝트내용을 입력하세요." class="input input-bordered p-reg-input" /></td>
	   					</tr>
	   					<tr>
	   						<td>프로젝트 중요도</td>
	   						<td>
	   							<select class="select select-bordered p-reg-select">
								  <option disabled selected>선택</option>
								  <option value="" style="color:red;">&#xf024; 매우 중요</option>
								  <option value="" style="color:#F59A23;">&#xf024; 중요</option>
								  <option value="" style="color:#FFFF00;">&#xf024; 보통</option>
								</select>
	   						</td>
	   					</tr>
	   					<tr>
	   						<td>프로젝트 사업구분</td>
	   						<td>
	   							<select class="select select-bordered p-reg-select">
								  <option disabled selected>선택 </option>
								  <option>교육 </option>
								  <option>건설 </option>
								  <option>제조 </option>
								  <option>물류 </option>
								  <option>공공 </option>
								  <option>금융 </option>
								  <option>기타 </option>
								</select>
	   						</td>
	   					</tr>
	   					<tr>
	   						<td>예상매출액</td>
	   						<td><input type="text" placeholder="예상매출액을 입력하세요." class="input input-bordered p-reg-input" /></td>
	   					</tr>
	   					<tr >
	   						<td>업체명</td>
	   						<td><input type="text" placeholder="업체명을 입력하세요." class="input input-bordered p-reg-input" /></td>
	   						<td><div id="root"><button id="modal_opne_btn" class="p-type-bt-0"> 찾기 </button></div> </td>
	   					</tr>
	   					<tr>
	   						<td>프로제트 매니저</td>
	   						<td><input type="text" placeholder="담당매니저를 입력하세요." class="input input-bordered p-reg-input" /></td>
	   						<td id="root" > <button id="modal_opne_btn" class="p-type-bt-0"> 찾기 </button> </td>
	   					</tr>
	   					<tr>
	   						<td class="p-git">
	   							<span>깃 주소</span>
	   							<div class="form-control ml-20">
								  <label class="label cursor-pointer">
								    <input type="checkbox" checked="checked" class="checkbox checkbox-primary" />
								    <span class="label-text ml-2">미 정</span> 
								  </label>
								</div>
	   						</td>
	   						<td><input type="text" placeholder="깃주소를 입력하세요." class="input input-bordered p-reg-input" /></td>
	   					</tr>
	   				</table>
   				</div>
   				<div class="p-type-bt">
   					<button class="p-type-bt-1">이전</button>
   					<button class="p-type-bt-1">등록</button>
   				</div>
   				
   			</div>
   
   		<!-- p-main-body끝나는 태그 -->
		</div>   
	<!-- project/phead.jsp (t-body) 화면 끝나는 태그 -->
	</div>
<!-- project/list.jsp 화면끝나는 태그 -->
</div>
<!-- 모달창  -->
<div id="modal">

      <div class="modal_content">
            <div class="flex" style="background-color: #153A66;">
                  <div class="navbar text-neutral-content modal-head">
                        <div class="text-white modal-head-0">&nbsp;&nbsp;&nbsp;&nbsp;DEMYS PMS</div>
                  </div>
            </div>

			<div class="cts-view">
				<div class="cts-title">
					<span>업체명</span>
				</div>
				<div style="margin:5px 0;color:#797979;">* 등록된 업체를 조회합니다.</div>
				<div class="p-modal-serach">
					<select class="select select-bordered p-cts-select">
						  <option disabled selected>선택 </option>
						  <option>업체명</option>
						  <option>대표자명</option>
					</select>
					<div class="p-modal-searchbar">
						<input type="text" placeholder="검색어를 입력하세요." class="input input-bordered p-modal-searchbar-input"/>
						<i class="fa-solid fa-magnifying-glass" style="font-size:30px;width:15%;display:flex;align-items: center;justify-content: space-around;"></i>
					</div>
				</div>
				<div class="cts-serch-list">
					<table border="1">
						<c:forEach begin="0" end="6" step="1" >
							<tr>
								<td>(주) 업체명써</td>
								<td>대표자명</td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<div class="p-regi-modal-bts">
	                  <button id="modal_close_btn" class="p-regi-modal-bt">취소</button>
	                  <button class="p-regi-modal-bt">등록</button>
	            </div>
			</div>
      </div>

      <div class="modal_layer"></div>
</div>
 <!-- 모달창  -->
<script src="/resource/js/modal.js" defer="defer"></script>
<%@ include file="../common/foot.jsp" %>

