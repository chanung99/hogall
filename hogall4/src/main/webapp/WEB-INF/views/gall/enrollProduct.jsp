<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${path}/resources/css/style.css" />

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="Hello Spring" name="title" />
</jsp:include>

<style>
div#main {
	margin: 20px auto 0;
	width: 1420px;
}

div.subjectWrap {
	width: 730px;
}

input#subject {
	width: 320px;
	border: 1px solid #dbdbdb;
}
input[type="text"]{
	border: 1px solid #dbdbdb;
}
textarea{
	border: 1px solid #dbdbdb;
}

section.container>article {
	padding: 33px 68px 40px;
}

div.contentWrap {
	width: 930px;
	margin-top: 32px;
}

textarea#content {
	resize: none;
}

div.fileNone {
	display: none;
}

div.fileContainer {
	margin-top: 15px;
}

div.submitContainer {
	text-align: center;
	margin-top: 30px;
	
}
div.submitContainer input{
	padding: 7px 25px;
	width: 150px;
	height: 50px;
	color: #ffffff;
	background-color: #3a3d42;
	border: 0px;
}

section.container>article {
	width: 863px;
}

.ppap {
	padding: 10px 10px 25px;
}

#preview img {
	width: 100px;
	height: 100px;
}

#preview p {
	text-overflow: ellipsis;
	overflow: hidden;
}

.preview-box {
	border: 1px solid;
	padding: 5px;
	border-radius: 2px;
	margin-bottom: 10px;
}

.table_box .enroll_table {
	width: 100%;
	border-top: 1px solid #000000;
}

.table_box .enroll_table th{
	padding: 7px 25px;
	width: 200px;
	background-color: #F2F2F5;
	border-bottom: 1px solid #dbdbdb;
	text-align: center;
	border-right: 1px solid #dbdbdb;
}

.money_table{
	width: 100%;
}
.money_table th{
	padding: 7px 25px;
	width: 200px;
	text-align: center;
	background-color: #F2F2F5;
	border-bottom: 1px solid #dbdbdb;
	border-right: 1px solid #dbdbdb;
}

table td{
	padding: 7px 25px;
	
}
.container{
	width: 1160px;
	max-width: 1140px;
	margin: 0 auto;
}
tr td button{
	background-color: #ffffff;
	border: 1px solid #000000;
	padding: 1px 5px;
}
.nowTr{
	
}
</style>


<div id="main">
	<section class="container">
		<div style="margin: 0 auto; width: 90%;">
			<h3>상품 등록</h3>
		</div>
		<article>
			
			<form action="${pageContext.request.contextPath }/gall/enrollProductEnd.do" id="form" name="form" onsubmit="date();" enctype="multipart/form-data" method="post">
				<div class="title">
					<h5>상품 정보</h5>
				</div>
			
				<div class="table_box">
					<table class="enroll_table">
						<tr>
							<th>제목</th>
							<td><input type="text" id="subject" name="productName"/></td>
						</tr>
						
						<tr>
							<th>물품설명</th>
							<td><textarea cols="60" rows="14" id="content" name="productContent"></textarea></td>
						</tr>
						
						<tr>
							<th>파일 선택</th>
							<td>
								<button type="button" onclick="fileBtn()">파일 선택</button>
								<button type="button" onclick="thumbnail()">썸네일 선택</button>
							</td>
						</tr>						
						
					</table>
					
					<table class="money_table">
					
						<tr>
							<th>경매시작가</th>
							<td><input type="text" name="priceStart" id="priceStart"/></td>
						</tr>
						
						<tr>
							<th>경매가 단위</th>
							<td><input type="text" name="unit" id="unit"/></td>
						</tr>
						
						<tr>
							<th>즉시구매여부</th>
							<td><input type="checkbox" id="nowBuyCheck"/></td>
						</tr>
						
						<tr class="nowTr">
							<th>즉시구매가</th>
							<td><input type="text" name="buyNowPrice" id="buyNowPrice"/></td>
						</tr>
						
						<tr>
							<th>안전거래</th>
							<td>
								<input type="checkbox" id="escrow" value="HOGALL"/>
							</td>
						</tr>
						
						<tr class="esTr">
							<th>부담자</th>
							<td>
							판매자 부담:<input type="radio" name="comm" id="seller" value="seller"/>
							구매자 부담 :<input type="radio" name="comm" id="buyer" value="buyer"/>
							
							</td>
						</tr>
						<tr>
							<th>경매 마감 날짜</th>
							<td><input type="date" name="closingDate3" id="closingDate"/> 시간 : <input type="time" id="closingTime" name="closingTime"/>
							<input type="hidden" id="closing" name="closingDate"/>
							</td>
						</tr>
					
					</table>
				</div>

				 <div id="dataBox">
					<input type="hidden" id="nowCheck" name="buyNowWhether"/> <!-- 즉시구매여부 -->
					<input type="hidden" id="typeCheck" name="productEnrollType"/>
					<input type="hidden" id="commition" name="commition"/>
				</div>
					
					
				<div class="fileNone">
					<input type="file" name="file" id="file00" /> 
					<input type="file" name="file" id="file01" /> 
					<input type="file" name="file" id="file02" /> 
					<input type="file" name="file" id="file03" /> 
					<input type="file" name="file" id="file04" /> 
					<input type="file" name="file" id="file05" /> 
					<input type="file" name="file" id="file06" />
					<input type="file" name="file" id="file07" /> 
					<input type="file" name="file" id="file08" /> 
					<input type="file" name="file" id="file09" /> 
					<input type="file" name="file" id="file10" /> 
					<input type="file" name="file" id="file11" /> 
					<input type="file" name="file" id="file12" /> 
					<input type="file" name="file" id="file13" /> 
					<input type="file" name="file" id="file14" /> 
					<input type="file" name="file" id="file15" />
					
					<input type="file" name="upfile" id="upfile"/>
				</div>
				<div class="none">
					<input type="hidden" id="category" name="productCategory"
						value="${category }" />
				</div>
				
				<input type="hidden" id="memberId" name="productOwner" value="${loggedMember.memberId }" />
				
				<div class="submitContainer">
					<input type="submit" value="등록하기" />
				</div>

				
				
				<img width="300px;" height="300px;" id="priview"/>
			</form>
		</article>
	</section>
