<%@ page language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="include/head.jsp"></jsp:include>
<link rel="stylesheet" href="/css/find_pw.css">
<title>비밀번호 찾기</title>
<script>

function find() {
	const findPw = $("#findPw");
	const id = $("#id").val();
	const email = $("input[id=email]").val();

	let msg = document.getElementById("msg");
	
	if(id == ""){
		msg.textContent = "아이디를 입력하세요";
		return;
	}
	
	if(email == ""){
		msg.textContent = "이메일을 입력하세요";
		return;
	}
	
	findPw.submit();
}

</script>
</head>
<body>
	<div id="wrap">
		<div class="wrap_in">
		<div class="logo">
			<a href=".">
				<img src="/img/logo(blk).png">
			</a>
		</div>
		
			<form action="newPassword" method="Post" id="findPw">
				<div id="log_container">
					<div id="log_wrap" class="">
						<div class="name_wrap">
							<div class="namae">
								<labeL>아이디</labeL>
							</div>
							<input type="text" id="id" name="id" onkeypress="javascript:if(event.keyCode==13){find();}" placeholder="아이디를 입력해 주세요">
						</div>
	
						<div class="tel_wrap">
							<div class="tell">
								<label>이메일</label>
							</div>
							<input type="text" id="email" name="email" onkeypress="javascript:if(event.keyCode==13){find();}"> 
						</div>		
					</div>
					
				     <div class="bttn">
						<button type="button" onclick="find();" class="btn">이메일로 비밀번호 전송</button>
					</div>	
				</div>
			</form>
			<div class="er">
				<label id="msg"></label>
			</div>
		</div>
	</div>
</body>
</html>