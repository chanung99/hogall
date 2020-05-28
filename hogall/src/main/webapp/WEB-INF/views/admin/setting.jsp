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
	div#main{
		width: 1360px;
		margin: 0 auto;
	}
	div#member_management{
		width: 1160px;
		margin: 0 auto;
	}
	div#memberTblWrap{
		width: 1060px;
		margin: 0 auto;
	}
	div#memberTblWrap table tr th{
		padding: 5px 20px;
	}
	div#memberTblWrap table tr td{
		padding: 5px 20px;
	}
	.btnContent{
		margin-top: 33px;
	}
	.pagination{
		margin: 0 auto;
		width: 400px;
	}
	.pagination .pageNum{
		padding: 3px 8px;
	}
	.table_subject{
		background-color: #CECED1;
		
	}
	
	textarea{
		resize: none;
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
						<td>
						<c:if test="${m.onOff =='Y' }">
							활성화
							<button type="button" class="offBtn" data-target="#mymyModalOne" data-toggle="modal">비활성화</button>
							
						</c:if>
						<c:if test="${m.onOff == 'N' }">
							비활성화
							<button type="button" id="onBtn">활성화</button>
						</c:if>
						<input type="hidden" id="memberId" value="${m.memberId }"/>
						
						</td>
						<td> <button type="button">사유 확인</button></td>
					</tr>

				</c:forEach>

			</table>

			<div class="btnContent">
				<div class="pagination" id="pagination"></div>
			</div>
		</div>
	</div>
</div>

				<div class="modal fade" id="mymyModalOne" role="dialog">
					<div class="modal-dialog">

						<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header">
								<h4 class="modal-title">정지사유 작성</h4>
								<button type="button" class="close" data-dismiss="modal">×</button>
							</div>
							<div class="modal-body">
								<textarea rows="10" cols="51" class="offContent">
								
								
								</textarea>
							</div>
							<div class="modal-footer">
								<button onclick="memberOff()" type="button" class="btn btn-default">확인</button>
							
								<button type="button" class="btn btn-default"
									data-dismiss="modal">닫기</button>
							</div>
						</div>

					</div>
				</div>
				
				<div class="modal fade" id="mymyModalOne" role="dialog">
					<div class="modal-dialog">

						<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header">
								<h4 class="modal-title">입찰자 목록</h4>
								<button type="button" class="close" data-dismiss="modal">×</button>
							</div>
							<div class="modal-body">
								
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">닫기</button>
							</div>
						</div>

					</div>
				</div>






<script>
 $(".offBtn").click(function(){
	
	var id = $(this).next().val();
	
	memberOff(id);
}); 

 function memberOff(id){
	 
	 var content = $(".offContent").val();
	 console.log(content.trim());
	 var tcontent = content.trim();
	  $.ajax({
			type : 'POST',
			url : "${path}/member/off",
			data : {"id":id,"content":tcontent},
			dataType : "JSON",
			success:function(data){
				
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
