<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<<<<<<< HEAD
<link rel="stylesheet" href="/resource/css/project/regist_detail.css" />
<link rel="stylesheet" href="/resource/css/project/contacts_modal.css" />

<div class="p-body-header">
	 	 	
=======
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
>>>>>>> 14ee467a43b319ae0c45171d5facfc425f61200c
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
<<<<<<< HEAD
	   						<td><input type="text" name="PJ_NAME" placeholder="프로젝트명을 입력하세요." class="input input-bordered p-reg-input" /></td>
=======
	   						<td><input type="text" placeholder="프로젝트명을 입력하세요." class="input input-bordered p-reg-input" /></td>
>>>>>>> 14ee467a43b319ae0c45171d5facfc425f61200c
	   					</tr>
	   					<tr>
	   						<td>프로젝트 기간</td>
	   						<td style="display:flex;flex-direction:row;width:60%;" >
	   							<div>
<<<<<<< HEAD
	   								<input type="date" name="PJ_STARTDATE"/>
	   							</div>
	   							<span>&nbsp;~&nbsp;</span>
	   							<div>
	   								<input type="date" name="PJ_ENDDATE" />
=======
	   								<input type="date" />
	   							</div>
	   							<span>&nbsp;~&nbsp;</span>
	   							<div>
	   								<input type="date" />
>>>>>>> 14ee467a43b319ae0c45171d5facfc425f61200c
	   							</div>
	   						</td>
	   					</tr>
	   					<tr>
	   						<td>프로젝트 내용</td>
<<<<<<< HEAD
	   						<td><input type="text" name="PJ_CONTENT" placeholder="프로젝트내용을 입력하세요." class="input input-bordered p-reg-input" /></td>
=======
	   						<td><input type="text" placeholder="프로젝트내용을 입력하세요." class="input input-bordered p-reg-input" /></td>
>>>>>>> 14ee467a43b319ae0c45171d5facfc425f61200c
	   					</tr>
	   					<tr>
	   						<td>프로젝트 중요도</td>
	   						<td>
<<<<<<< HEAD
	   							<select id="pj-type-option" class="select select-bordered p-reg-select" name="PJ_IMP">
								  <option disabled selected>선택</option>
								  <option value="3" ${projects.PJ_IMP == '3' ? "selected":""} style="color:red;">&#xf024; 매우 중요</option>
								  <option value="2" ${projects.PJ_IMP == '2' ? "selected":""} style="color:#F59A23;">&#xf024; 중요</option>
								  <option value="1" ${projects.PJ_IMP == '1' ? "selected":""} style="color:#FFFF00;">&#xf024; 보통</option>
=======
	   							<select class="select select-bordered p-reg-select">
								  <option disabled selected>선택</option>
								  <option value="" style="color:red;">&#xf024; 매우 중요</option>
								  <option value="" style="color:#F59A23;">&#xf024; 중요</option>
								  <option value="" style="color:#FFFF00;">&#xf024; 보통</option>
>>>>>>> 14ee467a43b319ae0c45171d5facfc425f61200c
								</select>
	   						</td>
	   					</tr>
	   					<tr>
	   						<td>프로젝트 사업구분</td>
	   						<td>
<<<<<<< HEAD
	   							<select class="select select-bordered p-reg-select" name="PJ_FIELD">
								  <option disabled selected>선택 </option>
								  <option value="교육" ${projects.PJ_FIELD == '교육' ? "selected":""} >교 &nbsp; 육</option>
								  <option value="건설" ${projects.PJ_FIELD == '건설' ? "selected":""}>건 &nbsp; 설</option>
								  <option value="제조" ${projects.PJ_FIELD == '제조' ? "selected":""}>제 &nbsp; 조</option>
								  <option value="물류" ${projects.PJ_FIELD == '물류' ? "selected":""}>물 &nbsp; 류</option>
								  <option value="공공" ${projects.PJ_FIELD == '공공' ? "selected":""}>공 &nbsp; 공</option>
								  <option value="금융" ${projects.PJ_FIELD == '금융' ? "selected":""}>금 &nbsp; 융</option>
								  <option value="기타" ${projects.PJ_FIELD == '기타' ? "selected":""}>기 &nbsp; 타</option>
=======
	   							<select class="select select-bordered p-reg-select">
								  <option disabled selected>선택 </option>
								  <option>교육 </option>
								  <option>건설 </option>
								  <option>제조 </option>
								  <option>물류 </option>
								  <option>공공 </option>
								  <option>금융 </option>
								  <option>기타 </option>
>>>>>>> 14ee467a43b319ae0c45171d5facfc425f61200c
								</select>
	   						</td>
	   					</tr>
	   					<tr>
	   						<td>예상매출액</td>
