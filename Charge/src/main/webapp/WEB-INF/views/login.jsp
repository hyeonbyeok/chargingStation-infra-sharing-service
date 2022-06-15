<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>
	window.onload = function(){
		if(${msg != null}){
			alert("${msg}");
		}
	}
	
	document.title = "로그인";
</script>

<style>
	.error_msg{
		color: red;
		font-weight: bold;
	}
</style>
<link rel="stylesheet" href="/css/login.css">
</head>
<body>

	<div id="wrap">
		<div class="wrap_in">
			<div class="logo">
				<a href=".">
					<img src="/img/logo(blk).png">
				</a>
			</div>
			
		<div class="login_container">
			<div class="kakao_wrap">
				<div class="kakao_txt">
					<h1>로그인</h1>
					<p>아이디와 비밀번호, 입력하기 귀찮으시죠?<br>카카오로 빠르게 로그인 해보세요.</p>
				</div>
				<div class=kakao_btn>
					<a href=https://kauth.kakao.com/oauth/authorize?client_id=e7b4358dfc6b1b8ac07e85a738cd27e1&redirect_uri=http://localhost:9050/auth/kakao/callback&response_type=code HTTP/1.1>
					<img height="45px" src="/img/kakao_login_button.png"/></a>
				</div>
			</div>
			
				<div class="old_login_wrap">
					<form method="post">
						<div class="er_msg">
						<c:if test="${msg != null }">
							<div class="error_msg">${msg}</div>
						</c:if>
						</div>
						
						<div class="id_wrap">
							<input type="text" name="id" id="" placeholder="아이디" maxlength="20" class="box_">
						</div>
						<div class="pw_wrap">
							<input type="password" name="passwd" id="" placeholder="비밀번호"
								maxlength="20" class="box_">
						</div>
						<div class="login_btn">
							<button class="sbtn_type sbtn_primary">로그인</button>
						</div>
					</form>
					
					<div class="find_wrap">
						<div class="wtf"><a href="findId"> 아이디 찾기</a></div>
						<div class="wtf"><a href="findPw"> 비밀번호 찾기</a></div>
					</div>
					
					<div class="wtf">
						<a href="signup">회원이 아니세요? 그럼 클릭</a>
					</div>
					
					<div class="info_cont">
						<div class="info_txt">
							<h1>카카오 1초 로그인/회원가입 이란?</h1>
							<p>카카오 싱크를 활용한 간편 로그인/회원가입 기능입니다.</p>
						</div>
						<div class="collabo">
							<p>ADEV X 카카오 싱크 부스터</p>
						</div>
					</div>
				</div>
		</div>
		</div>
	</div>
</body>
</html>