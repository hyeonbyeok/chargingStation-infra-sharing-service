<%@ page language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<jsp:include page="include/head.jsp"></jsp:include>
<link rel="stylesheet" href="/css/idview.css">
<script>



</script>
</head>
<body>
	<div id = "wrap">
		<div class="wrap_in">
		<div class="logo">
			<a href=".">
				<img src="/img/logo(blk).png">
			</a>
		</div>
		<div class="noman">
			<c:if test="${check == 1}">
				<div class="nom">
					<span id="msg">일치하는 회원 정보가 없습니다.</span>
				</div>
				<div class="fck">
					<a href="findId">아이디 찾기</a>
					<a href="login">로그인 화면</a>
					<a href="signup">회원 가입</a>
				</div>
			</c:if>
		</div>
		
		<div class="okman">
			<c:if test="${check == 0}">
				<div class="id_wrap">
					<label>아이디는 '${id}' 입니다.</label>
				</div>
				<div class="okbtn">
					<button class="btn btn-outline-dark"><a href="./login">로그인 화면</a></button>
				</div>
				<div class="gaza">
					<a href="findPw">비밀번호 찾기</a>
				</div>
			</c:if>
		</div>
		</div>
		
	</div>
</body>
</html>