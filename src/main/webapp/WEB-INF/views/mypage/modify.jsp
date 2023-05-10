<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>





<%@ include file="../common/Mainhead.jsp"%>



<div style="margin:0 auto; height: 955px; width:75%;">
	
	<div style="display:flex; border-bottom:2px solid black;margin-top:20px;">
		<div style="font-size: 2rem; font-weight: bold;width:200px;height:70px;line-height: 70px;"> 마이페이지</div>
		<div style="color:#ccc;font-size:2.5rem">&nbsp;|&nbsp;</div>
		<div style="font-size:20px; font-weight: bold; width:200px;margin-top:25px; ">계정수정</div>
		
		<div style="display:flex;justify-content:flex-end;margin-top:25px;margin-left:20px;margin-bottom:5px;width:87%;">	
				<button onclick="OpenWindow('../alert.jsp','확인',600,400)"  style="font-size: 15px; width: 110px; height: 40px; background-color: #153A66; color: white; border-radius: 8px;margin-right:10px;">수정</button>
				<button style="font-size: 15px; width: 110px; height: 40px; background-color: #153A66; color: white; border-radius: 8px;">취소</button>
		</div>
	</div>


<div class="container" style="margin:0 auto; margin-top:10px;">
	<form action="" method="post">
				<!-- 프로필 -->
				<div style="border:2px solid #ccc;height:50px;line-height:50px;font-size:20px;font-weight:bold;border-radius:15px 15px 2px 2px;">&nbsp;&nbsp;&nbsp;&nbsp;프로필</div>
				
				<div style="margin-top:2px; border-radius:0 0 15px 15px;height:130px;border: 2px solid #ccc; background-color:#ccc;" >
					
					<div class="row" style="display:flex;">
					
						<!-- 프로필 사진 -->
						<div class="col-sm-6 grid-rows-1">
							<img src="/resource/img/a.jpg" style="border:5px solid #153A66; width:110px; height:100px; border-radius:50%;margin:10px;margin-left:100px;"/>
						</div>
						<div style="position:relative; top:85px; right:50px;">
							<i class="fa-solid fa-pencil" style="text-align:center;font-size:15px; border:5px solid #153A66; width:35px; height:35px; line-height:30px; border-radius:50%;background-color:white; "></i>
						</div>
							<div style="margin:10px;">
							
								<!-- 이메일 -->
								<div class="col-sm-6 grid-rows-2"  style="font-size:20px; text-align:center; line-height:50px;  height:50px; width:520px;">
									<%-- ${member.member_email } --%>
									dhtkd4900@naver.com
								</div>
									<div class="flex">
										<!-- 이름 -->
										<div class="col-sm-6 grid-rows-5"  style="font-size:2rem; text-align:right; line-height:50px; font-weight:bold; height:50px;width:250px;">
											<%-- ${member.member_name } --%>
											김미영
										</div>
										&nbsp;&nbsp;&nbsp;
										<!-- 직급 -->
										<div class="col-sm-6 grid-rows-6"  style="font-size:2rem; line-height:50px; font-weight:bold; height:50px;width:500px;">
											<%-- ( ${member.member_position } ) --%>
											( 팀장 )
										</div>
									</div>	
							</div>
					</div>
				</div>
				
				<!-- 계정정보 -->
				<div style="margin-top:10px;">
					<div style="border:2px solid #ccc;height:50px;line-height:50px;font-size:20px;font-weight:bold;border-radius:15px 15px 2px 2px;">&nbsp;&nbsp;&nbsp;&nbsp;계정정보</div>
				<div class="" style="margin-top:2px; border-radius:0 0 15px 15px;border: 2px solid #ccc;" >
					
					<div class="row" style="display:flex;">
					
							<div style="margin-left:10px;">
							
								
									<div class="flex" style="margin-left:20px;">
										<!-- 아이디 -->
										<div class="col-sm-6 grid-rows-5"  style="font-size:20px; text-align:left; line-height:50px; font-weight:bold;height:40px;width:400px;margin-top:10px;">
											아이디
										</div>
										&nbsp;&nbsp;&nbsp;
										<!-- 아이디 정보칸 -->
										<input type="text" class=" input input-bordered w-full max-w-xs" style="pointer-events:none;width:100%; background-color: #ccc; margin-top:10px;" />
										
									</div>	
									
									<div class="flex" style="margin-left:20px;">
										<!-- 비밀번호 -->
										<div class="col-sm-6 grid-rows-5"  style="font-size:20px; text-align:left; line-height:50px; font-weight:bold;height:40px;width:400px;">
											비밀번호
										</div>
										&nbsp;&nbsp;&nbsp;
										<!-- 비밀번호 정보칸 -->
										<input type="text" class=" input input-bordered w-full max-w-xs" style="pointer-events:none;width:100%; background-color: #ccc; margin-top:5px;" />
										
									</div>	
									
									<div class="flex" style="margin-left:20px;">
										<!-- 비밀번호 확인 -->
										<div class="col-sm-6 grid-rows-5"  style="font-size:20px; text-align:left; line-height:50px; font-weight:bold;height:40px;width:400px;">
											비밀번호 확인
										</div>
										&nbsp;&nbsp;&nbsp;
										<!-- 비밀번호확인 정보칸 -->
										<input type="text" class=" input input-bordered w-full max-w-xs" style="pointer-events:none;width:100%; background-color: #ccc; margin-top:5px; margin-bottom:10px;" />
										
									</div>	
								</div>
							</div>
						</div>
					</div>
				
				<!-- 개인정보  -->
				<div style="margin-top:10px;">
					<div style="border:2px solid #ccc;height:50px;line-height:50px;font-size:20px;font-weight:bold;border-radius:15px 15px 2px 2px;">&nbsp;&nbsp;&nbsp;&nbsp;개인정보</div>
				<div class="" style="margin-top:2px; border-radius:0 0 15px 15px;border: 2px solid #ccc;" >
					
					<div class="row" style="display:flex;">
					
							<div style="margin:10px;">
							
								
									<div class="flex" style="margin-left:20px;margin-top:15px;margin-bottom:5px;">
										<!-- 이름 -->
										<div class="col-sm-6 grid-rows-5"  style="font-size:20px; text-align:left; line-height:50px; font-weight:bold;height:50px;width:400px;">
											이름
										</div>
										&nbsp;&nbsp;&nbsp;
										<!-- 아이디 정보칸 -->
										<input type="text" class=" input input-bordered w-full max-w-xs" style="pointer-events:none;width:100%; background-color: #ccc;" />
										
									</div>	
									
									
										<div class="flex" style="margin-top:5px;margin-left:20px;">
										<!-- 휴대폰번호 -->
										<div class="col-sm-6 grid-rows-5"  style="font-size:20px; text-align:left; line-height:50px; font-weight:bold; height:50px;width:400px;">
											휴대폰 번호
										</div>
										&nbsp;&nbsp;&nbsp;
										<!-- 휴대폰번호 정보칸 -->
										<input type="text" class=" input input-bordered w-full max-w-xs" style="pointer-events:none;width:100%; background-color: #ccc;" />
										
									</div>	
									
										<div class="flex" style="margin-top:5px;margin-left:20px;">
										<!-- 이메일 -->
										<div class="col-sm-6 grid-rows-5"  style="font-size:20px; text-align:left; line-height:50px; font-weight:bold;height:50px;width:400px;">
											이메일
										</div>
										&nbsp;&nbsp;&nbsp;
										<!-- 이메일 정보칸 -->
										<input type="text" class=" input input-bordered w-full max-w-xs" style="pointer-events:none;width:100%; background-color: #ccc;" />
										
									</div>	
									
										<div class="flex" style="margin-top:5px;margin-left:20px;">
										<!-- 담당부서 -->
										<div class="col-sm-6 grid-rows-5"  style="font-size:20px; text-align:left; line-height:50px; font-weight:bold;height:50px;width:400px;">
											담당부서
										</div>
										&nbsp;&nbsp;&nbsp;
										<!-- 담당부서 정보칸 -->
										<input type="text" class=" input input-bordered w-full max-w-xs" style="pointer-events:none;width:100%; background-color: #ccc;" />
										
									</div>	
									
									
										<div class="flex" style="margin-top:5px;margin-left:20px;">
										<!-- 직책 -->
										<div class="col-sm-6 grid-rows-5"  style="font-size:20px; text-align:left; line-height:50px; font-weight:bold; height:50px;width:400px;">
											직책
										</div>
										&nbsp;&nbsp;&nbsp;
										<!-- 직책 정보칸 -->
										<input type="text" class=" input input-bordered w-full max-w-xs" style="pointer-events:none;width:100%; background-color: #ccc;" />
										
									</div>	
									
										<div class="flex" style="margin-top:5px;margin-left:20px;">
										<!-- 직급 -->
										<div class="col-sm-6 grid-rows-5"  style="font-size:20px; text-align:left; line-height:50px; font-weight:bold; height:50px;width:400px;">
											직급
										</div>
										&nbsp;&nbsp;&nbsp;
										<!-- 직급 정보칸 -->
										<input type="text" class=" input input-bordered w-full max-w-xs" style="pointer-events:none;width:100%; background-color: #ccc;" />
										

							</div>
					</div>
				</div>
			</div>
		</div>
	</form>	
				
				
				
</div>

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












</body>
</html>