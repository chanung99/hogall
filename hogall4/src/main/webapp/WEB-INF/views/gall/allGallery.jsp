<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<link rel="stylesheet" href="${path}/resources/css/style.css" />
<style>
	div#main{
		display: block;
	}
	div#main div#container{
		width: 1050px;
		margin: 0 auto;
	}
	div.rank_wrap{
		float:left;
		width: 370px;
		border : 1px solid black;
	}
	div.hotGall_box{
		float:left;
		width: 100%;
		height: 220px;
	}
	div.box_header{
		height: 40px;
		padding: 0 11px 0 18px;
		background-color : #E4E4E4;	
	}
	
	div.rankList_box ol li{
		margin-bottom: 15px;
		padding: 0 0 3px 30px;
		float: left;
	}
	
	.category_list{
		margin-top: 35px;
	}
	article#Rank_content{
		display: inline-block;
	}
	div.category_content{
		margin: 0 auto;
		width: 649px;
		height: 270px;
		border: 1px solid #ccc;
		vertical-align: top;
		box-sizing: border-box;
	}
	.category_content ul li{
		float: left;	
		margin-right: 20px;	
		margin-left: 5px;
		margin-bottom: 13px;
		
	}
	.category_content ul{
		overflow: hidden;
	}
	h4.category_headerTitle{
		background-color : #E4E4E4;
		text-align: center;
		height: 37px;
		margin-bottom: 11px;
		font-family: 'Do Hyeon', sans-serif;
	}
	a.category{
		cursor: pointer;
	}
	.box_header{
		font-family: 'Do Hyeon', sans-serif;
		
	}
	.rank{
		width: 120px;
	}
	
</style>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="Hello Spring" name="title" />
</jsp:include>


	<div id="main">
		<div id="container">
			<section id="Rank_Template">
				<article id="Rank_content">
					<div class="rank_wrap">
						<div class="hotGall_box">
							<div class="box_header">
								<h3 class="fl">인기있는 경매 카테고리</h3><!-- 인기있는 갤러리는 하루동의 갤러리 조회수를 기준으로 함 -->
							</div>
							<div class="box_content">
								<div class="rankList_box">
									<ol class="fl">
										<li><div class="rank"><a href="#">1.게임물품</a></div></li>
										<li><div class="rank"><a href="#">2.전자기기</a></div></li>	
										<li><div class="rank"><a href="#">3.식품</a></div></li>
										<li><div class="rank"><a href="#">4.미술품</a></div></li>
										<li><div class="rank"><a href="#">5.낚시용품</a></div></li> 
									</ol>
								</div>
							</div>
							
						</div>
					</div>
				</article>
			</section>
			
			<section class="category_list">
				<article class="category_listWrap">
					<div class="category_list">
						<div class="category_box">
							<div class="category_content">
								<h4 class="category_headerTitle">경매 카테고리</h4>
									<ul>
										<li><a id="sporting goods" class="category" <%-- href="${pageContext.request.contextPath }/gall/sportsList.do" --%>>스포츠 용품</a></li><!-- 클릭하면 컨트롤러로 연결  -->
										<li><a id="clothing"class="category">의류</a></li>
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
				</article>
			</section>
		</div>
	</div>
	
	<script>

			$(".category").click(function(){
				var category=$(this).attr('id');
				location.href="${pageContext.request.contextPath}/gall/gallList.do?category="+category;
		
			
		})
	</script>


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	
