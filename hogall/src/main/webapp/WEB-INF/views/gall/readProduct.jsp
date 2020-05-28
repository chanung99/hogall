<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">

<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="Hello Spring" name="title" />
</jsp:include>
<style>
div#main {
	margin: 20px auto 0;
	width: 1160px;
}

section#container {
	width: 1180px;
	margin: 0 auto; 
	float: left;
}

ul {
	list-style: none outside none;
	padding-left: 0;
	margin: 0;
}

.demo .item {
	margin-bottom: 60px;
}

.content-slider li {
	background-color: #ed3020;
	text-align: center;
	color: #FFF;
}

.content-slider h3 {
	margin: 0;
	padding: 70px 0;
}

.demo {
	width: 500px;
	height: 550px;
}

#productImage{
	width: 450px;
	height: 450px;
}

li a img{
	width: 88px;
	height: 45.5px;
}
	
.productDetail_information{
	width: 500px;
	height: 600px;
}
.information_wrap>table{
	width: 100%;
	border-top: 1px solid #CCCCCC;
	border-bottom: 1px solid #CCCCCC;
}
.information_wrap>table tr{
	text-align: left;
}
.information_wrap>table th{
	/* background-color: #F2F2F5; */
	background:url("${path}/resources/images/xx.png");
	width: 100px;
	font-family: 'Noto Sans KR', sans-serif;
	
}
.information_wrap>table th{
	padding: 13px;
	width: 37px;
	height: 50px;
	font-family: 'Noto Sans KR', sans-serif;
	
}
.information_wrap>table td{
	padding: 13px;
	width: 37px;
	height: 50px;
	font-family: 'Noto Sans KR', sans-serif;
}

.information_wrap table td p{
	font-family: 'Noto Sans KR', sans-serif;
}
#productName_box{
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 22px;
}
#productName_box p{
	display: inline;
	font-family: 'Noto Sans KR', sans-serif;
}
.demo{
	border: 2px solid #F4F4F5;
	margin: 11px;
}
.item{
	padding: 7px;
}
.information_wrap h5{
	font-family: 'Noto Sans KR', sans-serif;
}
.productDetail_information{
	margin-top: -21px;
}
#bidding{
	font-size: 10px;
	width: 95px;
	height: 30px;
	background-color: #3a3d42;
	border: 1px solid #3a3d42;
	color: #ffffff;
	margin-left: 10px;
}
.biddingBtn_wrap{
	margin-top: 20px;
}
.biddingBtn_wrap form input[type="submit"]{
	width: 150px;
	height: 40px;
	color:#ffffff;
	background-color:#3a3d42;
	border: 1px solid #3a3d42;
	font-family: 'Noto Sans KR', sans-serif;
}
#bidding_btn{
	/* background-color: #F3ED84;
	border: 1px solid #F3ED84;
	color: black; */
}
.content_header{
	background-color: #3a3d42;
	padding: 3px;
}
.content_header h3{
	color : #ffffff;
}
.productContent{
	padding: 7px 25px;
	margin-top: 20px;
}
textarea {
	resize: none;	
}
textarea[name="commentContent"]{
	width: 100%;
}
.comment_header{
	border-bottom: 2px solid #171792;
	margin-top: 100px;
}
.comment_submit{
	text-align: center;
}
.comment_list{
	
}
.comment_wrap::after{
	content: "";
	display: block;
	clear: both;
}
.comment_submit button{
	margin-top : 23px;
	background-color: #3a3d42;
	border: 0px;
	color: #ffffff;
	width: 130px;
	height: 43px;
	
}
.comment_nickbox{
	width: 196px;
	float: left;
}
.comment_wrap{
	border-bottom: 1px solid #EDECED;
	padding: 7px 25px;
	font-size: 14px;
}
.comments{
	float: left;
	width: 745px;
	cursor: pointer;
}
#comment_form{
	margin-top: 55px;
}
a{
	color: #000000;
}
.comment_btn{
	float: right;
}
.cmtEnroll_date{
	float: right;
	margin-right: 15px;
}
.comment_btn button{
	padding : 2px;
	border: 1px solid #000000;
	background-color: #ffffff;
}
.answer{
	margin-bottom: 12px;
	margin-left: 30px;
}

</style>
<script src="${pageContext.request.contextPath }/resources/js/lightslider.js"></script>
<link rel="stylesheet"  href="${path}/resources/css/lightslider.css?after"/>

