<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE htm>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="${path}/resources/css/style.css" />
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>


<style>
	header.enroll_header{
		background-color: #171792;
	}
	header.enroll_header div.enroll_head{
		height: 90px;
		width: 890px;
		position:relative;
		margin: 0 auto;
		
	}
	h1.enroll_logo a{
		float:left;
		display: block;
	}
	h1.enroll_logo{
		position:absolute;
		overflow: hidden;
		left: 0;
	}
	h1.enroll_logo a.hogallImg img{
		width: 200px;
	}
	h1.enroll_logo a.enrollImg img{
		width: 100px;
	}
	h1.enroll_logo a.enrollImg{
		padding: 12px;
		
	}
	h1.enroll_logo{
		margin:0;
		top:30px;
	}
	nav.main_lnb{
		position:absolute;
		right: 0;
		bottom: 0;
		
	}
	nav.main_lnb > ul {
		overflow: hidden;
	}
	nav.main_lnb > ul > li{
		float:left;
	}
	li {
		list-style: none;
	}
	a {
		text-decoration: none;
		color: #ffffff;
	}
	
	nav.main_lnb ul li:nth-child(n+2) a::before {
	content: "|";
	}
	
	div#main{
		width: 880px;
		margin : 0 auto;
	}
	
	div#main div#enroll_content div.content_head h3{
		color : #3a3d42;
	}
	div#main div#enroll_content div.content_head{
		height: 31px;
		border-bottom: 2px solid #3a3d42;
	}
	div#main div#enroll_content div.content_box{
		min-height: 400px;
		border: 1px #cecdce solid;
		border-radius: 5px;
		margin-top: 20px;
		padding: 20px;
	}
	div#enroll_content div.conForm_box{
		margin: 0 auto;
	}
	div#enroll_content div.conForm_box{
		width: 700px;
		padding-top: 50px;
		margin: 0 auto;
	}
	div#enroll_content .form_text,.form_content{
		float:left;
	}
	div#enroll_content .form_text{
		width: 180px;
		height: 40px;
		line-height: 40px;
	}
	div#enroll_content .form_content{
		width: 500px;
	}
	div#enroll_content .fg{
		margin-top: 15px;
	}
	div#enroll_content .fg:first-child{
		margin-top: 0px;
	}
	
	div#enroll_content .fg::after {
		clear: both;
		display: block;
		visibility: hidden;
		content: "";
	}
	div#enroll_content .form_content input[type=text],div#enroll_content .form_content input[type=password],div#enroll_content .form_content input[type=email]{
		width: 100%;
		
	}
	
	div#enroll_content .int{
		float : left;
	}
	
	
	div#enroll_content .emailGo_box{
		float: left;
		margin-left : 10px;
	}
	div#enroll_content .next_box{
		margin-top:20px;
		text-align: right;
	}
	.hidden{
		display: none;
		
	}
	.addSearch_box{
		float: left;
		margin-left: 10px;
	}
	.must{
		color: #F2CB61;
	}
	.visi{
		visibility: hidden;
	}
	#betweenEnroll{
		margin-bottom: 80px;
	}
	