<<<<<<< HEAD
	   						<td><input type="text" name="PJ_PRICE" placeholder="예상매출액을 입력하세요." class="input input-bordered p-reg-input" /></td>
	   					</tr>
	   					<tr >
	   						<td>업체명</td>
	   						<td><input id="c_names" type="text"  disabled placeholder="업체명을 입력하세요." class="input input-bordered p-reg-input" /></td>
	   						<td><div ><button id="modal_opne_btn1" class="p-type-bt-0" onclick="javascript:searchCONTACTS_NAME();"> 찾기 </button></div> </td>
	   					</tr>
	   					<tr>
	   						<td>프로젝트 매니저</td>
	   						<td><input id="m_names" type="text"  disabled placeholder="프로젝트매니저를 입력하세요." class="input input-bordered p-reg-input" /></td>
	   						<td><div ><button id="modal_opne_btn2" class="p-type-bt-0" onclick="javascript:searchMEMBER_NAME();"> 찾기 </button></div> </td>
=======
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
>>>>>>> 14ee467a43b319ae0c45171d5facfc425f61200c
	   					</tr>
	   					<tr>
	   						<td class="p-git">
	   							<span>깃 주소</span>
	   							<div class="form-control ml-20">
								  <label class="label cursor-pointer">
<<<<<<< HEAD
								    <input type="checkbox" checked="checked" class="checkbox checkbox-primary git_check" onclick="javascript:GIT_CHECK();"/>
=======
								    <input type="checkbox" checked="checked" class="checkbox checkbox-primary" />
>>>>>>> 14ee467a43b319ae0c45171d5facfc425f61200c
								    <span class="label-text ml-2">미 정</span> 
								  </label>
								</div>
	   						</td>
<<<<<<< HEAD
	   						<td><input type="text" name="PJ_GIT"  disabled placeholder="깃주소를 입력하세요." class="input input-bordered p-reg-input git_add" /></td>
	   					</tr>
	   				</table>
	   				<!-- MEMBER_NUM, CONTACTS_NUM  -->
	   				<input id="c_number" type="hidden" name="CT_NUM" value=""/>
	   				<input id="m_number" type="hidden" name="MEMBER_NUM" value=""/>
	   				<input type="hidden" name="PJ_TYPE" value="${PJ_TYPE }"/>
	   				
   				</div>
   				<div class="p-type-bt">
   					<button class="p-type-bt-1">이전</button>
   					<button class="p-type-bt-1" onclick="PJREGIST_go();">등록</button>
   				</div>
=======
	   						<td><input type="text" placeholder="깃주소를 입력하세요." class="input input-bordered p-reg-input" /></td>
	   					</tr>
	   				</table>
   				</div>
   				<div class="p-type-bt">
   					<button class="p-type-bt-1">이전</button>
   					<button class="p-type-bt-1">등록</button>
   				</div>
   				
>>>>>>> 14ee467a43b319ae0c45171d5facfc425f61200c
   			</div>
   
   		<!-- p-main-body끝나는 태그 -->
		</div>   
	<!-- project/phead.jsp (t-body) 화면 끝나는 태그 -->
	</div>
<<<<<<< HEAD
<script>
function GIT_CHECK(){
	var checked = $('.git_check');
	var check_input = $('.git_add');
	if(checked.is(':checked')){
		check_input.prop('disabled', true);
	} else{
		check_input.prop('disabled', false);
	}
}

