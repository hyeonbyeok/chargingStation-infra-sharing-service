<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="include/head.jsp"></jsp:include>
<link rel="stylesheet" href="/css/index.css">
<title>EVMAP</title>
<script>

function goTop(){
	window.scrollTo(0,0);
}

	document.title = "EVMAP";
	
/* window.addEventListener("wheel",function(e){
	e.preventDefault();
},{passive : false});

var wa = $("html");
var page = 1;
var lastPage = $(".sacs").length;

wa.animate({scrollTop : 0},10);

$(window).on("wheel",function(e){
	if(wa.is(":animated")) return;
	
	if(e.originalEvent.deltaY > 0){
		if(page == lastPage) return;
		
		page ++;
		
	} else if(e.originalEvent.deltaY < 0){
		if(page == 1) return;
		
		page--;
	}
	
	var posTop = (page - 1) * $(window).height();
	wa.animate({scrollTop : posTop});
}) */
	
</script>
</head>
<body>
	<div id="wrap">

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
						<li class="depth1"><a href="chargingStation/list">관리자목록</a></li>
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
							<li class="log"><!-- <img src="img/account_circle.png" width=22px; height=22px; class="account_circle"> --><a href="../mypage/" class="log">내 정보</a></li>
						</c:if>
					</ul>
				</div>	
			</div>
			<div class="o_img">
				<img src="/img/main.png"> 
			</div>
		</header>
		
		
	<!-- 몸통 -->
	<div id="container">
		<div class="main_container">
		
			<!-- 1번 시작 -->
				<div class="section_1 sacs">
					<div class="sec">
						<div class="txt_box">
							<h1>전기차 충전소</h1>
							<strong>남들보다 빠르게</strong>
							<p>전국의 <span>전기차 충전소</span>를 
							 가장 빠르게 확인하는법</p>
							
							<div class="btn1">		
								<button type="button" onclick="location.href='electronicList';">충전소 찾으러 가기</button>							
							</div>
						</div>
					</div>
													
					
				</div>

			<!-- 2번 시작 -->	
			<div class="section_2 sacs">	
					<div class="title">
						<h2><strong>EVMAP</strong><img src="/img/blue_icon.png"> 무엇이 다른가요?</h2>
						<p>EV와 함께 <strong>“충전소 등록”</strong> 하여 모두와 공유하세요!</p>
					</div>
					
				<div class="sec">
					<div class="txt_box">
							<h2>더 빠르게<img src="/img/blue_icon.png"></h2>
							<h1><span>충전소를 등록하고</span><br>이용하세요</h1>
							<p>고객님께 최적화된 맞춤형 서비스를 제공합니다.</p>
									
						<div class="btn2">		
							<button type="button" onclick="location.href='chargingStation/add';">등록하러 가기</button>							
						</div>
					</div>
						<div class="two_img">
							<img src="/img/iphone5.png">
						</div>
				</div>
			</div>

			
			<!-- 4번 -->
			<div class="section_4 sacs">
				<div class="sec">
					<div class="fo_img">
						<img src="/img/chargepic.png">
					</div>
					
				<div class="txt_wrap">
					
						<div class="txt_box">
							<h3>전기차 충전소<br>위치 찾기</h3>
							<p>EVMAP에서 지도API를 통해
							<br>전기차 충전소를 더 빠르게 찾기 가능</p>
						</div>

				
						<div class="txt_box">
							<h3>사설 충전소<br>위치 등록</h3>
							<p>지도에 없는 전기차 충전소를
							<br>직접 등록하여 다른 사용자에게
							<br>공유하고 이용해보세요
							</p>
						</div>

					
						<div class="txt_box">
							<h3>사설 충전소<br>변경 요청</h3>
							<p>사설 충전소의 잘못된
							<br>정보를 건의 사항을 통해 직접
							<br>운영자에게 변경 요청</p>
						</div>
					
				</div>
				</div>
			</div>
			
			<!-- 5번 -->
			<div class="section_5 sacs">
				<div class="sec">
					<div class="main5">
						언제 어디서나<img src="/img/blue_icon.png">
					</div>
					<p class="txt">EVMAP만의 <b>최적의 절차, 최적의 서비스</b>를 경험해보세요.</p>
					<ul>
					<li>
					<div class="cir-con1">
										<span class="font_num"><a href="signup">회원가입</a></span>
										<span class="icon"><i class="xi-border-color"></i></span>
									</div>
									<p class="tit">EVMAP의 회원전용<br>서비스 이용</p>
									</li>
									<li>
					<div class="cir-con2">
										<span class="font_num"><a href="chargingStation/add">충전소등록</a></span>
										<span class="icon"><i class="xi-border-color"></i></span>
									</div>
									<p class="tit">등록되지 않은 충전소<br>등록 공유</p>
									</li>
									<li>
					<div class="cir-con3">
										<span class="font_num"><a href="electronicList">충전소찾기</a></span>
										<span class="icon"><i class="xi-border-color"></i></span>
									</div>
									<p class="tit">전국 지역 어디든지<br>충전소 검색</p>
									</li>
									<li>
					<div class="cir-con4">
										<span class="font_num"><a href="cscf/add">건의하기</a></span>
										<span class="icon"><i class="xi-border-color"></i></span>
									</div>
									<p class="tit">잘못된 정보와 추가사항<br>건의하기</p>
									</li>
									</ul>
				</div>
			</div>
			<!-- 끗 -->
		</div>
	</div>
	
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
					<span style="margin-right: 600px;">대표이사 &nbsp;<strong>김현벽</strong></span>
					<span style="margin-right: 45px;">고객센터 &nbsp;<strong>1588.2240 (평일 09시~18시, 점심 12시~13시 제외)</strong></span>
				</div>
				<div class="footer_txt">
					<span>사업자등록번호 &nbsp;<strong>114-71-77066 </strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
					<span style="margin-right: 440px;">회사전화번호 &nbsp;<strong>042-3535-1324 </strong></span>
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