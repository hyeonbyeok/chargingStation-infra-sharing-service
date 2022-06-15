<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../include/head.jsp"></jsp:include>
<link rel="stylesheet" href="/css/mypagelist.css">
<title>Insert title here</title>
<script>
document.title = "회원관리";

$(function(){
	$(".remove").click(function(){
		const id = $(this).data("id");
		const name = $(this).data("name");
		var con_test = confirm(id +"( " +name+ " ) 회원을 삭제 하시겠습니까?");
		if(con_test == false){
		    return false;
		}
	});
});


function goTop(){
	window.scrollTo(0,0);
}

</script>
</head>
<body>
	<div id="wrap">
		<!-- 헤더 -->
		<header id="header">
			<div class="head_wrap">
				<!-- 로고 -->
				<h1 class="logo">
					<a href="../../">
						<span>로고</span>
					</a>
				</h1>
				<!-- 헤더 메뉴 -->
				<div class="nav">
					<ul>
						<li class="depth1"><a href="../electronicList">충전소찾기</a></li>
						<li class="depth1"><a href="../notice/list">공지사항</a></li>
						<li class="depth1"><a href="../cscf/add">건의하기</a></li>
						<li class="depth1"><a href="../chargingStation/add">충전소등록</a></li>
						<c:if test="${sessionScope.member.id == 'admin'}">
							<li class="depth1"><a href="">관리자목록</a></li>
						</c:if>
					</ul>
				</div>	
				<!-- 로그인 폼 -->
				<div class="log_tab">
					<ul>
						<c:if test="${sessionScope.member == null }">
							<li class="log"><a href="login">로그인</a></li>
							<li class="log"><a href="signup">회원가입</a></li>
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
		<div id="nebi">
			<ul class="nebi_wrap">
				<span class="bec"><a href="../chargingStation/list">사설충전소 관리</a></span>
				<span class="bec"><a href="../cscf/list">건의사항 관리</a></span>
				<span><a href="../mypage/list">회원 관리</a></span>
			</ul>
		</div>
		
		<!-- 메인 -->
		<div id="container">
		<!-- 등록 이미지 -->
			<!-- 등록 이미지 -->
			<div class="cont_img">
				<div class="img_cover"></div>
					<div class="cont_txt">
						<h1>관리 페이지</h1>
						<p>회원 관리</p>
					</div>
			</div>
			
			<div class="main_container">
				<div class="search">
					<div class="tt_wrap">
						<p id="tt_msg"></p>
					</div>
					
					<form class="search_box">
						<div class="search_land">
							<select name="search" class="form-select form-select-sm">
								<option value="0">검색항목</option>
								<option value="1" ${pager.search == 1 ? 'selected' : ''}>아이디</option>
								<option value="2" ${pager.search == 2 ? 'selected' : ''}>이름</option>
							</select> 
							
							<input type="text" name="keyword" value="${pager.keyword}" class="form-label" placeholder="검색어를 입력하세요">
							<button type="button" class="search-btn"></button>
						</div>
					</form>
				</div>
				
					<table class="table">
						<thead>
							<tr>
								<th>아이디</th>
								<th>이름</th>
								<th>전화번호</th>
								<th>관리</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${list}" var="list">
							<tr>
								<td>${list.id}</td>
								<td>${list.name}</td>
								<td>${list.tel}</td>
								<td><a class="remove" href="remove/${list.id}" data-name ="${list.name}"  data-id = "${list.id}">회원삭제</a></td>
							</tr>
						</c:forEach>
						</tbody>
						<tfoot>
							<tr>
								<td colspan="6" class="foot">
									<div class="pgn">
										
										<ul class="pagination">
											<li class="page-item">
												<a href="?page=1" class="page-link">처음</a>
											</li> 
											
											<li class="page-item">
												<a href="?page=${pager.prev}" class="page-link">이전</a>
											</li>
											
											<c:forEach var="page" items="${pager.list}">
											<li class="page-item">
												<a href="?page=${page}" class="page-link">${page}</a>
											</li>
											</c:forEach>
											
											<li class="page-item">
												<a href="?page=${pager.next}" class="page-link">다음</a>
											</li>
											
											<li class="page-item">
												<a href="?page=${pager.last}" class="page-link">마지막</a>
											</li>
											
										</ul>
									</div>
								</td>
							</tr>
						</tfoot>
					</table>
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