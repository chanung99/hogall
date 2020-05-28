<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/bootstrap/css/bootstrap.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/bootstrap/css/bootstrap.min.css"/> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>hogall</title>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<%-- <link rel="stylesheet" href="${path}/resources/css/style.css" /> --%>
<%-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css"/> --%>
<link href="https://fonts.googleapis.com/css?family=Single+Day&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Poor+Story|Single+Day&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Jua&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Gothic+A1&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Jua&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">

<style>

footer{
		background-clip: content-box; clear: both; height: 95px; text-align: center;
}
footer p {
margin-top: 30px;
}
li {
	list-style: none;	
}
.fl {
	float:left;	
}

div#main{
	display: block;
	
}

.pointer{
	cursor: pointer;
	
}
.tc{
	
	text-align: center;
}

.fr {
	
	float : right;
}


a{
cursor: pointer;
}
 * {
	margin: 0;
	padding: 0;
}
body *{
	font-family: 'Noto Sans KR', sans-serif;
}
li {
	list-style: none;
}
a {
	text-decoration: none;
}
img {
	border: 0;
}
header#main-header {
	/* width: 80%;
	height: 255px;
	margin-left:auto; */
	margin-right:auto;
	position: relative;
}
header#main-header div.gall-header{
	/* margin:0 auto;
	width: 1160px;
	height:280px;
	position:relative; */
	width: 100%;
	position: relative;
}
#main-header #title{
	/* position: absolute;
	top:40px;
	left:20px;
	overflow:hidden;
	text-align: center; */
	position: absolute;
 	top:40px;
 
 	overflow:hidden;
 	text-align: center;
}
#main-header #title a>img{
	width:250px; 
}
#main-header #top-nav{
	position: absolute;
	right: 20px;
	top: 0px;
}
#main-header #top-nav>ul{
	overflow: hidden;
	
}
#main-header #top-nav>ul>li{
	float: left;
	
}
#main-header #top-nav>ul>li a{
	color: black;
}
#main-header #top-nav ul li:nth-child(n+2) a::before {
	content: "|";
}
#main-header #second-nav{
}
#main-header #second-nav ul{
	display: inline-block;
}
#main-header #second-nav ul li{
	float: left;
}
#main-header #second-nav-wrap{
	background-color: #E5E4E6;
	position: absolute;
	width:980px;
	bottom: 10px;
	left: 35px;
	border: 1px ridge #A6A6A6;
}
#main-header #second-nav-wrap #second-nav>p{
	display: inline-block;
	float: left;
}
header#main-header div#search-bar{
	/*  position:absolute;
	left:392px;
	top:67px;	 		
	float:right;
	width: 275px;
	height:54px; */
	 position: relative;  
 float:right;
 width: 275px;
 height:50px;
}
#search-bar>div{
 width: 100%;
}
header#main-header input#search{
	/* font-size:16px;
	width:255px;
	height:43px;	
	padding:10px;
	border: 5px solid #171792;
	border-right: 0px;
	outline: none;
	float:left; */
	font-size:12px;
 width:100%;
 padding:5px 0 5px 10px;
 border: 0;
 outline: none;
 float:left;
 background-color: #ededed;
 position: absolute;
 top: 11px;
	
}
header#main-header button#search-button{
	width:50px;
	height:80%;
	border:5px solid #171792;
	background-color:#3A3AD1;
	outline: none;
	float:left;
	color:#ffffff; 
	cursor: pointer;
}

#search_result{
	width: 275px;
	/* height: 250px; */
	background-color : #ffffff;
	position: absolute;
	top: 44px;
		z-index: 100;
	display: none;
	overflow: auto;
	max-height:400px;
	border: 2px solid #3717AB;
}
.result{
	font-size: 15px;
	cursor: pointer;
}

header#main-header div.gnb_bar{
	/* min-width: 1000px;
	height:49px;
	 background-color: #171792; 
	background-color : #171792;
	position:absolute;
	left:35px;
	bottom:55px;
	border-top: 2px solid #171792;
	border-bottom : 2px solid #171792; */
	
	 width: 100%;
 height:49px;
 background-color: #000000;
	
	
}
div.gnb_bar a{
	color : #ffffff;
}
header#main-header nav.main-nav{
	/* margin: 0 auto; */
	/* float:left;
	font-size: 20px;
	width: 100%;
	font-family: 'Noto Sans KR', sans-serif; */
	
	
	 font-size: 14px;
 width: 1260px;
 margin: 0 auto;
 font-family: 'Noto Sans KR', sans-serif;
	
}