</style>
</head>
<body>
	<div>
		<%-- <header class="enroll_header">
			<div class="enroll_head">
				<h1 class="enroll_logo">
					<a class="hogallImg" href="${pageContext.request.contextPath }">
						<img src="${pageContext.request.contextPath }/resources/images/hogall_blueB_whiteC.PNG"/>
					</a>
					<a class="enrollImg" href="javascript:location.reload();">
						<img src="${pageContext.request.contextPath }/resources/images/enroll_blueB_whiteC.PNG"/>
					</a>
				</h1>
				
				<nav class="main_lnb">
					<ul>
						<li><a href="#">갤러리</a></li>
						<li><a href="#">마이페이지</a></li>
						<li><a href="#">상점</a></li>
						<li><a href="#">로그인</a></li>
						<li><a href="#">공지사항</a></li>
						<li><a href="#">이벤트</a></li>
					</ul>
				</nav>
			</div>
		</header> --%>
	<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="Hello Spring" name="title" />
	</jsp:include>
		<div id="betweenEnroll">
		
		</div>
		<div id="main">
			<form id="enrollForm" onsubmit="return frnSubmit();" action="${pageContext.request.contextPath }/member/signUp.do" name="enrollForm" method="post">
				<div id="enroll_content">
					<article>
						<section>
							<div class="content_head">
								<h3>회원 정보 입력</h3>
							</div>
							
							<div class="content_box">
								<span class="must" style="float: right;">*표시는 반든시 입력해야 하는 항목 입니다.</span>
								<div class="conForm_box">
									<div class="id_group fg"><span class="must" style="float: left;">*</span>
										<div class="form_text">아이디</div>
										<div class="form_content">
											<input min="5" maxlength="20" type="text" name="id" class="int" id="id_form"/>
											<div class="tip_msgbox">
												<p class="tip_msg id_msg">5~20자 영문,숫자만 입력해주세요</p>
												<p class="id_ok"></p>
											</div>
										</div>
									</div>
									<div class="pw_group fg"><span class="must" style="float: left;">*</span>
										<div class="form_text">비밀번호</div>
										<div class="form_content">
											<input type="password" name="password" class="int" id="pw_form"/>
											<div class="tip_msgbox">
												<p class="tip_msg pw_msg">영문,숫자조합 8~20자 입력해주세요 (특수문자 사용가능)</p>
											</div>
										</div>
									</div>
									<div class="pwCheck_group fg"><span class="must" style="float: left;">*</span>
										<div class="form_text">비밀번호 확인</div>
										<div class="form_content">
											<input type="password" id="pwCheck" class="int pwCheck"/>
											<div class="tip_msgbox">
												<p class="tip_msg pwCk_msg"></p>
											</div>
										</div>
									</div>
									<div class="name_group fg"><span class="must" style="float: left;">*</span>
										<div class="form_text">이름</div>
										<div class="form_content">
											<input type="text" class="int" name="name" id="name"/>
										</div>
									</div>
									<div class="nickName_group fg"><span class="must" style="float: left;">*</span>
										<div class="form_text">닉네임</div>
										<div class="form_content">
											<input type="text" class="int" name="nickName" id="nickName"/>
											
											<div class="tip_msgbox">
													<p class="tip_msg nick_msg">2~10자 닉네임 입력해주세요</p>
													<p class="nick_ok"></p>
											</div>
										</div>
										
									</div>
									<div class="email_group fg"><span class="must" style="float: left;">*</span>
										<div class="form_text">이메일</div>
										<div class="form_content">
											<input style="width: 350px;" name="email" type="text" class="int" id="email"/>
											<div class="emailGo_box">
												<button class="emailGo_Btn" onclick="emailGo()" type="button">인증번호 전송</button>
											</div>
										</div>
										<div class="tip_msgbox">
										</div>
									</div>
									
									<div class="cerNum_group fg hidden"><span class="must" style="float: left;">*</span>
										<div class="form_text">인증번호</div>
										<div class="form_content">
											<input style="width: 350px;" type="text" class="int" id="cerNum"/>
											<input type="hidden" value="${number }" id="ckNumber"/>
											<div class="emailGo_box">
												<button class="emailGo_Btn" onclick="numSame()" type="button">인증번호 확인</button>
											</div>
										</div>
									</div>
									
									<div class="zipCode_group fg"><span class="must visi" style="float: left;">*</span>
										<div class="form_text">우편번호</div>
										<div class="form_content">
											<input type="text" style="background-color: #CFCFCF;" class="int" name="zipCode" id="sample4_postcode" readonly="readonly"/>
										</div>
									</div>
									
									<div class="address_group fg"><span class="must visi" style="float: left;">*</span>
										<div class="form_text">주소</div>
										<div class="form_content">
											<input type="text" style="background-color: #CFCFCF;" class="int" name="address" id="sample4_roadAddress" readonly="readonly"/>
										</div>
									</div>
									
									<div class="detailAddress_group fg"><span class="must visi" style="float: left;">*</span>
										<div class="form_text">상세주소</div>
										<div class="form_content">
											<input style="width: 350px;" type="text" class="int" name="detailAddress" id="sample4_detailAddress"/>
											<div class="addSearch_box">
												<button class="addSearch_Btn" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" type="button">우편번호 찾기</button>
											</div>
										
										</div>
									</div>
									
									
								</div>
								<div class="next_box">
										<div class="next_content">
											<button type="submit">다음</button>
										</div>
									</div>
							</div>
						</section>
					</article>
				</div>
			</form>
		</div>
		
	</div>	
	<script>
	var confirm_id = 1;
	var confirm_pw = 1;
	var confirm_pwCk = 1;
	var confirm_nickName = 1;
	var confirm_mail = 1;
	
	var regId = /^[A-Za-z0-9+]{5,20}$/;  /* 아이디 정규식 영어 대문자,소문자,숫자만 사용가능 5~20글자 */
	$(function(){
		
		$("#id_form").keyup(function(){
			var id=$("#id_form").val();
			var userId = document.getElementById("id_form").value;
			
			userIdReg = regId.test(userId);
			 $.ajax({
				url : '${pageContext.request.contextPath}/member/idOverlap',
				data : {"id":id},
				dataType : 'html',
				type : 'POST',
				success : function(data){
					/* $(".id_ok").html(data); */
					if(data=='true' && userIdReg){
						$(".id_ok").html("사용할 수 있는 아이디 입니다.");
						$(".id_ok").css('color','green');
						confirm_id = 0;
					}else if(data=='false' || !userIdReg){
						$(".id_ok").html("사용할 수 없는 아이디 입니다.");
						$(".id_ok").css('color','red');
						confirm_id = 1;
					}
					
					if(id.length>0){//아이디가 입력됏다면
						$(".id_msg").hide();
						$(".id_ok").show();
					}else if(id.length==0){ //아이디가 입력되지 않앗다면
						$(".id_msg").show();
						$(".id_ok").hide();
					}
				}
				
			}) 
		})
		
		$("#nickName").keyup(function(){
			var nickName=$("#nickName").val();
			var userNick = document.getElementById("nickName").value;
			
			var regNick = /^[A-Za-z0-9가-힣+]{2,10}$/;
			
			userNickReg = regNick.test(userNick);
			$.ajax({
				url : "${pageContext.request.contextPath}/member/nickNameoverlap",
				data : {"nickName":nickName},
				dataType : 'html',
				type : 'POST',
				success : function(data){
					console.log(data);
					if(data=='true' && userNickReg){
						$(".nick_ok").html("사용할 수 있는 닉네임 입니다.");
						$(".nick_ok").css("color","green");
						confirm_nickName = 0;
					}else if(data='false' || userNickReg){
						$(".nick_ok").html("사용할 수 없는 닉네임 입니다.");
						$(".nick_ok").css("color","red");
						confirm_nickName = 1;
					}
					
					if(nickName.length>0){ //닉네임이 입력됏다면
						$(".nick_msg").hide();
						$(".nick_ok").show();
					}else if(nickName.length==0){ //닉네임이 입력되지 않앗다면
						$(".nick_msg").show();
						$(".nick_ok").hide();
					}
					
					console.log(confirm_nickName);
				}
				
			})
		
		})
		
		
		
	})	
	
		
		function emailGo(){
				var tomail=$("#email").val();
				 $('.hidden').show(); 

				/* location.href="${pageContext.request.contextPath}/mail/mailSending?tomail="+tomail; */
				$.ajax({
					url : '${pageContext.request.contextPath}/mail/mailSending',
					data : {"tomail":tomail},
					dataType : 'html',
					type : 'POST',
					success: function(data){
						 $("#ckNumber").attr("value",data); 
						console.log($("#ckNumber").val());
					}
				});	
			}
	
		$("#pwCheck").keyup(function(){
			var pw=$("#pw_form").val().trim();
			var pwCk=$("#pwCheck").val().trim();
		
			
			if(pw==pwCk){
				$(".pwCk_msg").html("비밀번호가 일치합니다.");
				$(".pwCk_msg").css('color','green');
				confirm_pwCk = 0;
				confirm_pw = 0;
			}else if(pw!=pwCk){
				$(".pwCk_msg").html("비밀번호가 일치하지 않습니다.");
				$(".pwCk_msg").css('color','red');
				confirm_pwCk = 1;
				confirm_pw = 1;
				
			}
			
			if(pwCk.length>0){//비밀번호확인이 입력됏다면
				$(".pwCk_msg").show();
			}else if(pwCk.length==0){ //비밀번호 확인이 입력되지 않앗다면
				$(".pwCk_msg").hide();
			}
			
		});
		
		$("#pw_form").keyup(function(){
			var pw=$("#pw_form").val().trim();
			var pwCk=$("#pwCheck").val().trim();
			
			var userPw = /^[a-zA-Z0-9!@#$%^&*]{8,20}$/; 
			/* var userPw = /^(?=.*\d)(?=.*[a-zA-Z])[a-ZA-Z\d!@#$%^&*]{8,20}$/ */
			
			
			var userPwReg = userPw.test(pw);
			
			
			if(userPwReg){
				$(".pw_msg").html("사용 가능한 비밀번호 입니다.");
				$(".pw_msg").css("color","green");
				
			}else if(!userPwReg){
				$(".pw_msg").html("사용 불가능한 비밀번호 입니다.");
				$(".pw_msg").css("color","red");
				
			}
			
			
			if(pwCk.length>0){
				if(pw==pwCk){
					$(".pwCk_msg").html("비밀번호가 일치합니다.");
					$(".pwCk_msg").css('color','green');
					confirm_pw = 0;
					confirm_pwCk = 0;
				}else if(pw!=pwCk){
					$(".pwCk_msg").html("비밀번호가 일치하지 않습니다.");
					$(".pwCk_msg").css('color','red');
					confirm_pw = 1;
					confirm_pwCk = 1;
				}
				
				if(pw.length>0){//비밀번호가 입력됏다면
					$(".pwCk_msg").show();
				}else if(pw.length==0){ //비밀번호가 입력되지 않앗다면
					$(".pwCk_msg").hide();
				}
			}	
			console.log(confirm_pw);		
		})
		
		
		
		function numSame(){
			var num= $("#ckNumber").val();
			var inputNum = $("#cerNum").val();
			
			if(num==inputNum){
				alert("인증번호가 일치합니다.");
				confirm_mail = 0;
			}else if(num!=inputNum){
				alert("인증번호가 일치하지 않습니다.");
				confirm_mail = 1;
			
			}
			
			console.log(confirm_mail);
		}
		
	function frnSubmit(){
		
			
			var id=$("#id_form").val().trim();
			var pw=$("#pw_form").val().trim();
			var pwCk=$("#pwCheck").val().trim();
			var name=$("#name").val().trim();
			var nickName=$("#nickName").val().trim();
			var email=$("#email").val().trim();
			
			if(id.length<5){
				alert("아이디는 5글자 이상 입력해주세요.");
				return false;
			}
			if(pw.length<8){
				alert("비밀번호는 8글자 이상 입력해주세요.");
				return false;
			}
			if(pwCk.length==0){
				alert("비밀번호 확인을 입력해주세요.");
				return false;
			}
			if(name.length==0){
				alert("이름을 입력해주세요.");
				return false;
			}
			if(nickName.length<2){
				alert("닉네임은 2글자 입력해주세요.");
				return false;
			}
			if(email.length==0){
				alert("이메일을 입력해주세요.");
				return false;
			}
			
			if(confirm_id == 0 && confirm_pw == 0 && confirm_pwCk == 0 && confirm_nickName == 0 && confirm_mail == 0){
			return true;
			
			}
			
			if(confirm_id == 1){
				alert("아이디를 확인해주세요");
				return false;
			}
			if(confirm_pw == 1){
				alert("비밀번호가 일치하지 않습니다.");
				return false;
			}
			if(confirm_pwCk == 1){
				alert("비밀번호가 일치하지 않습니다.");
				console.log(confirm_pwCk);
				return false;
			}	
			if(confirm_nickName == 1){
				alert("닉네임을 확인해주세요.");
				return false;
			}
			if(confirm_mail == 1){
				alert("인증번호가 일치하지 않습니다.");
				return false;
			}
				
		}	
	
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                //document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
               /*  if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                } */

               /*  var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                } */
            }
        }).open();
    }
		
	</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