function PJREGIST_go(){
    var PJ_NAME = $("input[name=PJ_NAME]").val();
    var PJ_STARTDATE = $("input[name=PJ_STARTDATE]").val();
    var PJ_ENDDATE = $("input[name=PJ_ENDDATE]").val();
    var PJ_CONTENT = $("input[name=PJ_CONTENT]").val();
    var PJ_IMP = $("select[name=PJ_IMP]").val();
    var PJ_FIELD = $("select[name=PJ_FIELD]").val();
    var PJ_PRICE = $("input[name=PJ_PRICE]").val();
    var CT_NUM = $("input[name=CT_NUM]").val();
    var MEMBER_NUM = $("input[name=MEMBER_NUM]").val();
    var PJ_GIT = $("input[name=PJ_GIT]").val();
    var PJ_TYPE = $("input[name=PJ_TYPE]").val();
    alert(PJ_TYPE);
    
    var data={
          "pj_NAME":PJ_NAME,
          "string_STARTDATE":PJ_STARTDATE,
          "string_ENDDATE":PJ_ENDDATE,
          "pj_CONTENT":PJ_CONTENT,
          "pj_IMP":parseInt(PJ_IMP),
          "pj_FIELD":PJ_FIELD,
          "pj_PRICE":parseInt(PJ_PRICE),
          "ct_NUM":parseInt(CT_NUM),
          "member_NUM":parseInt(MEMBER_NUM),
          "pj_GIT":PJ_GIT,
          "pj_TYPE":PJ_TYPE
    }
    $.ajax({
    	 url:"<%=request.getContextPath()%>/project/pjRegistdo",
	     type:"post",
	     data:JSON.stringify(data),      
	     contentType:"application/json",
	     success:function(data){
         	alert("등록되었습니다.");
	        location.href="<%=request.getContextPath()%>/project/main";
	        <%-- location.href="<%=request.getContextPath()%>/project/detail?PJ_NUM="+data.pj_NUM; --%>
	     	
	     },
	     error:function(){
		     alert("잘못된 입력입니다. 다시 입력하세요.");
     	}
  });
}
</script>
<!-- 모달창-업체명  -->
<div id="modal_1" class="modal_contacts_name">
=======
<!-- project/list.jsp 화면끝나는 태그 -->
</div>
<!-- 모달창  -->
<div id="modal">
>>>>>>> 14ee467a43b319ae0c45171d5facfc425f61200c

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
<<<<<<< HEAD
				<div class="cts-title-sub">* 등록된 업체를 조회합니다.</div>
				<div class="p-modal-serach select_contacts">
					<select class="select select-bordered p-cts-select " name="searchType" id="searchType">
						  <option disabled selected>선택 </option>
						  <option value="cn" ${searchType=='cn' ? "selected":"" }>업체명</option>
						  <option value="cc" ${searchType=='cc' ? "selected":"" }>대표자명</option>
					</select>
					<div class="p-modal-searchbar contacts-modal-searchbar">
						<input name="keyword" type="text" placeholder="검색어를 입력하세요." class="input input-bordered p-modal-searchbar-input" value="${keyword }"/>
						<i onclick="contacts_list_go();" class="fa-solid fa-magnifying-glass" style="font-size:30px;width:15%;display:flex;align-items: center;justify-content: space-around;"></i>
					</div>
				</div>
				<div class="cts-serch-list">
					<table id="contactsList_view" border="1">
						<!-- contactsList나오는곳 -->
					</table>
				</div>
				<div class="p-regi-modal-bts add_contacts_modal">
	                  <button class="p-regi-modal-bt" onclick="CONTACTS_S_REGI();">등록</button>
	                  <button id="modal_close_btn1" class="p-regi-modal-bt" onclick="CLOSE_MODAL_CT();">취소</button>
	                  <!-- CONTACTS NUM, CEO값 받을 공간 -->
                 	 <div class="add_contacts_id" ></div>
=======
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
>>>>>>> 14ee467a43b319ae0c45171d5facfc425f61200c
	            </div>
			</div>
      </div>

      <div class="modal_layer"></div>
</div>
<<<<<<< HEAD

<script>
function searchCONTACTS_NAME(){
	//alert("contacts");
	$(".modal_contacts_name").css('display',"block");
 	$.ajax({
		url: "Search_Modal",
		type: "get",
		dataType:"json",
		success: function(data){
			var contactsList = data.contactsList;
			var table = $('#contactsList_view');
			table.empty();
			console.log(data);
			for(var i=0 ; i<contactsList.length; i++ ){
				var contacts = contactsList[i];
				var row = '<tr data-contacts-num ="'+ contacts.ct_NUM +'"> <td>' + contacts.ct_NAME + '</td><td>' + contacts.ct_CEO + '</td></tr>';
				table.append(row);
			}
			table.find('tr').click(function(){
				var CT_NUM = $(this).data('contacts-num');
				var CT_NAME = $(this).find('td:first-child').text();
				var CT_CEO = $(this).find('td:last-child').text();
				
				var input_cnum = '<input id="c_num" type="hidden" value="'+CT_NUM +'" />';
				var input_cname = '<input id="c_name" type="hidden" value="'+CT_NAME +'" />';
				var input_cceo = '<input id="c_ceo" type="hidden" value="'+CT_CEO+'" />';

				
		 		var addContactsId = $('.add_contacts_id');

				if (addContactsId.length) {
					addContactsId.empty();
				}
				addContactsId.append(input_cnum);
				addContactsId.append(input_cname);
				addContactsId.append(input_cceo);
				
				table.find('tr>td:last-child').each(function(){
					if($(this).text() == CT_CEO){
						$(this).parent('tr').css('background-color', "#e7e7e7e7");
					}else{
						$(this).parent('tr').css('background-color', "#ffffff");
					}
				});
			});
		}
	});
}

