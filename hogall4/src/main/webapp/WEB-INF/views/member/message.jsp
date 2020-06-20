<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<c:set var="path" value="${pageContext.request.contextPath}" />
<head>
<meta charset="UTF-8">
<title>쪽지함</title>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>

<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
</head>
<style>

body{
	margin: 0;
	font-family: 'Noto Sans KR', sans-serif;
	overflow-y: hidden; overflow-x: hidden;

	
}
ul{
	padding: 0;
}
#messageContainer {
	border: 1px solid #444444;
	width: 520px;
}

#messageContainer table td {
	border-top: 1px dashed #444444;
	border-bottom: 1px dashed #444444;
}

#messageContainer table th {
	border-top: 1px dashed #444444;
	border-bottom: 1px dashed #444444;
	font-size: 13px;
}

#messageContainer table {
	border-collapse: collapse;
	width: 100%;
	border-left: 1px solid #444444;
	border-right: 1px solid #444444;
}

#messageContainer table th {
	width: 145px;
	background-color: #F2F2F2;
}

#messageContainer table textarea {
	width: 90%;
	height: 200px;
}

#messageContainer .value {
	padding: 7px 2px 4px 19px;
}
.messageMenu ul{
	margin: 0;
}
.messageMenu ul li:nth-child(n+2){
	/* padding: 3px 11px 3px 6px; */
	/* border-top: 1px dotted #444444; */
}

li{
	list-style: none;
}
.messageContent{
	width: 530px;
	float: left;
}
.messageMenu{
	float: left;
	margin-right: 50px;
	height: 100vh;
	border-right: 2px solid #e7e7e7;
}
a{
	text-decoration: none;
	color: #74797b;
}
.messageMenu ul li{
	text-align: center;
	font-size: 11px;
	padding: 9px;
}
.messageMenu ul li:nth-child(1){
	background-color: #98b0bf;
	color : #ffffff;
	/* border-left: 0.5px solid #ffffff; */
	border-radius: 1px;
}
.messageMenu ul li:nth-child(2){
	border-top : 1px solid #f4f4f4;
	border-bottom: 1px solid #f4f4f4;
}
.messageMenu ul li:nth-child(3){
	border-top : 1px solid #f4f4f4;
	border-bottom: 1px solid #f4f4f4;
}

a:visited {
	color: #74797b;
}
h3{
	margin: 0
}
table { border-collapse:collapse; }  
/* th, td { border:1px solid black; }
 */
.messageTable tr.messageTableTr td:nth-child(2){
	width: 100vw;
	position: relative;
}
.messageTable tr.messageTableTr .firstTd{
	font-size: 11px;
	width: 10vw;
	padding: 9px;
	text-align: center;
	border-bottom: 1px solid #f4f4f4;
	border-right: 1px solid #e7e7e7;
}
.messageTable tr.messageTableTr:nth-child(1) td:nth-child(1) {
	background-color: #98b0bf;
	color: #ffffff;
	border-left: 1px solid #ffffff; 
}
.messageTable tr.messageTableTr:nth-child(1) td{
	border-bottom: 1px solid #f4f4f4;
}
.messageTable tr.messageTableTr:nth-child(1) td:nth-child(2){
	background-color : #E2E2E2;
	
}
.messageTable tr.messageTableTr:nth-child(5) td{
	height: 100vh;
}
.messageTable tr.messageTableTr:nth-child(5) td div{
	position: absolute;
	bottom: 0;
}
.innerTable{
	position: absolute;
	top: 0;
}

.innerTable tr, .innerTable td{
	border:1px solid black;
}
table.innerTable tr:nth-child(1) td {
	font-size: 15px;
	text-align: left;
}  
</style>

