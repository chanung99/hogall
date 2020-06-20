<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="Hello Spring" name="title" />
</jsp:include>

<style>
div#main {
	
}

div#member_management {
	width: 1160px;
	margin: 0 auto;
}

div#memberTblWrap {
	
}

div#memberTblWrap table tr th {
	padding: 5px 20px;
}

div#memberTblWrap table tr td {
	padding: 5px 20px;
}

.btnContent {
	margin-top: 33px;
}

.pagination {
	text-align: center;
}

.pagination .pageNum {
	padding: 3px 8px;
}

.table_subject {
	background-color: #CECED1;
}

textarea {
	resize: none;
}

.onofftd p {
	display: inline-block;
}

.modalClose {
	float: right;
}

.closeP {
	display: inline-block;
}

/* The Modal (background) */
.searchModal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 10; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}
/* Modal Content/Box */
.search-modal-content {
	background-color: #fefefe;
	margin: 15% auto; /* 15% from the top and centered */
	padding: 20px;
	border: 1px solid #888;
	width: 70%; /* Could be more or less, depending on screen size */
}
.reason_close{
	cursor: pointer;
    background-color: #DDDDDD;
    text-align: center;
    padding-bottom: 10px;
    width: 25%;
    padding-top: 10px;
    margin: 0 auto;
}
</style>

<div id="main">
	<div id="member_management">
		<div id="memberTblWrap">
			<table class="management paginated">
				<tr class="table_subject">
					<th>회원 아이디</th>
					<th>회원 이름</th>
					<th>회원 닉네임</th>
					<th>회원 이메일</th>
					<th>회원 레벨</th>
					<th>가입 날짜</th>
					<th>정지 여부</th>
					<th>정지 사유</th>
				</tr>

				<c:forEach items="${member }" var="m">

					<tr class="table_content">
						<td>${m.memberId }</td>
						<td>${m.name }</td>
						<td>${m.nickName }</td>
						<td>${m.email }</td>
						<td>${m.level }</td>
						<td>${m.edate }</td>
						<td class="onofftd"><c:if test="${m.onOff =='Y' }">
							활성화
							<p>
									<a href="#ex1" rel="modal:open" class="offBtn"><button
											type="button">비활성화</button></a>
							</p>
								<!--  <button type="button" class="offBtn" data-target="#mymyModalOne" data-toggle="modal">비활성화</button>  -->
							</c:if> <c:if test="${m.onOff == 'N' }">
							비활성화
							<button type="button" class="onBtn">활성화</button>
							</c:if> <input type="hidden" id="memberId" value="${m.memberId }" /></td>
						<td class="reasontd">
							<button type="button" class="reason">사유 확인</button>
						</td>
					</tr>

				</c:forEach>

			</table>

			<div class="btnContent">
				<div class="pagination" id="pagination"></div>
			</div>
		</div>
	</div>
</div>



<div id="ex1" class="modal">
	<textarea rows="10" cols="61" class="offContent">								
					</textarea>
	<p class="closeP">
		<a href="#ex1" class="offUpdate" onclick="offUpdate()"
			rel="modal:close"><button type="button">비활성화</button></a>
	</p>

	<a href="#" onclick="modalClose()" class="modalClose" rel="modal:close">닫기</a>

</div>


<div id="modal" class="searchModal">
	<div class="search-modal-content">
		<div class="page-header">
			<h1>정지사유</h1>
		</div>
		<div class="row">
			<div class="col-sm-12" style="margin: 17px 0;">
				<div class="row">
					<div class="col-sm-12" style="height: 11vw;">
						<p class="reason_content"></p>
					</div>
				</div>
			</div>
		</div>
		<hr style="margin: 9px 0;">
		<div class="reason_close"
			style="cursor: pointer; background-color: #DDDDDD; text-align: center; padding-bottom: 10px; padding-top: 10px;"
			onClick="closeModal();">
			<span class="pop_bt modalCloseBtn" style="font-size: 13pt;">닫기
			</span>
		</div>
	</div>
</div>








<script>
jQuery(document).ready(function () {
	
	});
	function closeModal() {
	$('.searchModal').hide();
	};



	$(".reason").click(function(){
		
		var id = $(this).parents("td").prev().children("input").val();
		
		$.ajax({
			type : 'POST',
			url : "${path}/member/reason",
			data : {"id":id},
			dataType : "text",
			success:function(data){
				$(".reason_content").html(data);
			},
			error:function(request,status,error){
			    console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);


			},
			contentType: "application/x-www-form-urlencoded; charset=UTF-8"

		}); 
		$("#modal").show();
	})
		
	

	function modalClose(){
		$(".offContent").val("");
	}

	 $(".onBtn").click(function(){
		onscop = $(this).parents(".onofftd");
		var id = $(this).next().val();
		
		memberOn(id);
	 });
 
	 function memberOn(id){
		 
		 $.ajax({
			 type : 'POST',
			 url : "${path}/member/on",
			 data : {"id":id},
			 dataType : "JSON",
			 success:function(data){
				 if(data == 1){
					 onscop.html("활성화" + "<p><a href='#ex1' rel='modal:open' class='offBtn'><button type='button'>비활성화</button></a></p>");
				 }
				 
			 }
		 })
		 
	 }


	 $(".offBtn").click(function(){
		scop = $(this).parents(".onofftd");
		
		/* var id = $(this).next().val(); */
		offSetId = $(this).parents("p").next().val();
		var t = $(this).parents("p").next().val();
		
		/* offUpdate(id);  */
		
	}); 
 
 
 
 	function offUpdate(){
 		var content = $(".offContent").val();
 		var tcontent = content.trim(); 		
 		memberOff(tcontent);
 		$(".offContent").val("");
 	}
 
 
  function memberOff(tcontent){
	 
	 var content = $(".offContent").val();
	 console.log(content.trim());
	/*  var tcontent = content.trim(); */
	  $.ajax({
			type : 'POST',
			url : "${path}/member/off",
			data : {"id":offSetId,"content":tcontent},
			dataType : "JSON",
			success:function(data){
				if(data == 1){
					
					 scop.html("비활성화"+"<button type='button' class='onBtn'>활성화</button>"); 
								
				}
			}
			
		}); 
 }