<script>
	$(document).ready(function() {
		$("#content-slider").lightSlider({
			loop : true,
			auto : true,
			keyPress : true
		});
		$('#image-gallery').lightSlider({
			gallery : true,
			item : 1,
			thumbItem : 9,
			slideMargin : 0,
			speed : 500,
			auto : true,
			loop : true,
			onSliderLoad : function() {
				$('#image-gallery').removeClass('cS-hidden');
			}
		});
	});
</script>


<div id="main">
	<section id="container">
		<article id="header_article">
			<div id="header_div">
				<div id="cateogry_box"></div>
				<div id="productName_box">
					물품명 :<p> ${product.productName }</p>
				</div>
			</div>
		</article>

		<article id="content_article">
			<div id="conetnt_box">
				<div style="display: inline-block; margin-bottom: 80px;">
					<div class="demo fl">
							<div class="item" style="margin-top: 30px;">
								<div class="clearfix">
									<ul id="image-gallery" class="gallery list-unstyled cS-hidden">
										<c:forEach items="${image }" var="i">
											<li data-thumb="${pageContext.request.contextPath}/resources/product/${i.reFileName}" style="width: 88px;">
												<img id="productImage" src="${pageContext.request.contextPath}/resources/product/${i.reFileName}"/>
											</li>
										</c:forEach>
										
									</ul>
								</div>
							</div>
					</div>
				
					<div class="productDetail_information fl">
						<div class="information_wrap">
						<h5 style="float: left;">현재가격 : ${product.price }원</h5>
						<p style="float: right; dis">남은시간 : <span id="timer"></span></p>
							<table>
								<tr>
									<th>경매 시작가</th>
									<td>${product.priceStart }</td>
								</tr>
								
								<tr>
									<th>입찰 단위</th>
									<td>${product.unit }</td>
								</tr>
								
								<tr>
									<th>현재 경매가</th>
									<td>${product.price }</td>
								</tr>
								
								<tr>
									<th>즉시 구매가</th>
									<td>
									<c:if test="${product.buyNowWhether=='Y' }">
										<p style="color: green;">${product.buyNowPrice }</p>
									</c:if>
									<c:if test="${product.buyNowWhether=='N' }">
										<p style="color: red;">즉시구매불가능</p>
									</c:if>
									</td>
								</tr>
								
								
								
								<tr>
									<th>입찰 수</th>
									<td>${pCount }  <!-- <button type="button" id="bidding" data-target="#myModalTwo" data-toggle="modal" class="">입찰자 내역</button> -->
									</td>
								</tr>
								


								<tr>
									<th>판매방식</th>
									<td>${product.productEnrollType }</td>
								</tr>
								
								<tr>
									<th>마감 날짜</th>
									<td>${product.closingDatee } ${product.closingTime }</td>
								</tr>
								
								<tr>
									<th>등록 날짜</th>
									<td>${product.enrollDate }</td>
								</tr>
							</table>
							
							<c:set var="sum" value="${product.price+product.unit }"/>
							
							<div class="biddingBtn_wrap fr">
														
								<form onsubmit="return bid()" method="post" action="${pageContext.request.contextPath }/gall/bid" style="display: inline;">
									<input type="hidden" name="memberId" value="${loggedMember.memberId }" />									
									<input type="hidden" name="productId" value="${product.productId }"/>										
									<input type="hidden" name="bidPrice" value="${product.unit }"/>										
									<input type="hidden" name="curPrice" value="${sum }"/>										
									<input type="submit" id="bidding_btn" value="입찰하기">
								
								
								</form>
								<form onsubmit="return now();" method="post" action="${pageContext.request.contextPath }/gall/winningBid" style="display: inline;">
									
									<input type="hidden"  name="memberId" id="id" value="${loggedMember.memberId }"/>
									<input type="hidden"  name="seller" id="seller" value="${product.productOwner }"/>
									<input type="hidden"  name="name" id="name" value="${product.productName }"/>
									<input type="hidden"  name="price" id="price" value="${product.buyNowPrice }"/>
									<input type="hidden"  name="image" id="image" value="${image[0]['rethumbnail']}"/>
									<input type="hidden"  name="productId" id="productNo" value="${product.productId }"/>
									<input type="submit" id="nowBid_btn" value="즉시구매">
								</form>	
								
								
								
							</div>
							
						</div>
					</div>
				</div>	
				
				
				<!-- <div class="modal fade" id="layerpop">
					<div class="modal-dialog">
						<div class="modal-content">
							header
							<div class="modal-header">
								닫기(x) 버튼
								<h4 class="modal-title">메모</h4>
								<button type="button" class="close" data-dismiss="modal">×</button>
								header title

							</div>
							body
							<div class="modal-body">
								<textarea class="form-control" id="memo"
									style="width: 100%; height: 150px; resize: none;"
									maxlength="500"></textarea>
							</div>
							Footer
							<div class="modal-footer">
								<button type="button" onclick="matchRequest()"
									class="btn btn-primary">매치신청</button>
								<button type="button" class="btn btn-danger"
									data-dismiss="modal">닫기</button>
							</div>
						</div>
					</div>
				</div> -->

				<%-- <div class="modal fade" id="myModalTwo" role="dialog">
					<div class="modal-dialog">

						<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header">
								<h4 class="modal-title">입찰자 목록</h4>
								<button type="button" class="close" data-dismiss="modal">×</button>
							</div>
							<div class="modal-body">
								<table>
										<tr>
										<th>입찰자명</th>
										<th>입찰금액</th>
										<th>입찰날짜</th>										
										</tr>
									<c:forEach var="p" items="${ppap }" varStatus="vs">
										
										
										<tr>
										<td>${p.memberId }</td>
										<td>${p.curPrice }</td>
										<td class="enrollDate">${p.enrollDatee }</td>
										</tr>
										
									</c:forEach>	
									
								</table>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">닫기</button>
							</div>
						</div>

					</div>
				</div> --%>
				
				
				
				
				
				<div class="productContent_wrap">
					<div class="content_header">
						<h3>상품 내용</h3> 
					</div>
				<!-- div 크기조절해서 내용 위치조절할것 -->
					<div class="productContent">
						<p>${product.productContent }</p>
					</div>
					
					<div class="comment_edditer">
						<div class="comment_header">
							<p>전체 댓글 ${commentCount }개</p>
						</div>
						
						<div class="comment_list">
							<ul class="comment_table">
								<c:forEach var="c" items="${comment }">
								<c:choose>
									<c:when test="${c.depth == '0' }">
										<li class="comment_li">
									</c:when>
									<c:when test="${c.depth == '1' }">
										<li class="comment_li answer">
									</c:when>
								</c:choose>	
										<div class="comment_wrap">
											<div class="comment_nickbox">
												<span>
													<a href="#">${c.memberId }</a>
												</span>
											</div>
											<c:choose>
												<c:when test="${c.depth == '0' }">
													<div class="comments" id="${c.groupId }">
												</c:when>
												<c:when test="${c.depth == '1' }">
													<div class="comments ansCmt" id="${c.groupId }">
												</c:when>
											</c:choose>	
													<span>
														<a href="#">${c.commentContent }</a>
													</span>
												</div>
																					
											<c:if test="${loggedMember.memberId == c.memberId }">
												<div class="comment_btn">
													<span>
														<button class="delete" type="button">댓글삭제</button>
														<input type="hidden" id="pcmtNo" value="${c.commentNo }"/>
														<input type="hidden" id="groupId" class="groupId" value="${c.groupId }" />
													</span>
												</div>
											</c:if>	
											
											<div class="cmtEnroll_date">
												<span>
													${c.enroll }
												</span>
											</div>
											
										</div>
									</li>	
								</c:forEach>	
							</ul>	
						</div>
						
						<form method="post" action="${path }/gall/productCommentInsert.do" id="comment_form">
							<div style="margin-top: 55px;">
								<input type="hidden" id="productId" name="productId" value="${product.productId }" />
								<input type="hidden" id="memberId" name="memberId" value="${loggedMember.memberId }" />					
								
								<textarea name="commentContent" id="commentContent" rows="6" cols="50"></textarea>
								<div class="comment_submit">
									<button type="button" onclick="enroll()">등록</button>
								</div>
							</div>	
						</form>
 						
					</div>
					
				</div>
			</div>
		</article>
	</section>
	<div style="display: none;" id="day_box">
		<input type="hidden" id="closingDate" value="${product.closingDatee }"/>
		<input type="hidden" id="closingTime" value="${product.closingTime }"/>
	
	</div>