<div id="main">
	<table class="messageTable">
		<tr class="messageTableTr">
			<td class="messageTableTd firstTd"><h3>쪽지함</h3></td>
			<td class="messageTableTd"></td>
		</tr>
		<tr class="messageTableTr">
			<td class="messageTableTd firstTd"><a href="${path }/member/messagePage?forder=write&id=${loggedMember.memberId}">쪽지 보내기</a></td>
			<td class="messageTableTd" rowspan="3">
				<c:if test="${forder == 'write' }">
					<table class="innerTable">
						<tr>
							<td colspan="2"><p>쪽지보내기</p></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
						</tr>
					</table>
				</c:if>
			</td>
		</tr>
		<tr class="messageTableTr">
			<td class="messageTableTd firstTd"><a href="${path }/member/messagePage?forder=Receive&id=${loggedMember.memberId}">받은 쪽지함</a></td>
		</tr>
		<tr class="messageTableTr">
			<td class="messageTableTd firstTd"><a href="${path }/member/messagePage?forder=call&id=${loggedMember.memberId}">보낸 쪽지함</a></td>
		</tr>
		<tr class="messageTableTr">
			<td class="messageTableTd firstTd"><div><button type="button">창닫기</button></div></td>
		</tr>
		 
		
	</table>

	<%-- <div class="messageMenu">
		<ul>
			<li><h3>쪽지함</h3></li>
			<li><a href="${path }/member/messagePage?forder=write&id=${loggedMember.memberId}">쪽지 보내기</a></li>
			<li><a href="${path }/member/messagePage?forder=Receive&id=${loggedMember.memberId}">받은 쪽지함</a></li>
			<li><a href="${path }/member/messagePage?forder=call&id=${loggedMember.memberId}">보낸 쪽지함</a></li>
		</ul>
	
	</div>
	
	<div class="messageContent">
		<c:if test="${forder == 'write'}">
			<form method="POST" action="${path }/member/message" onsubmit="return messageGo()">
				<p>${loggedMember.memberId }님의 쪽지쓰기 입니다.</p>
				<input type="hidden" name="caller" value="${loggedMember.memberId }"/>
				<input type="hidden" name="meNo" value="0"/>
				<div id="messageContainer">
				
					<table>
						<tr>
							<th>받는사람</th>
							<td class="value"><input type="text" value="${memberId }" name="receiver" /></td>
						</tr>
						<tr>
							<th>쪽지제목</th>
							<td class="value"><input type="text" id="messageSubject" name="meSubject"/></td>
						</tr>
						<tr>
							<th>쪽지내용</th>
							<td class="value"><textarea name="meContent" rows="" cols="">
						
						</textarea></td>
						</tr>
					</table>
					<button type="submit">쪽지 보내기</button>
				</div>
				<input type="hidden" name="pathurl" id="pathurl" value=""/>
			</form>
		</c:if> --%>
		
		<c:if test="${forder == 'Receive' }">
		<p>${loggedMember.memberId }님의 받은 쪽지함입니다.</p>
			<div class="messageList">
			
				<table>
					<tr>
						<th><input type="checkbox"/></th>
						<th>제목</th>
						<th>보낸사람</th>
						<th>날짜</th>
					</tr>
					
					<c:forEach items="${receiver }" var="r">
						<tr>
							<td><input type="checkBox"/></td>
							<td>${r.meSubject }</td>
							<td>${r.caller }</td>
							<td>${r.callDatee }</td>
						</tr>
						
					</c:forEach>
				</table>
				
			</div>
		</c:if>
		
		<c:if test="${forder == 'call' }">
		<p>${loggedMember.memberId }님의 보낸 쪽지함입니다.</p>
			<div class="messageList">
				<table>
					<tr>
						<th><input type="checkbox"/></th>
						<th>제목</th>
						<th>받은사람</th>
						<th>날짜</th>
					</tr>
					<c:forEach items="${caller }" var="c">
						<tr>
							<td><input type="checkBox"/></td>
							<td>${c.meSubject }</td>
							<td>${c.receiver }</td>
							<td>${c.callDatee }</td>
						</tr>
					</c:forEach>
				</table>
				
			</div>
		</c:if>
	</div>

</div>

<script>
	function fnReturn(str){
	 var wNm = window.name;
	 opener.document.getElementById(wNm).value = str;
	 window.close();
	} 

	$(function(){
		
	})

	function messageGo(){
		var link = document.location.href; 


		var spl = link.split('7081/gall');/* 주의!!!! 나중에 shop/gall로 수정할것 */
		$("#pathurl").val(spl[1]);
		
	}
</script>

