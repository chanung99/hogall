<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">

<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="" name="title" />
</jsp:include>
<style>
	div#main{
		display: block;
	}
	
	div#container{
		width:1080px; 
		margin:20 auto 0;
		
	}
	div#container::after{
		display: table;
		clear: both;
		table-layout: fixed;
		content: "";
	}
	section#main_section{
		width: 940px;
		float:left;
	}
	
	div#main header.content_header{
		overflow: hidden;
		height: 30px;
		line-height: 20px;
		margin-bottom: 12px;
		
	}
	.content_header h5{
		margin-bottom: 10px;
	}
	
	/* div#logged_container{
		width: 243px;
		height: 170px;
		border: 1px solid #F4F4F4;
		background-color:#F4F4F4;
		position:relative;
	}
	div#login_box{
		padding: 14px 0;
	}
	aside#logged_aside{
	font-family: 'Do Hyeon', sans-serif;
	
	}
	aside#logged_aside label{
		font-size: 14px;
	} */
	
	div#main section#main_section header.content_header>h3{
		float:left;
	}
	
	footer{
		background-clip: content-box; clear: both; height: 95px; text-align: center;
	}
	footer p {
		margin-top: 30px;
	}
	
	
	.nowP{
		display: inline;
	}
	.price{
	display: inline;
	}
	
	.content_header{
		font-family: 'Noto Sans KR', sans-serif;
		
	}
	
	.product_name>p{
	font-family: 'Noto Sans KR', sans-serif;
	
	}
	
	.product_nowPrice{
	font-family: 'Noto Sans KR', sans-serif;
	
}
.product_presentPrice	{
	font-family: 'Noto Sans KR', sans-serif;
}
.product_information{
	font-family: 'Noto Sans KR', sans-serif;
}
div.product_name{
	height: 40px;
}
.product_box{
	height: 370px;
}
#between{
 background-color: #f3f3f3;
 height: 144px;
 
}
</style>

	<div id="main">
			<div id="between">
         <!-- <img src="img/pickmatch.jpg" width="218"/> -->
      </div>
			<div id="container">
				<section id="main_section">
					<article class="main_article">
					
						<div class="starContent">
							
						</div>	
									
					</article>
					
				</section>
			
			</div>
			<h1 class="a"></h1>
	</div>
	<script>
	
		
		
	
		$(function(){
			$.ajax({
					url:"${path}/popularProduct",
					dataType:"html",
					Type:"Post",
					success:function(data){
						$(".starContent").html(data);
					},
					error:function(data){
					}
					
				});
			
			
			
			
		});
	
		
		

		$(document).ready(function(){
				  
			
			
			
			
			
			
			
			var userId = getCookie("cookieUserId"); 
			$("#user_id").val(userId); 
				         
			if($("#user_id").val() != ""){ // Cookie에 만료되지 않은 아이디가 있어 입력됬으면 체크박스가 체크되도록 표시
				$("#idsave").attr("checked", true);
			}
				         
			$("button[type='submit']", $('.login_form')).click(function(){ // Login Form을 Submit할 경우,
				if($("#idsave").is(":checked")){ // ID 기억하기 체크시 쿠키에 저장
					var userId = $("#user_id").val();
				    setCookie("cookieUserId", userId, 7); // 7일동안 쿠키 보관
				} else {
					deleteCookie("cookieUserId");
				}
				});             
		  })
				 
		 function setCookie(cookieName, value, exdays){
			var exdate = new Date();
			exdate.setDate(exdate.getDate()+exdays);
			var cookieValue = escape(value)+((exdays==null)? "": "; expires="+exdate.toGMTString());
			document.cookie = cookieName+"="+cookieValue;
		 }
		
		 function deleteCookie(cookieName){
			 var expireDate = new Date();
		 	expireDate.setDate(expireDate.getDate()-1);
		 	document.cookie = cookieName+"= "+"; expires="+expireDate.toGMTString();
	 	 }
		 
		 function getCookie(cookieName){
		 	cookieName = cookieName + '=';
		 	var cookieData = document.cookie;
		 	var start = cookieData.indexOf(cookieName);
		 	var cookieValue = '';
		 	if(start != -1){
			    start += cookieName.length;
		 		var end = cookieData.indexOf(';', start);
		 		if(end == -1) end = cookieData.length;
		 		cookieValue = cookieData.substring(start, end);
		 	}
		 	
		 return unescape(cookieValue);
				         
		 }
		
		
		 
		
	</script>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	