.allMenu a{
   width: 120px;
   height: 33px;
}
.allMenu a{
   display: block;
   padding: 1px 0 0 20px;
}
.main-nav ul{
	float: left;
}

.topNav_box{
	/* width: 100%;
	height: 31px;
	background-color: #F5F6F7; */
	width: 100%;
 height: 75px;
 background-color: #3a3d42;
}
.top_nav{
	/* position: absolute;
	right: 10px;
	top: 5px;  */
	float: right;
}
.options{
	/* font-size: 13px;
	float: left; */
	font-size: 13px;
 float: left;
 height: 75px;
 line-height: 75px;
}
.options a{
 color: #ffffff;
}
.check_id{
	margin-left: 24px;
}
div.loginput_box{
	margin-left: 4px;
	position: relative;
	top: 28px;
}

div.loginput_box input{
	width: 110px;
	height: 22px;
}
.checkbox_span label{
	font-size: 13px;
	color: #ffffff;
}
.login_set button{
	font-size:11px;
	width: 50px;
	height: 20px;
	margin-left: 9px;
}
.top_subject{
	/* position: absolute;
	top: 5px;
	left: 11px; */
}
.top_subject p{
	font-family: 'Noto Sans KR', sans-serif;
	
}
.result{
	margin-bottom:0;
	padding: 11px 12px 12px;
}
.user_info{
	float: left;
	height:75px;
	line-height: 75px;
}
.user_name{
	float:left;
	font-size: 14px;
	width: 70px;
}
.user_name strong{
	font-size: 14px;
}
.logoutBtn{
	width: 70px;
	height: 20px;
	font-size: 11px;
	background-color: #ffffff;
	border: 1px solid #000000;
	position: relative;
	top: 28px;
}
.loginBtn{
	background-color: #ffffff;
	border: 1px solid #000000;
	position: relative;
	top: 28px;
}

.top_subject{
 float: left;
 height: 75px;
 line-height: 75px;
}
.top_subject h1{
 font-family: 'Noto Sans KR', sans-serif;
 color: #ffffff;
 
}
.navboxWrap{
 width: 1260px;
 margin: 0 auto;
}
.navboxWrap::after{
 content: "";
 display: block;
 clear: both;
}
#nanum{
 color: #ffffff;
}
#login_box{
 height: 75px;
 line-height: 75px;
}
.categoryLayer{
    float: left;
    height: 50px;
    line-height: 50px;
    position: relative;
}
.categoryLayer a {
   color: #ffffff;
}

