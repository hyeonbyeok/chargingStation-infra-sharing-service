<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>충전소 정보</title>
<link rel="stylesheet" href="/css/char_view.css">
<script>
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
						<a href="../../">
							<span>로고</span>
						</a>
					</h1>
					
				<!-- 메뉴 -->
					<div class="nav">
						<ul>
							<li class="depth1"><a href="../../electronicList">충전소찾기</a></li>
							<li class="depth1"><a href="../../notice/list">공지사항</a></li>
							<li class="depth1"><a href="../../cscf/add">건의하기</a></li>
							<li class="depth1"><a href="../../chargingStation/add">충전소등록</a></li>
						<c:if test="${sessionScope.member.id == 'admin'}">
							<li class="depth1"><a href="../../chargingStation/list">관리자목록</a></li>
						</c:if>
						</ul>
					</div>
						
				<!-- 로그인 -->
					<div class="log_tab">
						<ul>
							<c:if test="${sessionScope.member == null }">
								<li class="log"><a href="../../login">로그인</a></li>
								<li class="log"><a href="../../signup">회원가입</a></li>
							</c:if>
							<c:if test="${sessionScope.member != null}">
							
								<div class="welcome">
									<span>${sessionScope.member.id}</span>
									<span>님 환영합니다.</span>
								</div>
								
								<li class="log"><a href="../../logout" class="log">로그아웃</a></li>
								<li class="log"><a href="../../mypage/" class="log">내 정보</a></li>
							</c:if>
						</ul>
					</div>	
				</div>
			</header>


<!-- 메인 -->
	<div id="container">
	<div class="view_wrap">
			<div id="view_title">
				<h1>충전소 등록 정보</h1>
			</div>
			
			<div class="view_table">
				<div class="view_contents">
					<div class="view_label">
						<label>건물/지역명</label>
					</div>
					<div class="view_span">
						<span>${item.name}</span>
					</div>
				</div>
				
				<div class="view_contents">
					<div class="view_label">
						<label>상세 주소</label>
					</div>
					<div class="view_span">
						<span>${item.address}</span>
					</div>
				</div>
				
				<div class="view_contents">
					<div class="view_label">
						<label>운영기관</label>
					</div>
					<div class="view_span">
						<span>${item.organization}</span>
					</div>
				</div>
				<div class="view_contents">
					<div class="view_label">
						<label>연락처</label>
					</div>
					<div class="view_span">
						<span>${item.tel}</span>
					</div>
				</div>
				<div class="view_contents">
					<div class="view_label">
						<label>충전요금</label>
					</div>
					<div class="view_span">
						<span>${item.fare}</span>
					</div>
				</div>
				<div class="view_contents">
					<div class="view_label">
						<label>사용가능 시간</label>
					</div>
					<div class="view_span">
						<span>${item.availableTime}</span>
					</div>
				</div>
				<div class="view_contents">
					<div class="view_label">
						<label>충전기 타입</label>
					</div>
					<div class="view_span">
						<span>${item.type}</span>
					</div>
				</div>
				<div class="view_contents">
					<div class="view_label">
						<label>급속 충전량</label>
					</div>
					<div class="view_span">
						<span>${item.chargeAmount}</span>
					</div>
				</div>
				<div class="view_contents">
					<div class="view_label">
						<label>위도</label>
					</div>
					<div class="view_span">
						<span>${item.lat}</span>
					</div>
				</div>
				<div class="view_contents">
					<div class="view_label">
						<label>경도</label>
					</div>
					<div class="view_span">
						<span>${item.lng}</span>
					</div>
				</div>
				
				<div class="imgimg">
					<div class="img_title">
						<label>이미지</label>
					</div>
					<div class="img_box">
						<c:forEach items="${images}" var="image">		
							<img src="/upload/${image.uuid}_${image.filename}"/>
						</c:forEach>
					</div>
				</div>
			</div>
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
</body>
</html>