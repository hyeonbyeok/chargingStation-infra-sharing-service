<%@ page language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<jsp:include page="include/head.jsp"></jsp:include>
<link rel="stylesheet" href="/css/pwview.css">
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
					<span id="msg">아이디가 존재하지 않습니다.</span>
				</div>
				<div class="fck">
					<a href="signup">회원 가입</a>
				</div>
			</c:if>
		</div>
		
		<div class="okman">
			<c:if test="${check == 0}">
				<div class="id_wrap">
					<label>이메일 전송 완료</label>
				</div>
				<div class="okbtn">
					<button class="btn btn-outline-dark"><a href="./login">로그인 화면</a></button>
				</div>
			</c:if>
		</div>
		</div>
		
	</div>
</body>
</html>