</div>
<script>
	var groupId = 0 ;

	$(".comments").click(function(){
		groupId = $(this).attr("id");
		
		
		$(this).parent().parent().append(
				"<div class='rplNser'>" + 
					
					"<textarea name='commentContent' id='nserContent' rows='6' cols='50'>" +"</textarea>"+
					"<div class='comment_submit'>"+
						"<button type='button' onclick='nser()'>"+ "등록" + "</button>"+
					"</div>"+
				"</div>"
				
		);
	});
	
	function nser(){
		var productId = $("#productId").val();
		var memberId = $("#memberId").val();
		var content = $("#nserContent").val();
		/* var groupId = $("#groupId").val(); */
		 $.ajax({
			url:"${path}/gall/commentAnswer",
			dataType : "JSON",
			data : {"productId":productId,"memberId":memberId,"commentContent":content,"groupId":groupId},
			Type : "get",
			success:function(data){
				
			}
			
		});
		console.log(groupId);
	}
	
	
	$(".delete").click(function(){
		var memberId = "${loggedMember.memberId}";
		var id = $(this).parent().parent().prev().prev().children().children().html();
		var no = $(this).next().val();
		var th = $(this);
		var rem = th.parent().parent().parent().parent().attr("class");
		if(memberId == id){
			/* location.href="${path}/gall/commentDelete?memberId="+memberId; */
			
			 $.ajax({
				url:"${path}/gall/commentDelete",
				dataType : "JSON",
				data : {"commentNo":no},
				Type : "post",
				success:function(data){
					th.parent().parent().parent().parent().remove();
					
				}
				
			}); 
			
		}
	});


	function enroll(){
		var productId = $("#productId").val();
		var memberId = $("#memberId").val();
		var commentContent = $("#commentContent").val();
		$("li").remove(".comment_li");
		$.ajax({
			url:"${path}/gall/productCommentInsert.do",
			dataType : "JSON",
			data : {"productId":productId,"memberId":memberId,"commentContent":commentContent},
			Type : "get",
			success:function(data){
				console.log(data);
				
				
				
				for(var i=0; i<data.length; i++){
					console.log(data[i].commentNo);
					$(".comment_table").append("<li class='comment_li'>"+
													"<div class='comment_wrap'>"+
														"<div class='comment_nickbox'>"+
															"<span>"+
																"<a href='#'>"+data[i].memberId + "</a>"+
															"</span>"+													
														"</div>"+
														"<div class='comments'>"+
															"<span>"+
																"<a href='#'>"+data[i].commentContent+"</a>"+
															"</span>"+
														"</div>"+
														"<div class='comment_btn'>"+
															"<span>"+
																"<button class='delete' type='button'>"+"댓글삭제" +"</button>"+
															"</span>"+
														"</div>"+
														"<div class='cmtEnroll_date'>"+
															"<span>"+
																data[i].enroll +
															"</span>"+
														"</div>"+
														
														
													"</div>"+
												"</li>");
				} 
				
				
			}
			
		});
		
	}


	$(document).ready(function(){
	 	 tid=setInterval('msg_time()',1000); // 타이머 1초간격으로 수행
	});

	var date = $("#closingDate").val();
	var time = $("#closingTime").val();
	var stDate = new Date().getTime();
	var edDate = new Date(date +" "+time+":00").getTime(); // 종료날짜
	var RemainDate = edDate - stDate;
	function msg_time() {
	  var hours = Math.floor((RemainDate % (1000 * 60 * 60 * 24)) / (1000*60*60));
	  var miniutes = Math.floor((RemainDate % (1000 * 60 * 60)) / (1000*60));
	  var seconds = Math.floor((RemainDate % (1000 * 60)) / 1000);
	  m = hours + ":" +  miniutes + ":" + seconds ; // 남은 시간 text형태로 변경
	  document.all.timer.innerHTML = m;   // div 영역에 보여줌 
	  
	  if (RemainDate < 0) {      
	    // 시간이 종료 되었으면..
	    clearInterval(tid);   // 타이머 해제
	  }else{
	    RemainDate = RemainDate - 1000; // 남은시간 -1초
	  }
	}
	
	
	
	

	$(function(){
		var closing = "${product.closingDate}";
		var date = new Date(closing);		
	});
	

	$(".enrollDate").each(function(index,item){
		var date = $(this).html();
		var d = new Date(date);

		var year = d.getFullYear();
		var month = d.getMonth() + 1;
		var day = d.getDate();
		
		var datePlus = year + "년" + " " + month + "월" + " " + day + "일";


		$(item).html(datePlus);
	});



	var productId=$("#productNo").val();

	function bidInformation(){
		var html="${pageContext.request.contextPath}/gall/ppap?productId="+productId;
		var win = window.open(html, "PopupWin", "width=500,height=600");
		
	}

	function now(){
		var id = "${loggedMember.memberId}";
		if(id==""){
			alert("로그인 해주세요");
			return false;
		}
		return true;
		
		
	}
	
	function bid(){
		var id = "${loggedMember.memberId}";
		if(id==""){
			alert("로그인 해주세요");
			return false;
		}
		return true;
		
	}

</script>
	

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
