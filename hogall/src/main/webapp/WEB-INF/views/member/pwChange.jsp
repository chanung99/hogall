<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="" name="title" />
</jsp:include>
<style>
	div#main{
		width: 1460px;
		margin : 0 auto;
	}
	div.infor_wrap{
		width: 1240px;
		margin: 0 auto;
	}
	div.inforTable_box{
		width: 950px;
		margin: 0 auto;
	}
	.infor_table{
		margin: 0 auto;
		width: 100%;
		border-top: 1px solid #000000;
	}
	.infor_table th{
		padding: 7px 25px;
		width: 200px;
		height: 45px;
		background-color: #F2F2F5;
	}
	.infor_table td{
		padding: 7px 25px;
		height: 45px;
	}
	.infor_table td input{
		width: 44%;
		height: 28px;
	}
	#searchZip{
		margin-left: 9px;
	}
	.sub_box{
		margin-top : 33px;
		text-align: center;
	}
	.sub_box button{
		width: 200px;
		padding: 7px 25px;
		background-color: #ffffff;
		border: 1px solid #000000;
	}
	td button{
	background-color: #ffffff;
		border: 1px solid #000000;
		padding: 5px 15px;
	}
</style>

<div id="main">
	<div class="infor_container">
		<div class="infor_wrap">
			<div class="inforTable_box">
				<h5>개인정보 변경</h5>
				<form method="post" action="${path }/member/inforChange">
					<table class="infor_table">
						<tr>
							<th>아이디</th>
							<td><input type="text" id="id" name="memberId" value="${loggedMember.memberId }" readonly/></td>
						</tr>
						
						<tr>
							<th>비밀번호</th>
							<td><button type="button">비밀번호 변경</button></td>
						</tr>
						
						<tr>
							<th>이름</th>
							<td><input type="text" name="name" id="name" value="${loggedMember.name }"/></td>
						</tr>
						
						<tr>
							<th>닉네임</th>
							<td><input type="text" name="nickName" value="${loggedMember.nickName }"/></td>
						</tr>
						
						<tr>
							<th>이메일</th>
							<td><input type="email" id="email" name="email" value="${loggedMember.email }"/></td>
						</tr>
						
						<tr>
							<th>우편번호</th>
							<td><input type="text" id="sample4_postcode" name="zipCode" value="${loggedMember.zipCode }"/><button type="button" id="searchZip" onclick="sample4_execDaumPostcode()">우편번호 검색</button></td>
						</tr>
						
						<tr>
							<th>주소</th>
							<td><input type="text" id="sample4_roadAddress" name="address" value="${loggedMember.address }"/></td>
						</tr>
						
						<tr>
							<th>상세주소</th>
							<td><input type="text" id="detailAddress" name="detailAddress" value="${loggedMember.detailAddress}"/></td>
						</tr>
					</table>
					<div class="sub_box">
						<button type="submit">변경</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<script>



function sample4_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample4_postcode').value = data.zonecode;
            document.getElementById("sample4_roadAddress").value = roadAddr;
            //document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
            
            // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
           /*  if(roadAddr !== ''){
                document.getElementById("sample4_extraAddress").value = extraRoadAddr;
            } else {
                document.getElementById("sample4_extraAddress").value = '';
            } */

           /*  var guideTextBox = document.getElementById("guide");
            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
            if(data.autoRoadAddress) {
                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                guideTextBox.style.display = 'block';

            } else if(data.autoJibunAddress) {
                var expJibunAddr = data.autoJibunAddress;
                guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                guideTextBox.style.display = 'block';
            } else {
                guideTextBox.innerHTML = '';
                guideTextBox.style.display = 'none';
            } */
        }
    }).open();
}
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>