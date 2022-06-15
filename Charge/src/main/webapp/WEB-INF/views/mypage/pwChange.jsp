<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../include/head.jsp"></jsp:include>
<link rel="stylesheet" href="/css/pwChange.css">
<script>
	$(function(){
	      $("#change_pw").on("keyup",function(){
	          const regex_pw = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
	          
	          if(regex_pw.test($("#change_pw").val())){
	             $("#change_pw_msg").text("사용 가능한 비밀번호 입니다.");
	             $("#change_pw_msg").css("color","green");
	          }
	          else if(!regex_pw.test($("#change_pw").val())){
	             $("#change_pw").focus();
	             $("#change_pw_msg").text("(특수문자, 문자, 숫자 포함 형태의 8~15자리 이내)");
	             $("#change_pw_msg").css("color","red");
	          }
	       });
	      $("#change_pw_cf").on("keyup",function(){
	          if($("#change_pw_cf").val() == $("#change_pw").val()){
	             $("#change_pw_cf_msg").text("비밀번호가 서로 일치합니다.");
	             $("#change_pw_cf_msg").css("color","green");
	          }else if($("#change_pw_cf").val() != $("#change_pw").val()){
	             $("#change_pw_cf_msg").text("비밀번호가 서로 일치하지 않습니다.");
	             $("#change_pw_cf_msg").css("color","red");
	          }
	       });         
		$("#changePwBtn").on("click",function(){
			const regex_pw = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
				if($("#now_pw").val() == ""){
		            $("#now_pw").focus();
		            $("#now_pw_msg").text("비밀번호를 입력 해 주세요");
		            $("#now_pw_msg").css("color","red");
		            return;
		         }
				
				if($("#change_pw").val() == ""){
		            $("#change_pw").focus();
		            $("#change_pw_msg").text("비밀번호를 입력 해 주세요");
		            $("#change_pw_msg").css("color","red");
		            return;
		         }
		         
		         if(!regex_pw.test($("#change_pw").val())){
		            $("#change_pw").focus();
		            $("#change_pw_msg").text("특수문자, 문자, 숫자 포함 형태의 8~15자리 이내");
		            $("#change_pw_msg").css("color","red");
		            return;
		         }
		         if($("#change_pw").val() != $("#change_pw_cf").val()){
		            $("#change_pw").focus();
		            $("#change_pw_cf_msg").text("비밀번호가 서로 일치하지 않습니다.");
		            $("#change_pw_cf_msg").css("color","red");
		            return;
		         }
		         if($("#change_pw").val() == $("#now_pw").val()){
		        	 alert("현재 비밀번호가 새 비밀번호와 같습니다");
		        	 return;
		         }
       	  const item = {
 				id: '${member.id}',
 				passwd: $("#now_pw").val()
 			}
			$.ajax("checkPw",{
				method:"GET",
				contentType:"application/json",
		        dataType:"text",
		        data: item,
		        success: result => {
		        	if (result == "OK"){
		        		$("#pwChangeForm").submit();
		        	}else{
		        		$("#now_pw").focus();
		        		$("#now_pw_msg").text("현재 비밀번호가 틀렸습니다.");
			            $("#now_pw_msg").css("color","red");
		        	} 	
		        },
		        error : function(){
		        	console.log("실패");
		        }
			});
			
		});
	});
</script>
</head>
<body>
	<div>
		<form id="pwChangeForm" method="Post">
			<div class="main_gaza">
				<a href="../../../">
					<span>로고</span>
				</a>
			</div>
			<input type="Text" name ="id" value="${member.id}" hidden>
			<div id="wrap">
			
				<div class="now_wrap">
					<label>현재 비밀번호</label>
					<input type="password" id="now_pw">
					<div>
                        <label id="now_pw_msg"></label>
                     </div>
				</div>
				<div class="new_wrap">
					<label>새 비밀번호</label>
					<input type="password" id="change_pw" name="passwd">
					<div>
                        <label id="change_pw_msg"></label>
                     </div>
				</div>
				<div class="newcf_wrap">
					<label>새 비밀번호 확인</label>
					<input type="password" id="change_pw_cf">
					<div>
                        <label id="change_pw_cf_msg"></label>
                     </div>
				</div>
				<div class="bttn">
					<button type="button" id="changePwBtn">비밀번호 변경</button>
				</div>
				<div class="back">
					<a href="./">이전 페이지로</a>
				</div>
			</div>
		</form>
	</div>
</body>
</html>