//만들어진 테이블에 페이지 처리

	function page(){ 
	
	$('table.paginated').each(function() {
	
	var pagesu = 10;  //페이지 번호 갯수
	
	var currentPage = 0;
	
	var numPerPage = 10;  //목록의 수
	
	var $table = $(this);    
	
	var pagination = $("#pagination");
	
	
	//length로 원래 리스트의 전체길이구함
	
	var numRows = $table.find('tbody tr').length;
	
	
	//Math.ceil를 이용하여 반올림
	
	var numPages = Math.ceil(numRows / numPerPage);
	
	
	//리스트가 없으면 종료
	
	if (numPages==0) return;
	
	
	
	//pager라는 클래스의 div엘리먼트 작성
	
	var $pager = $('<div class="pager"></div>');
	
	var nowp = currentPage;
	
	var endp = nowp+10;
	
	
	//페이지를 클릭하면 다시 셋팅
	
	$table.bind('repaginate', function() {
	
	//기본적으로 모두 감춘다, 현재페이지+1 곱하기 현재페이지까지 보여준다
	
	$table.find('tbody tr').hide().slice(currentPage * numPerPage, (currentPage + 1) * numPerPage).show();
	
	$("#pagination").html("");
	
	
	
	if (numPages > 1) {     // 한페이지 이상이면
	
	if (currentPage < 5 && numPages-currentPage >= 5) {   // 현재 5p 이하이면
	
	nowp = 0;     // 1부터 
	
	endp = pagesu;    // 10까지
	
	}else{
	
	nowp = currentPage -5;  // 6넘어가면 2부터 찍고
	
	endp = nowp+pagesu;   // 10까지
	
	pi = 1;
	
	}
	
	if (numPages < endp) {   // 10페이지가 안되면
	
	endp = numPages;   // 마지막페이지를 갯수 만큼
	
	nowp = numPages-pagesu;  // 시작페이지를   갯수 -10
	
	}
	
	if (nowp < 1) {     // 시작이 음수 or 0 이면
	
	nowp = 0;     // 1페이지부터 시작
	
	}
	
	}else{       // 한페이지 이하이면
	
	nowp = 0;      // 한번만 페이징 생성
	
	endp = numPages;
	
	}
	
	
	// [처음]
	
	$('<span class="pageNum first">처음</span>').bind('click', {newPage: page},function(event) {
	
	currentPage = 0;   
	
	$table.trigger('repaginate');  
	
	$($(".pageNum")[2]).addClass('active').siblings().removeClass('active');
	
	}).appendTo(pagination).addClass('clickable');
	
	
	
	// [이전]
	
	$('<span class="pageNum back">이전</span>').bind('click', {newPage: page},function(event) {
	
	if(currentPage == 0) return; 
	
	
	currentPage = currentPage-1;
	
	$table.trigger('repaginate'); 
	
	$($(".pageNum")[(currentPage-nowp)+2]).addClass('active').siblings().removeClass('active');
	
	}).appendTo(pagination).addClass('clickable');
	
	
	// [1,2,3,4,5,6,7,8]
	
	for (var page = nowp ; page < endp; page++) {
	
	$('<span class="pageNum"></span>').text(page + 1).bind('click', {newPage: page}, function(event) {
	
	currentPage = event.data['newPage'];
	
	$table.trigger('repaginate');
	
	$($(".pageNum")[(currentPage-nowp)+2]).addClass('active').siblings().removeClass('active');
	
	}).appendTo(pagination).addClass('clickable');
	
	} 
	
	
	
	// [다음]
	
	$('<span class="pageNum next">다음</span>').bind('click', {newPage: page},function(event) {
	
	if(currentPage == numPages-1) return;
	
	
	currentPage = currentPage+1;
	
	$table.trigger('repaginate'); 
	
	$($(".pageNum")[(currentPage-nowp)+2]).addClass('active').siblings().removeClass('active');
	
	}).appendTo(pagination).addClass('clickable');
	
	
	// [끝]
	
	$('<span class="pageNum last">끝</span>').bind('click', {newPage: page},function(event) {
	
	currentPage = numPages-1;
	
	$table.trigger('repaginate');
	
	$($(".pageNum")[endp-nowp+1]).addClass('active').siblings().removeClass('active');
	
	}).appendTo(pagination).addClass('clickable');
	
	
	$($(".pageNum")[2]).addClass('active');
	
	});
	
	
	$pager.insertAfter($table).find('span.pageNum:first').next().next().addClass('active');   
	
	$pager.appendTo(pagination);
	
	$table.trigger('repaginate');
	
	});
	
	}
	
	
	
	$(function(){
	
	// table pagination
	
	page();
	
	});


</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
