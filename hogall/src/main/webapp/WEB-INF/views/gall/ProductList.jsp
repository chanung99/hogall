<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${path}/resources/css/style.css" />
<link href="https://fonts.googleapis.com/css?family=Jua&display=swap" rel="stylesheet">

<style>
div#main {
	
}

div#header_title {
	width:1200px;
	margin: 0 auto 17px;
}

div.header_container {
	width: 1295px;
	margin: 0 auto;
	margin-bottom: 55px;
}

section#image_template {
	width: 100%;
}

div.banner_container {
	width: 1200px;
	margin: 0 auto;	
}

img#banner {
	width: 100%;
	height: 570px;
}

ul.pagination li.page-item {
	float: left;
}

div.image_title img {
	width: 250px;
	height: 250px;
}

div.product_container {
	width: 1225px;
	margin: 0 auto;
}

div.product_wrap {
}

.pageBar_container{
	margin-top: 50px;
}

div.product_box {
	margin-left: 15px;
	margin-right: 15px;
	border: 1px solid #e0e0e0;
	margin-bottom: 20px;
	height: 432px;
}
div.product_name{
	height: 40px;
}

div.product_name>p {
	/* background-color:#F6F6F6; */
	font-family: 'Noto Sans KR', sans-serif;
		
}
.nowP{
		display: inline;
}

.top_border {
	border-top: 1px solid #d1cbcb;
}

.pi {
	background-color: #F6F6F6;
}

.fr {
	float: right;
}

.price{
	display: inline;
}
.sellerP{
	display: inline;
}
.HclosingDate{
	display: inline;
}
#header_title>h2{
	float: left;
	
}
.totalCount{
	border-bottom: 2px solid #000000;
	margin-bottom: 45px;
	border-radius: 4px;
}
.totalCount .countText{
	font-family: 'Jua', sans-serif;
}
.countText strong{
	color: #000000;
}

.product_wrap::after{
	content: "";
	display: block;
	clear: both;
} 

.product_list{
	width: 1150px;
	margin: 0 auto;
}
.product_list::after{
	content: "";
	display: block;
	clear: both;
}
.product_nowPrice{
	font-family: 'Nanum Gothic', sans-serif;
	
}
.product_presentPrice	{
	font-family: 'Nanum Gothic', sans-serif;
}
.product_information{
	font-family: 'Nanum Gothic', sans-serif;
}

</style>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="Hello Spring" name="title" />
</jsp:include>

<div id="main">
	<div class="header_container">
		<div id="header_title">
			<h2>${list[0].categoryName }</h2>
		</div>
		<section id="image_template">
			<div class="banner_container">
				<img id="banner"
					src="${pageContext.request.contextPath}/resources/banner/${list[0].categoryImage}" />
			</div>
			
		</section>
	</div>
	
	<div style="margin: 0 auto; width: 1295px;">
		<div class="product_container">
			<div class="totalCount">
				<p class="countText">모두 <strong>${total }</strong> 개의 상품이 검색되었습니다.</p>
			</div>
			<div class="product_wrap" id="wrap">
				<div class="product_list">
					<c:forEach items="${list }" var="p">
						<div class="fl product_box pointer" id="${p.productId}">
							<div class="box">
								<div class="image_title">
									 <img class="product_image"
										src="${pageContext.request.contextPath }/resources/product/${p.reThumbnail}" id="${p.reThumbnail }">
								</div>

								<div class="product_name top_border">
									<p class="tc">${p.productName }</p>
								</div>

								<div class="product_nowPrice top_border pi" id="nowPrice">
									즉시구매가 : <p class="tc nowP">${p.buyNowPrice }</p>
								</div>

								<div class="product_presentPrice top_border pi" id="priceStart">
									현재 입찰가 : <p class="tc price">${p.price }</p>
								</div>

								<div class="product_information" id="information">
									판매자명 : <p class="sellerP">${p.productOwner }</p><br/>
									마감날짜 :<span class="HclosingDate"> ${p.closingDatee }</span>
											<!-- <span class="closingDate"></span> -->
									<input type="hidden" id="time" value="${p.closingTime }"/><br>		
									마감시간 :<span class="closignTime"> ${p.closingTime }</span>
									<!-- DB PRODUCT 테이블 수정해서 마감기한 추가할것. -->
								</div>
							</div>
						</div>

						<div style="display: none;">
							<input type="hidden" class="category"
								value="${p.productCategory }" />
							</div>
							<input type="hidden" id="category" value="${productCategory }"/>
							
					</c:forEach>

				</div>
			</div>
			
			<h1 style="display: none;" id="productCategory">${productCategory }</h1>
			
			
			
		<div class="pageBar_container">${pageBar }</div>

		<div class="insert_button fr">
			<button type="button" onclick="enrollProduct()">글쓰기</button>
		</div>
		
		
		</div>
		
	</div>
	
</div>

<script>
	

	function gg(){
		var c = $("#productCategory").html();
		var category = $(".category").val();
		
		console.log(c);
	}

	$(function() {
		 nowPrice = $("#wrap").children().children().children().children().next().next().children().html();
		 removeTag =$("#wrap").children().children().children().children().next().next();
		
		$(".nowP").each(function(index,item){
			var p=$(this).parent();
			var item = $(this).html();
			
			if(item==""){
				$(this).html("즉시구매 불가");
			}
			
			
		});
		

	 	$(".HclosingDate").each(function(index, item) {
			var date = $(this).html();
			var d = new Date(date);
			var year = d.getFullYear();
			var month = d.getMonth() + 1;
			var day = d.getDate();

			datePlus = year + "년" + " " + month + "월" + " " + day + "일";

			var arr = $(".HclosingDate");

			$(item).html(datePlus);

		}); 
	 	
	 	$(".closignTime").each(function(index,item){
	 		var time=$(item).html();
	 		
	 		var hh = time.substring(0,2);
	 		
	 		var mm = time.substring(3,5);
	 		
	 		timePlus = hh + "시 "+mm+"분"
	 		$(item).html(timePlus);
	 		
	 	});

	});
	
	$(".product_box").click(function(){
		var productId=$(this).attr("id");
		var img=$(this).children().children().children().attr("id");
		var productName=$(this).children().children().next().children().html();
		var nowPrice=$(this).children().children().next().next().children().html();
		var priceStart=$(this).children().children().next().next().next().children().html();
		var name=$(this).children().children().next().next().next().next().children().html();
		var date=$(this).children().children().next().next().next().next().children().next().html();
		var time=$(this).children().children().next().next().next().next().children().next().next().next().next().html();
		var seller=$(this).children().children().next().next().next().next().children().html();
		
		location.href="${pageContext.request.contextPath}/gall/readProduct?productId="+productId+"&img="+img+"&productName="+productName+"&nowPrice="+nowPrice+"&priceStart="+priceStart+"&name="+name+"&date="+date+"&time="+time;
		
		
	});

	function enrollProduct() {
		var category = $("#productCategory").html();
		//var category = $("#category").val();
		var id = "${loggedMember.memberId}";

		if (id == "") {

			alert("로그인을 하셔야 상품등록이 가능합니다.");
			return false;
		} else {

			location.href = "${pageContext.request.contextPath}/gall/enrollProduct?category="+ category;
		}

	}

	
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
