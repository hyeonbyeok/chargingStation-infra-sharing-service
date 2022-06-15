<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../include/head.jsp"></jsp:include>
<link rel="stylesheet" href="/css/mypageupdate.css">
<script>

document.title = "내정보 변경";

$(function(){
	// 회원가입 서브밋 전 정규식및 양식 확인
	$("#mypage_btn").on("click", function() {
		var regex_id = /^[a-z]+[a-z0-9]{4,19}$/g;
		var regex_tel = /^01(?:0|1|[6-9])(?:\d{3}|\d{4})\d{4}$/;
		var regex_email = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
        
		if($("#name").val() == ""){
			$("#name").focus();
			$("#name_msg").text("이름을 입력해주세요");
			$("#name_msg").css("color","red");
			return;
		}
		if($("#tel").val() == ""){
       	 $("#tel").focus();
            $("#tel_msg").text("전화번호를 입력해주세요");
            $("#tel_msg").css("color","red");
            return;
         }
		if(!regex_tel.test($("#tel").val())){
			$("#tel").focus();
			$("#tel_msg").text("- 을 뺀 숫자만 적어주세요");
			$("#tel_msg").css("color","red");
			return;
		}
		if(!regex_email.test($("#email").val())){
       	 $("#email").focus();
            $("#email_msg").text("이메일 양식이 이상합니다.");
            $("#email_msg").css("color","red");
            return;
        }
        
        if($("#email").val() == ""){
            $("#email").focus();
            $("#email_msg").text("이메일을 입력해주세요");
            $("#email_msg").css("color","red");
            return;
         }
        
		$("#update").submit();
	});
})
</script>
</head>
<body>
	<div id="wrap">
		<div id="container">
		
		<div class="main_gaza">
			<a href="../../../">
				<span>로고</span>
			</a>
		</div>
				<form method="post" id="update">
					<div class="user_wrap">
						<label>아이디</label>
						<div class="div_id">
							<input type="text" id="id" name="id" value="${member.id}" readonly="readonly">
						</div>
					</div>
					<div class="user_wrap">
						<label>이름</label>
						<div class="div_id">
						<input type="text" id="name" name="name" value="${member.name}">
						</div>
						<div>
							<label id="name_msg"></label>
						</div>
					</div>
					<div class="user_wrap">
						<label>전화번호</label>
						<div class="div_id">
						<input type="text" id="tel" name="tel" value="${member.tel}" placeholder="- 뺀 숫자만 입력 해 주세요" >
						</div>
						<div>
							<label id="tel_msg"></label>
						</div>
					</div>
					<div class="user_wrap">
						<label>이메일</label>
						<div class="div_id">
						<input type="text" id="email" name="email" value="${member.email}" >
						</div>
						<div>
							<label id="email_msg"></label>
						</div>
					</div>
					<div class="btn_wrap">
						<button type="button" id="mypage_btn">회원정보수정</button>
					</div>
					<div class="dejavu">
						<a href="/mypage/">이전으로</a>
					</div>
				</form>
		</div>
		
		
	</div>
	
	<jsp:include page="../include/body.jsp"></jsp:include>
</body>
</html>