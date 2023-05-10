<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko" class="light" data-theme="light">
<head>
<meta charset="UTF-8">
<title>DashBoard</title>
<!-- 제이쿼리 불러오기 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<!-- 테일윈드 불러오기 -->
<!-- 노말라이즈, 라이브러리까지 한번에 해결 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.7/tailwind.min.css" />

<!-- 데이지 UI -->
<link href="https://cdn.jsdelivr.net/npm/daisyui@2.51.5/dist/full.css" rel="stylesheet" type="text/css" />

<!-- 폰트어썸 불러오기 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />

<!-- 사이트 공통 CSS -->
<link rel="stylesheet" href="/resource/common.css" />
<!-- 사이트 공통 JS -->
<script src="/resource/common.js" defer="defer"></script>

</head>
<style>


.navbar {
	padding: 0px;
	min-height: 1rem;
	height: 50px;
}
</style>
<body>

		<div class="flex" style="background-color: #153A66;">
				<div class="navbar text-neutral-content" style="width: 100%;">
						<div class="text-white" style="font-weight: bold; font-size: 1rem; margin-right: auto;">
								&nbsp;&nbsp;&nbsp;&nbsp;DEMYS PMS</div>
				</div>
		</div>


		<div style="position: absolute; top: 35%; left: 50%; transform: translate(-50%, -50%);">
				<i class="fa-solid fa-circle-check" style="font-size: 5.5rem;"></i>
		</div>
		
		<div style="line-height:60px;text-align:center;font-size:30px;font-weight:bold;color:#153A66; width:400px;height:50px;position: absolute; top: 58%; left: 50%; transform: translate(-50%, -50%);">		
			수정이 완료되었습니다.
		</div>

		
		<div style="display:flex;position: absolute; top: 80%; left: 55%; transform: translate(-50%, -50%);">	
				<button onclick="CloseWindow()"  style="font-size: 20px; width: 110px; height: 40px; background-color: #153A66; color: white; border-radius: 8px;margin-right:50px;">확인</button>
		</div>
		
			
			
			

<script>
function OpenWindow(UrlStr, WinTitle, WinWidth, WinHeight) {
	winleft = (screen.width - WinWidth) / 2;
	wintop = (screen.height - WinHeight) / 2;
	var win = window.open(UrlStr , WinTitle , "scrollbars=yes,width="+ WinWidth  
							+",height="+ WinHeight +",top="+ wintop +",left=" 
							+ winleft +",resizable=yes"  );
	win.focus() ; 
}

//팝업창 닫기
function CloseWindow(parentURL){
	
	window.opener.location.reload(true);		
	window.close();
}

</script>		
		
		
		
		
		
		
		
		