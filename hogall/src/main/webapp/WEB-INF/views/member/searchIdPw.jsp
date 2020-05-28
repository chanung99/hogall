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
<style>
	header#search_header{
		background-color:#171792;
	}
	header#search_header div.search_head{
		height: 90px;
		width: 890px;
		position: relative;
		margin: 0 auto;
	}
	header#search_header h1.search_logo{
		margin: 0;
		position: absolute;
		top: 30px;
		overflow: hidden;
		left: 0px;
		
		
	}
	header#search_header a.hogallImg img{
		width: 200px;
	}
	header#search_header a.searchImg img{
		width: 250px;
	}
	
	header#search_header nav.main_lnb{
		position: absolute;
		right: 0;
		bottom: 0;
	}
	header#search_header nav.main_lnb ul{
		overflow: hidden;
	}
	header#search_header nav.main_lnb li{
		float: left;
		list-style: none;
	}
	header#search_header nav.main_lnb li a{
		text-decoration: none;
		color: #ffffff;
	}
	header#search_header nav.main_lnb ul li:nth-child(n+2) a::before {
		content: "|";
	}
	
	div#section{
		width: 1140px;
		margin: 0 auto;
	}
	
	.labelBox{
		float: left;
		width: 100px;
	}
	.textBox{
		float: left;
		width: 300px;
	}
	.id_container{
		width: 480px;
		margin-top:31px;
		padding-top: 30px;
		border: 1px solid #BECAE9;
		min-height: 400px;
	}
	
	.textBox input{
		width: 100%;
		height: 30px;
	}
	
	#idForm_title{
		border-bottom: 2px solid #7794E7;
	}
	div.form_email{
		margin-top: 11px;
	}
	div.form_name{
		float: left;
	}
	div.form_email{
		float: left;
	}
	#emailGo{
		float: right;
	}
	.hidden{
		display: none;
		
	}
	#numSam{
		float: right;
	}
</style>
</head>
<body>
	<div>
		<header id="search_header">
			<div class="search_head">
				<h1 class="search_logo">
					<a href="#" class="hogallImg"><img src="${pageContext.request.contextPath }/resources/images/hogall_blueB_whiteC.PNG"></a>
					<a href="#" class="searchImg"><img src="${pageContext.request.contextPath }/resources/images/serach_blueB_whiteC.PNG"/> </a>
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
		</header>
	</div>
	
	
	<div id="main">
		<div id="section">
			<div class="id_container">
				<div id="idForm">	
					<div id="idForm_title">
						<h3>아이디를 찾는데 필요한 정보 입력</h3>
					</div>		
					<form action="${pageContext.request.contextPath }/member/idFinder" method="post" onsubmit="return frnSubmit();">
						<div style="padding-top: 30px;">			
							<div class="form_name">			
								<div class="nameLabel labelBox"><label for="userName">이름</label></div>
								<div class="nameBox textBox"><input type="text" id="userName" name="userName" placeholder="이름"/></div>
							</div>
							
							<div class="form_email">		
								<div class="emailLabel labelBox"><label for="email">이메일</label></div> 
								<div class="emailBox textBox"><input type="email" id="email" name="email" placeholder="이메일"/><button onclick="go()" id="emailGo" type="button">인증번호 보내기</button></div>
							</div>
							
							<div class="form_cur hidden">
								<div class="curLabel labelBox"><label for="cur">인증번호</label></div>
								<div class="curBox textBox"><input type="text" id="cur" name="cur" placeholder="인증번호"><button type="button" id="numSam" onclick="numS()">인증번호 확인</button>
								<input type="hidden" id="ckNumber" name="ckNumber"/>
								</div>
							</div>
						</div>
						<div class="btnBox">
							<button type="submit">아이디 찾기</button>
						</div>	
					</form>
				</div>
			</div>
			
			<div class="pw_contaienr">
				<div class="pwForm" id="pwForm">
					<div id="pwForm_title">
						<h3>비밀번호를 찾는데 필요한 정보 입력</h3>
					
					</div>
				</div>
			</div>
			
		</div>
	</div>

<script>
	var confirm_mail=1;

	function go(){
		var tomail=$("#email").val();
		$(".form_cur").show();
		
		$.ajax({
			url : '${pageContext.request.contextPath}/mail/mailSending',
			data : {"tomail":tomail},
			dataType : 'html',
			type : 'POST',
			success: function(data){
				 $("#ckNumber").attr("value",data); 
				console.log($("#ckNumber").val());
				console.log(data);
			}
		});	
		
	}
	
	function numS(){
		var num=$("#cur").val();
		var ckNumber=$("#ckNumber").val();
		
		if(num==ckNumber){
			confirm_mail=0;
			alert("인증번호가 일치합니다.");
		}else if(num!=ckNumber){
			confirm_mail=1;
			alert("인증번호가 일치하지 않습니다.");
		}
	}
	
	function frnSubmit(){
		
		if(confirm_mail==0){
			return true;
		}
		
		if(confirm_mail==1){
			return false;
		}
		
	}
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
