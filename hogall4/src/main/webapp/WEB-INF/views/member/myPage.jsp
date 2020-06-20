<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="" name="title" />
</jsp:include>
<style>
	body * {
		font-family: 'Noto Sans KR', sans-serif;
	}

	#main{
		margin: 0 auto;
		width: 1260px;
	}
	
	#mp_container{
		width: 1060px;
		margin: 0 auto;
	}
	.mp_information{
		width: 1200px;
		/* margin : 0 auto; */
	}
	.subject{
		margin-top: 30px;
	}
	.mp_information::after{
		content: "";
		display: block;
		clear: both;
	}
	.mp_inforWrap{
		width: 1200px;
		margin: 40px auto;
	}
	.mp_pwWrap button{
		width: 250px;
		height: 80px;
		background-color: #1C0DBC;
		color: #ffffff;
		border: 1px solid #1919CE;
	}
	.mp_idWrap{
		float: left;
	}
	.mp_pwWrap{
		
	}
	.mp_bidWrap{
		margin-top: 50px;
	}
	.bid_mainTitle{
		float: left;
	}
	.bid_oc{
		float: right;
	}
	.bid_subject{
		border-bottom: 1px solid #000000;
	}
	.bid_subject::after {
		content: "";
		display: block;
		clear: both;	
	}
	.bid_tbWrap{
		width: 100%;
		margin: 0 auto;
	}
	.bid_table{
		width: 100%;
	}
	.bid_content{
		margin-top: 15px;
	}
	.bid_table td,.bid_table th{
		text-align: center;
		border-bottom: 1px solid #ddd;
		
	}
	.bid_table td:nth-child(n+2),.bid_table th:nth-child(n+2){
		border-left: 1px solid #ddd;
	}
	.bid_table th{
		background-color: #F2F2F5;
		width: 300px;
		height: 55px;
		
	}
	.bid_table td{
		padding: 7px 25px;
		
	}
	.on_off{
		cursor: pointer;
		font-size: 19px;
	}
	.mp_winWrap{
		margin-top: 50px;
	}
	.win_subject{
		border-bottom: 1px solid #000000;
	}
	.win_subject::after{
		content: "";
		display: block;
		clear: both;
	}
	.win_mainTitle{
		float: left;
	}
	.win_oc{
		float: right;
	}
	.on_offT{
		cursor: pointer;
		font-size: 19px;
	}
	.win_tbWrap{
		width: 100%;
		margin: 0 auto;
	}
	.win_table{
		width: 100%;
	}
	.win_content{
		margin-top: 15px;
	}
	.win_table td,.win_table th{
		text-align: center;
		border-bottom:1px solid #ddd;
	}
	
	.win_table td:nth-child(n+2),.win_table th:nth-child(n+2){
		border-left: 1px solid #ddd;
	}
	.win_table th{
		background-color: #F2F2F5;
		width: 300px;
		height: 55px;
		
	}
	.win_table td{
		padding: 7px 25px;
		
	}
	.bidNwin{
		width: 450px;
		padding: 10px 15px;
		background-color: #f7f7f7;
		float: left;
		border: 1px solid #000000;
		
	}
	.mp_inforWrap>div{
		height: 160px;
	}
	.inner_info{
		height: 32px;
		margin-bottom: 13px;
	}
	.inner_info span button.attenBtn{
		border: 1px solid #000000;
		width: 123px;
		font-size: 12px;
		background-color: #ffffff;
		padding: 5px 10px;
	}
	.money_wrap{
		width: 222px;
		padding: 42px 10px;
		background-color: #f7f7f7;
		border : 1px solid #000000;
	}
	.honey{
		height: 32px;
		margin-bottom: 14px;	
	}
	.buy_box,.shop_box{
		margin-left: 11px;
	}
	.buy_box button,.shop_box button{
		width: 100%;
		padding: 4px 15px;
		border : 1px solid #000000;
		background-color: #ffffff;
	}
	.mp_funWrap{
		border: 1px solid #000000;
		background-color: #f7f7f7;
		width: 300px;
		padding: 25px 15px;
	}
	.funcChange{
		border : 1px solid #000000;
		background-color : #ffffff;
		width: 100px;
		padding: 4px 10px;
	}
