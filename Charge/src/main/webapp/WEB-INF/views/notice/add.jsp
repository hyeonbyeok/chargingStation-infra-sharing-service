<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<jsp:include page="../include/head.jsp"></jsp:include>
<link rel="stylesheet" href="/css/noticeadd.css">
<script>
	document.title = "공지사항 등록";
	
	$(function (){
		var count = 0
		var addbtn = 0
		$("#imgAdd").click(function(){
			const input = "<div class='input_box'><input type='file'  class='int' name='noticeImg'><div> ";
			$("#img_input:last").append(input);
			addbtn += 1;
			if(count == 0) {
				const button ="<button type='button' id='imgDelete' class='btn btn-outline-dar btn-outline-danger'>삭제</button>";
				$("#imgAdd").after(button);
				count = count + 1;
				$("#imgDelete").click(function(){
					$("#img_input  .input_box:last-child").remove();
					addbtn -= 1;
					if(addbtn == 0){
						$("#imgDelete").remove();
						count = 0;
					}
				});
			}		
		});
	});
	
	$(function(){
		$("#addBtn").on("click",function(){

		if($("#title").val() == ""){
			alert("제목을 입력해주세요");
			return;
		}
		
		if($("#contents").val() == ""){
			alert("내용을 입력해주세요");
			return;
		}
			
		var con_test = confirm("공지를 등록 하시겠습니까?");
			if(con_test == false){
				return false;
			}
			
			
			
			
			$("#add").submit();
		});	
	});

function goTop(){
	window.scrollTo(0,0);
}
</script>
</head>
<body>
		<!-- 헤더 -->
	<header id="header">
		<div class="head_wrap">
			<!-- 로고 -->
				<h1 class="logo">
					<a href="../">
						<span>로고</span>
					</a>
				</h1>
				
			<!-- 메뉴 -->
				<div class="nav">
					<ul>
						<li class="depth1"><a href="../electronicList">충전소찾기</a></li>
						<li class="depth1"><a href="../notice/list">공지사항</a></li>
						<li class="depth1"><a href="../cscf/add">건의하기</a></li>
						<li class="depth1"><a href="../chargingStation/add">충전소등록</a></li>
					<c:if test="${sessionScope.member.id == 'admin'}">
						<li class="depth1"><a href="../chargingStation/list">관리자목록</a></li>
					</c:if>
					</ul>
				</div>
					
			<!-- 로그인 -->
				<div class="log_tab">
					<ul>
						<c:if test="${sessionScope.member == null }">
							<li class="log"><a href="../login">로그인</a></li>
							<li class="log"><a href="../signup">회원가입</a></li>
						</c:if>
						<c:if test="${sessionScope.member != null}">
						
							<div class="welcome">
								<span>${sessionScope.member.id}</span>
								<span>님 환영합니다.</span>
							</div>
							
							<li class="log"><a href="../logout" class="log">로그아웃</a></li>
							<li class="log"><a href="../mypage/" class="log">내 정보</a></li>
						</c:if>
					</ul>
				</div>	
			</div>
		</header>

	<!-- 메인 -->
	<div class="add_container">
		<form id="add" method="post" enctype="multipart/form-data">
			<div class="add_wrap">
					<div class="cont_img">
						<div class="img_cover"></div>
						<div class="cont_txt">
							<h1>공지사항 등록</h1>
							<p></p>
						</div>
					</div>
					
				<div class="add_master">
					<div class="form-floating mb-3">
					  <input type="text" name="title" class="form-control" id="title" placeholder="제목을 입력해주세요">
					  <label for="floatingInput">제목</label>
					</div>

					<div class="form-floating contents">
					  <textarea class="form-control" name="contents" placeholder="내용을 입력해주세요" id="contents" style="height: 400px;"></textarea>
					  <label for="floatingTextarea2">내용</label>
					</div>
				
					<div class="add_img_wrap">
						<label>이미지 첨부파일</label>
						<div id="img_input">
							<div class="input_box">
								<input type="file" id="img" class="int" name="noticeImg"> 
							</div>
						</div>
						<button type="button" id="imgAdd" class="btn btn-outline-dark">추가</button>
					</div>
							
					<div class="btn_wrap">
						<button type="button" class="add" id="addBtn">등록</button>
					</div>
				</div>
			</div>
		</form>
	</div>
	
	<div>	
<!-- 푸터 -->
		<footer id="footer">
			<div class="footer_wrap">
				<div class="footer_menu">
						<a href="/produce/infoview">EVMAP소개</a>
						<a href="/produce/agreed">이용약관</a>
						<a href="/notice/list">공지사항</a>
						<a href="/produce/privacy"><b>개인정보처리방침</b></a>
						<a href="/produce/locations">위치기반서비스이용약관</a>
				</div>
				<div class="footer_h3">
				<h3>EVMAP INFO<span>CUSTOMER</span></h3>
				<div class="footer_txt">
					<span>기업명 &nbsp;<strong>EVMAP</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
					<span style="margin-right: 800px;">대표이사 &nbsp;<strong>김현벽</strong></span>
					<span style="margin-right: 45px;">고객센터 &nbsp;<strong>1588.2240 (평일 09시~18시, 점심 12시~13시 제외)</strong></span>
				</div>
				<div class="footer_txt">
					<span>사업자등록번호 &nbsp;<strong>114-71-77066 </strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
					<span style="margin-right: 640px;">회사전화번호 &nbsp;<strong>042-3535-1324 </strong></span>
					<span style="margin-right: 211px;">메일 &nbsp;<strong>wingevmp@evmap.net </strong></span>
				</div>
				<div class="footer_txt">
					<span>주소 &nbsp;<strong>대전광역시 동구 우암로 352-21 4층</strong></span>
				</div>
				<div class="footer_copy">
					<div class="copy_txt">
						<p>COPYRIGHT©INFOEVMAP CORP. ALL RIGHT RESERVERD</p>
					</div>
					<div class="footer_top">
						<button type="button" onclick="goTop()" class="top_btn">TOP</button>
					</div>
				</div>
				</div>
			</div>
		</footer>
	</div>
</body>
</html>