</div>

<script>

	$(function(){
		$(".nowTr").css("display","none");
		$(".esTr").css("display","none");
		
	});
	

	$("#nowBuyCheck").click(function(){
		var now = $("#nowBuyCheck").prop("checked");
		console.log(now);
		if(now==true){
			$(".nowTr").css("display","");
		}else if(now==false){
			$(".nowTr").css("display","none");
		}
		
	});
	
	$("#escrow").click(function(){
		var es = $("#escrow").prop("checked");
		console.log(es);
		if(es==true){
			$(".esTr").css("display","");
		}else if(es==false){
			$(".esTr").css("display","none");
		}
	});
	
	
	var sel_file;
	
	$(document).ready(function(){
		$("[name=file]").on("change",handleImageFileSelect);
		
	});
	
	function handleImageFileSelect(e){
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		
		filesArr.forEach(function(f){
			if(!f.type.match("image.*")){
				alert("이미지만 업로드가 가능합니다.");
				return;
			}
			
			sel_file = f;
			
			var reader = new FileReader();
			reader.onload = function(e){
				$("#priview").attr("src",e.target.result);
			}
			reader.readAsDataURL(f);
			
		});
	}
	
	function gg(){
		
	}


	function thumbnail(){
		$("#upfile").click();
		
	}
	
	function date(){
		var sel = $("#seller");
		var buy = $("#buyer");
		
		var selCheck =sel.is(":checked");
		var buyCheck =buy.is(":checked");
		
		if(selCheck){
			$("#commition").val("seller");
		}
		
		if(buyCheck){
			$("#commition").val("buyer");
		}
		
		if(!selCheck&&!buyCheck){
			$("#commition").val("N");
		}
		
		
		var nowBuyCheck = $("#nowBuyCheck");
		
		var c=$(nowBuyCheck).prop("checked");
		
		if(c){
			$("#nowCheck").val("Y");
		}else{
			$("#nowCheck").val("N");	
		}
		
		var type=$("#escrow");
		
		var t=$(type).prop("checked");
		
		if(t){
			$("#typeCheck").val("HOGALL");
		}else{
			$("#typeCheck").val("USER");
		}
		
		
		
		var d=$("#closingDate").val();
		var yyyy = d.substr(0,4);
		var mm = d.substr(5,2);
		var dd = d.substr(8,2);
		console.log(d);
		var date = new Date(yyyy,mm,dd);
		
		$("#closing").val(date);
		var c= $("#closing").val();
		
		
		
		
	}

	/* $("[name=file]").change(function(){
		var fileCheck = $("#file00").val(); 
		if(fileCheck){ //파일이 선택되어있으면
			$("#file01").click();
		}  
	
			
	}); */

	function fileBtn() {
		var fileCheck00 = $("#file00").val();
		var fileCheck01 = $("#file01").val();
		var fileCheck02 = $("#file02").val();
		var fileCheck03 = $("#file03").val();
		var fileCheck04 = $("#file04").val();
		var fileCheck05 = $("#file05").val();
		var fileCheck06 = $("#file06").val();
		var fileCheck07 = $("#file07").val();
		var fileCheck08 = $("#file08").val();
		var fileCheck09 = $("#file09").val();
		var fileCheck10 = $("#file10").val();
		var fileCheck11 = $("#file11").val();
		var fileCheck12 = $("#file12").val();
		var fileCheck13 = $("#file13").val();
		var fileCheck14 = $("#file14").val();
		var fileCheck15 = $("#file15").val();

		if (!fileCheck00) {
			$("#file00").click();
		} else if (fileCheck00 && !fileCheck01) {
			$("#file01").click();
		}
		if (fileCheck01 && !fileCheck02) {
			$("#file02").click();
		}
		if (fileCheck02 && !fileCheck03) {
			$("#file03").click();
		}
		if (fileCheck03 && !fileCheck04) {
			$("#file04").click();
		}
		if (fileCheck04 && !fileCheck05) {
			$("#file05").click();
		}
		if (fileCheck05 && !fileCheck06) {
			$("#file06").click();
		}
		if (fileCheck06 && !fileCheck07) {
			$("#file07").click();
		}
		if (fileCheck07 && !fileCheck08) {
			$("#file08").click();
		}
		if (fileCheck08 && !fileCheck09) {
			$("#file09").click();
		}
		if (fileCheck09 && !fileCheck10) {
			$("#file10").click();
		}
		if (fileCheck10 && !fileCheck11) {
			$("#file11").click();
		}
		if (fileCheck11 && !fileCheck12) {
			$("#file12").click();
		}
		if (fileCheck12 && !fileCheck13) {
			$("#file13").click();
		}
		if (fileCheck13 && !fileCheck14) {
			$("#file14").click();
		}
		if (fileCheck14 && !fileCheck15) {
			$("#file15").click();
		}

	}
</script>



<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