</style>

<div id="main">
	<div id="mp_container">
		<div class="subject">
			<h5>마이페이지</h5>
		</div>
		
		<div class="mp_wrap">
			<div class="mp_information">
				<div class="mp_inforWrap">
					<!-- <div class="mp_idWrap">
						<button type="button">아이디 변경</button>
					</div> -->
					<div class="bidNwin">
						<div class="inner_info">
							<span>${loggedMember.name }님</span>
						</div>
						<div class="inner_info two">
							<span>입찰한 물품 : <strong>${bidCount }</strong>개</span>|
							<span>낙찰된 물품 : <strong>${winCount }</strong>개</span>
						</div>
						<div class="inner_info">
							<span><button type="button" class="attenBtn">관심 카테고리</button></span>
						</div>
					</div>
					
					<div class="money_wrap fl">
						<div class="honey">
							<span class="fl"><strong>호니</strong></span>
							<span class="fr"><strong>0원</strong></span>
						</div>
						<div class="use_box">
							<div class="buy_box fl">
								<button type="button">구매내역</button>
							</div>
							<div class="shop_box fl">
								<button type="button">상점</button>
							</div>
						</div>
					</div>
					
					<div class="mp_funWrap fl">
						<ul>
							<li><button type="button" onclick="change()" class="funcChange">정보 변경</button></li>
						</ul>
						
					</div>
				</div>			
			</div>
			
			<div class="mp_bidWrap">
				<div class="biding_wrap">
					<div class="bid_subject">
						<div class="bid_mainTitle">
							<p>입찰한 경매</p>
						</div>
						<div class="bid_oc">
							<p class="on_off">열기</p>
						</div>
						
					</div>
					
					<div class="bid_content">
						<div class="bid_tbWrap">
							<table class="bid_table">
								<tr>
									<th>상품번호</th>
									<th>입찰한 금액</th>
									<th>입찰 단위</th>
									<th>입찰 날짜</th>
								</tr>
								
								<c:forEach var="bid" items="${bid }">
									<tr>
										<td>${bid.productId}</td>
										<td>${bid.curPrice }</td>
										<td>${bid.bidPrice }</td>
										<td>${bid.enrollD }</td>
									</tr>
								</c:forEach>
							</table>
						</div>
					</div>
							
				</div>
				
				
				
			</div>
			
			<div class="mp_winWrap">
					<div class="winning_wrap">
						<div class="win_subject">
							<div class="win_mainTitle">
								<p>낙찰된 경매</p>
							</div>
							<div class="win_oc">
								<p class="on_offT">열기</p>
							</div>
						</div>
					
						
						<div class="win_content">
							<div class="win_tbWrap">
								<table class="win_table">
									<tr>
										<th>상품번호</th>
										<th>상품이름</th>
										<th>상품가격</th>
										<th>판매자명</th>
										<th>낙찰 날짜</th>
									</tr>
									
									<c:forEach var="win" items="${win }">
										<tr>
											<td>${win.productId }</td>
											<td>${win.name }</td>
											<td>${win.price }</td>
											<td>${win.seller }</td>
											<td>${win.wbdatee }</td>
										</tr>
									</c:forEach>
								</table>
							</div>
						</div>
					</div>
					
				</div>
			
		</div>
		
	</div>	
</div>

<script>
	function change(){
		id="${loggedMember.memberId}";
		
		location.href="${path}/member/pwCk?id="+id;
		
	}
	

	$(".attenBtn").click(function(){
		alert("준비중입니다.");
	});

	$(".on_off").click(function(){
		var text = $(this).html();
		if(text=="열기"){
			
		 	$(".bid_tbWrap").css("display","none"); 
			$(this).html("닫기");	
		}
		if(text=="닫기"){
			$(".bid_tbWrap").css("display","block");
			$(this).html("열기");
		}
		
	});
	
	$(".on_offT").click(function(){
		var text= $(this).html();
		if(text=="열기"){
			$(".win_tbWrap").css("display","none");
			$(this).html("닫기");
			
		}
		if(text=="닫기"){
			$(".win_tbWrap").css("display","block");
			$(this).html("열기");
		}
		
	});
</script>


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
