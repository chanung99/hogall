<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="${path}/resources/css/style.css" />
<html>
<head>
<style>

header#search_header{
		background-color:#db0000;
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
		width: 880px;
		margin: 0 auto;
	}
	div#textBox{
		width: 300px;
		height: 300px;
		border: 1px solid #E2E3E3;
		margin: 0 auto;
		background-color: #F9F9FB;
		margin-top: 133px;
	}
</style>
	
</head>
	
<body>	
	<div>
		<header id="search_header">
			<div class="search_head">
				<h1 class="search_logo">
					<a href="#" class="hogallImg"><img src="${pageContext.request.contextPath }/resources/images/hogall_redB_whiteC.PNG"></a>
					<a href="#" class="searchImg"><img src="${pageContext.request.contextPath }/resources/images/search_redB_whiteC.PNG"/> </a>
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
			<div id="idWrap">
				<div id="textBox">
					<div>조회된 아이디는 <strong>${id }</strong>입니다.</div>
					
				</div>
			</div>
		</div>
	</div>
	
	

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
