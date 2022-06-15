<%@ page language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="include/head.jsp"></jsp:include>
<link rel="stylesheet" href="/css/find_id.css">
<title>아이디 찾기</title>

<script>

function find() {
	const findId = $("#findId");
	const name = $("#name").val();
	const tel = $("input[name=tel]").val();

	let msg = document.getElementById("msg");
	
	if(name == ""){
		msg.textContent = "이름을 입력하세요";
		return;
	}
	
	if(tel == ""){
		msg.textContent = "전화번호를 입력하세요";
		return;
	}
	
	findId.submit();
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
		
			<form method="post" action="findId" id="findId">
				<div id="log_container">
					<div id="log_wrap" class="">
						<div class="name_wrap">
							<div class="namae">
								<label for="name">이름</label>
							</div>
							<input type="text" id="name" name="name" onkeypress="javascript:if(event.keyCode==13){find();}" placeholder="이름을 입력해 주세요"/>
						</div>
	
						<div class="tel_wrap">
							<div class="tell">
								<label for="tel">전화번호</label>
							</div>
							<input type="text" id="tel" name="tel" maxlength="11"  pattern="[0-9]"  onkeypress="javascript:if(event.keyCode==13){find();}"/> 
						</div>		
					</div>
					
				     <div class="bttn">
						<button type="button" onclick="find();" class="btn">다음</button>
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