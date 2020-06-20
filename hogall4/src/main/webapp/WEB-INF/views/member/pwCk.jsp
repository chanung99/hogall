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
	#main{
		width: 1360px;
		margin: 0 auto;
	}
	.pwCk_wrap{
		width: 600px;
		margin: 50px auto;
	}
	.pwCk_subject{
		margin: 22px auto;
		width: 500px;
	}
	.pwCk_box{
		width: 500px;
		margin: 0 auto;
	}
	.pwCk_text{
		float: left;
	}
	.pwCk_btn{
		float: left;
	}
	#pwCk{
		width: 300px;
		height: 40px;
	}
	.pwCk_btn button{
		height: 40px;
	}
</style>


<div id="main">
	<div class="pwCk_wrap">
		<div class="pwCk_subject">
			<span>본인확인을 위해 비밀번호를 한번 더 입력해주세요.</span>
		</div>
		<div class="pwCk_box">
			<form method="post" action="${pageContext.request.contextPath }/member/change" onsubmit="return pwCk();">
				<div class="pwCk_text">
					<input type="password" id="pwCk" name="pwCk"/>
				</div>
				<input type="hidden" name="id" value="${loggedMember.memberId }"/>
				<div class="pwCk_btn">
					<button type="submit">비밀번호 확인</button>
				</div>
				
			</form>	
		</div>
	</div>
</div>

<script>
	function pwCk(){
		var pw = $("#pwCk").val();
		
		if(pw.length<1){
			alert("비밀번호를 입력해주세요.");
			return false;
		}
		
	}
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>