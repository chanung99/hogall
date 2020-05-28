<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<style>
	body * {
		font-family: 'Noto Sans KR', sans-serif;
	}

	div#header_title {
	margin-bottom: 50px;
}

div.header_container {
	width: 950px;
	margin: 0 auto;
	margin-bottom: 55px;
}

section#image_template {
	width: 100%;
}

div.banner_container {
	width: 900px;
}

img#banner {
	width: 100%;
	height: 310px;
}

ul.pagination li.page-item {
	float: left;
}

div.image_title img {
	width: 200px;
	height: 200px;
}

div.product_container {
	width: 950px;
	margin: 0 auto;
}

div.product_wrap {
	display: inline-block;
}

div.pageBar_contaienr {
	margin-left: 485px;
	margin-right: 485px;
	width: 100%;
}

div.product_box {
	margin-left: 15px;
	margin-right: 15px;
	border: 1px solid #e0e0e0;
	margin-bottom: 20px;
}

div.product_name {
	/* background-color:#F6F6F6; */
	
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
.sellerP{
	display: inline;
}
.HclosingDate{
	display: inline;
}
</style>
					<div>
						
							<header class="content_header"> 
								
								<div class="pageing">
									
									<%-- <div class="pageBar_contaienr">${pageBar }</div> --%>
								</div>
							</header>
							<div class="star_board">
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
									마감날짜 :<div class="HclosingDate timer"> ${p.closingDatee }</div>
									<input type="hidden" class="datee" value="${p.closingDatee }"/>
											<!-- <span class="closingDate"></span> -->
									<input type="hidden" id="time" class="time" value="${p.closingTime }"/><br>		
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
					
							</div>	
</div>



<script>

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

$(function(){
	nowPrice = $("#wrap").children().children().children().children().next().next().children().html();
	 removeTag =$("#wrap").children().children().children().children().next().next();
	
	$(".nowP").each(function(index,item){
		var p=$(this).parent();
		var item = $(this).html();
		
		if(item==""){
			$(this).html("즉시구매 불가");
		}
		
		
	});
})
</script>