.dropdown{
   line-height: 30px;
   display: none; 
   width: 145px;
   position: absolute;
   top: 49px;
   z-index: 999;
   background-color: #3a3d42;
  
}
.main-nav li{
   float: left;
   height: 50px;
   line-height: 50px;
}
.top_menu li:nth-child(n+1){
 margin-left: 15px;
}
</style>
</head>
<body>
	
	
	<header id="main-header"> 
		<div class="gall-header">	
			<%-- <div id="title">
				<h1><a href="${pageContext.request.contextPath }" id="logo-title"><img src="${path }/resources/images/hogall.png"/></a></h1>
			</div> --%>
			
			
			
			
			<div class="topNav_box">
			<div class="navboxWrap">
				<div class="top_subject">
                  <a href="${pageContext.request.contextPath }" id="logo-title">
                     <h1>HOGALL</h1>
                  </a>
             	</div>
				<nav class="top_nav">
					<div id="logged_container">
						<div class="options fl">
					<c:if test="${loggedMember==null }">
						<a id="enroll" href="${pageContext.request.contextPath }/member/enrollMember.do">회원가입 </a><span id="nanum">|</span>
						<a id="idpwSearch" href="${pageContext.request.contextPath }/member/searchIdPw.do ">아이디 / 비밀번호 찾기</a>
					</c:if>
					<c:if test="${loggedMember!=null }">
						<c:if test="${loggedMember.memberId != 'admin' }">
							<a id="myPage" href="${path }/member/myPage?id=${loggedMember.memberId }">마이페이지</a> |
						</c:if>
						<c:if test="${loggedMember.memberId == 'admin' }">
							<a id="setting" href="${path }/member/setting">회원관리</a>
						</c:if>
					</c:if>	
						</div>
				<c:if test="${loggedMember==null }">
						
						
						 <div id="login_box" class="fl">
                        <form class="login_form" name="loginForm"
                           action="${pageContext.request.contextPath }/member/login.do" method="post">
                           <div class="userText_box fl">
                              <div class="loginput_box fl">
                                 <input type="text" id="user_id" name="memberId" />
                              </div>
                              <div class="loginput_box fl">
                                 <input type="password" id="user_pw" name="password" />
                              </div>
                           </div>
                           <div class="login_set fl">
                              <div class="check_id fl">
                                 <span class="checkbox_span">
                                    <input type="checkbox" class="form-check-input" id="idsave" />
                                    <label for="idsave">ID 저장</label>
                                 </span>
                              </div>
                              <button type="submit" class="loginBtn">로그인</button>
                           </div>
                        </form>

                     </div> 
                    
					</c:if>
					<c:if test="${loggedMember!=null }">
						<div class="user_info">
							<div class="user_inr">
								<div class="user_name">
									<strong>${loggedMember.name }</strong>님 |
								</div>
								<button type="button" onclick="logout()" class="logoutBtn">로그아웃</button>
							</div>
						</div>
					</c:if>
				</div>
				</nav>
			</div>	
			</div>
			
			
			
			
			<div class="gnb_bar">
				<nav class="main-nav">
					<div class="categoryLayer">
					<a href="#">갤러리</a>
					<div class="dropdown">
						<div class="allMenu">
						<ul>
                           <li><a id="sporting goods" class="category">스포츠 용품</a></li><!-- 클릭하면 컨트롤러로 연결  -->
                           <li><a id="clothing" class="category">의류</a></li>
                           <li><a id="shoes" class="category">신발</a></li>
                           <li><a id="electronics" class="category">전자제품</a></li>
                           <li><a class="category">게임장비</a></li>
                           <li><a class="category">게임물품</a></li>
                           <li><a class="category">식품</a></li>
                           <li><a class="category">가구,인테리어</a></li>
                           <li><a class="category">카메라</a></li>
                           <li><a class="category">컵,그릇</a></li>
                           <li><a class="category">주류</a></li>
                           <li><a class="category">악기</a></li>
                           <li><a class="category">미술품</a></li>
                           <li><a class="category">피규어</a></li>
                        </ul>
						</div>
					</div>
					</div>
				
				
				
					 <ul class="top_menu">
					
						<%-- <li><a href="${pageContext.request.contextPath }/gall/allGall.do">갤러리</a></li> --%>
						<li><a href="#">상점</a></li>
						<li><a href="#">공지사항</a></li>
						<li><a href="#">이벤트</a></li>
						<li><a href="#">마이페이지</a></li>
						<li><a href="#">로그인</a></li>
					</ul>
					<div id="search-bar">
				
					<input type="text" id="search" placeholder="검색"/>
					<!-- <button type="button" id="search-button"></button> -->
					
				<div id="search_result">
				
				</div>
			</div>
				</nav>
			</div>
	
			
			
		</div>
	</header>
	<script>
	function logout(){
		location.href="${pageContext.request.contextPath}/member/logout.do";
		
	}
	
		$("#search").keyup(function(){
			var search = $("#search");
			var keyword = $("#search").val();
				if(keyword.length>0){					
				 	$.ajax({
					type:"get",
					url:"${path}/gall/searchProduct",
					data : {"keyword":keyword},
					contentType: "application/x-www-form-urlencoded; charset=euc-kr",  
					dataType : 'JSON',
					success : function(data){
						console.log(data);
						var autoword=$("#search_result");
						var list=data.list;
						$('p').remove('.result');
						for(var i=0; i<data.list.length; i++){
							
							autoword.append("<p class='result'>"+data.list[i].PRODUCTNAME+"</p>");
							
						}
						var pTag=$(".result");
						
						
						if(list.length>0){
							autoword.css('display','block');
						}else if(list.length==0){
							autoword.css('display','none');
						}
						
						if(list.length<1){
							autoword.css('display','none');
						}
						
					}
					
				});
				 	
				 	
			}
				
			var autoword=$("#search_result");
			
			autoword.css('display','none');	
				
				
		});
		
		$(".categoryLayer").mouseover(function(){
	         $(".dropdown").css("display","block");
	       });

	       $(".categoryLayer").mouseout(function(){
	          $(".dropdown").css("display","none");
	       });
			
	       $(".category").click(function(){
				var category=$(this).attr('id');
				location.href="${pageContext.request.contextPath}/gall/gallList.do?category="+category;
				console.log(category);
			
		})
	</script>
	