// 업체Contacts조회
function contacts_list_go(){
	
	//alert("리스트 돋보기");
	var searchType = $('.select_contacts>select[name="searchType"]').val();
	var keyword = $('div.contacts-modal-searchbar>input[name="keyword"]').val();
	//console.log(searchType);
	//console.log(keyword);
	$.ajax({
		
		url: "regist_searchCONTACTS",
		type: "get",
		dataType:"json",
		data:{
			"searchType":searchType,
			"keyword": keyword
		},
		success: function(data){
			var contactsList = data.contactsList;
			var table = $('#contactsList_view');
			table.empty();
			
			for(var i=0 ; i<contactsList.length; i++ ){
				var contacts = contactsList[i];
				var row = '<tr data-contacts-num ="'+ contacts.ct_NUM +'"> <td>' + contacts.ct_NAME + '</td><td>' + contacts.ct_CEO + '</td></tr>';
				table.append(row);
			}
			table.find('tr').click(function(){
				var CT_NUM = $(this).data('contacts-num');
				var CT_NAME = $(this).find('td:first-child').text();
				var CT_CEO = $(this).find('td:last-child').text();
				
				var input_cnum = '<input id="c_num" type="hidden" value="'+CT_NUM +'" />';
				var input_cname = '<input id="c_name" type="hidden" value="'+CT_NAME +'" />';
				var input_cceo = '<input id="c_ceo" type="hidden" value="'+CT_CEO+'" />';

		 		var addContactsId = $('.add_contacts_id');

				if (addContactsId.length) {
					addContactsId.empty();
				}
				addContactsId.append(input_cnum);
				addContactsId.append(input_cname);
				addContactsId.append(input_cceo);
				
				table.find('tr>td:last-child').each(function(){
					if($(this).text() == CT_CEO){
						$(this).parent('tr').css('background-color', "#e7e7e7e7");
					}else{
						$(this).parent('tr').css('background-color', "#ffffff");
					}
				});
			});
		}
	});
	
}

function CONTACTS_S_REGI(){	
	var CT_NUM = $('#c_num').val();
	$('#c_number').val(CT_NUM);
	var CT_NAME = $('#c_name').val();
	$('#c_names').val(CT_NAME);
	var CT_CEO = $('#c_ceo').val();
	$('#c_ceos').val(CT_CEO);
	
	$(".modal_contacts_name").css('display', "none");
}

function CLOSE_MODAL_CT(){
	$(".modal_contacts_name").css('display', "none");
}

</script>

 <!-- 모달창-프로젝트메니저  -->
  <div id="modal_2" class="modal_member_name">

    <div class="modal_content">
          <div class="flex" style="background-color: #153A66;">
                <div class="navbar text-neutral-content modal-head">
                      <div class="text-white modal-head-0">&nbsp;&nbsp;&nbsp;&nbsp;DEMYS PMS</div>
                </div>
          </div>

		<div class="cts-view">
			<div class="cts-title">
				<span>프로젝트 매니저</span>
			</div>
			<div class="cts-title-sub">* 담당매니저를 선택하세요.</div>
			<div class="p-modal-serach select_member">
				<select class="select select-bordered p-cts-select select_member" name="searchType" id="searchType">
					  <option disabled selected>선택 </option>
					  <option value="mn" ${searchType=='mn' ? "selected":"" }>매니저명</option>
					  <option value="md" ${searchType=='md' ? "selected":"" }>담당부서</option>
				</select>
				<div class="p-modal-searchbar key_member">
					<input name="keyword" type="text" placeholder="검색어를 입력하세요." class="input input-bordered p-modal-searchbar-input" value="${keyword }"/>
					<i onclick="member_list_go();" class="fa-solid fa-magnifying-glass" style="font-size:30px;width:15%;display:flex;align-items: center;justify-content: space-around;"></i>
				</div>
			</div>
			<div class="cts-serch-list">
				<table id="memberList_view" border="1">
					<!-- memberList나오는 위치 -->
				</table>
			</div>
			<div class="p-regi-modal-bts">
                  <button class="p-regi-modal-bt" onclick="javascript:MEMBER_S_REGI();">등록</button>
                  <button id="modal_close_btn2" class="p-regi-modal-bt" onclick="CLOSE_MODAL();">취소</button>
                  <!-- MEMBER NUM, NAME값 받을 공간 -->
                  <div class="add_member_id" ></div>
            </div>
		</div>
    </div>

    <div class="modal_layer"></div>
</div>

<script src="/resource/js/common.js" defer="defer"></script> 
 <!-- 모달창  -->
<!-- <script src="/resource/js/modal.js" defer="defer"></script> -->
=======
 <!-- 모달창  -->
<script src="/resource/js/modal.js" defer="defer"></script>
<%@ include file="../common/foot.jsp" %>

>>>>>>> 14ee467a43b319ae0c45171d5facfc425f61200c
