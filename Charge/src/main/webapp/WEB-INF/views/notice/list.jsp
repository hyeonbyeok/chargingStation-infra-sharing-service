<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../include/head.jsp"></jsp:include>
<title>Insert title here</title>
<link rel="stylesheet" href="/css/noticelist.css">
<script>
document.title = "공지사항";

function goTop(){
	window.scrollTo(0,0);
}
$(function(){
	var total = `${pager.total}`;
	total = parseInt(total);
	
	$("#tt_msg").text('총 ' + total + ' 개의 게시물이 업로드 되었습니다.')
	
})
</script>
</head>
<body>
		<!-- 헤더 -->
		<header id="header">
			<div class="head_wrap">
				<!-- 로고 -->
				<h1 class="logo">
					<a href="../"> <span>로고</span>
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
								<span>${sessionScope.member.id}</span> <span>님 환영합니다.</span>
							</div>

							<li class="log"><a href="../logout" class="log">로그아웃</a></li>
							<li class="log"><a href="../mypage/" class="log">내 정보</a></li>
						</c:if>
					</ul>
				</div>
			</div>
		</header>
		
		
<!-- 메인 -->
<div id="main_wrap">
	<div class="cont_img">
		<div class="img_cover"></div>
			<div class="cont_txt">
				<h1>공지사항</h1>
			</div>
	</div>

	<div class="n_container">
		<div class=notice_title>
		공지사항
		</div>	
		<div class="search">
			<div class="tt_wrap">
				<p id="tt_msg"></p>
			</div>
			
			<form class="search_box">
				<div class="search_land">
					<select name="search" class="form-select form-select-sm">
						<option value="0">검색항목</option>
						<option value="1" ${pager.search == 1 ? 'selected' : ''}>번호</option>
						<option value="2" ${pager.search == 2 ? 'selected' : ''}>제목</option>
					</select> 
					
					<input type="text" name="keyword" value="${pager.keyword}" class="form-label" placeholder="검색어를 입력하세요">
					<button type="button" class="search-btn"></button>
				</div>
			</form>
		</div>
		
		<hr style="display: block; border-top: 2px solid #222222;">
		
		<div class="notice_box">
		EVMAP의 공지사항, NEWS, 전기차이야기 등 여러가지 소식을 알려드립니다.
		<br>
		문의사항은 건의사항의 건의하기를 통해 이용해주세요.
		</div>
		
		<table class="table">
			<thead>
				<tr>
					<th style="width:0px; font-weight: 500;" ></th>
					<th style="width:700px; font-weight: 500;">제목</th>
					<th style="width:100px; font-weight: 500;">작성자</th>
					<th style="width:170px; font-weight: 500;">작성일</th>
					<th style="width:90px; font-weight: 500;">조회수</th>
					<c:if test="${sessionScope.member.id == 'admin' }">
						<th style="width:90px; font-weight: 500;">관리</th>
					</c:if>
				</tr>
			</thead>
			<tbody>
				<c:if test="${list.size() < 0 }">
					<tr>
						<td colspan="5">등록 된 충전소가 없습니다.</td>
					</tr>
				</c:if>

				<c:forEach items="${list}" var="item">
					<tr>
						<td class="title">
						<div class="board-list"> 
						<strong class=board><span class="inner">필독</span></strong>
						</div>
						</td>
						<td>
						<div class="title">
							<div class="inner_list">
								<a href="view/${item.code}">${item.title}</a>
							</div>
						</div>
						</td>
						<td class="font_s">${item.id}</td>
						<td class="font_s"><fmt:formatDate value="${item.regDate}"
								pattern="yyyy.MM.dd (hh:mm)" /></td>
						<td class="font_s">${item.viewCount}</td>
						<c:if test="${sessionScope.member.id == 'admin'}">
							<td class="font_s"><a href="update/${item.code}" class="manmaru">변경</a> <a
								href="delete/${item.code}">삭제</a></td>
						</c:if>
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
						<c:if test="${sessionScope.member.id == 'admin'}">
								<div class="insert">
									<button class="insert_button"><a href="add">공지 등록</a></button>
								</div>
							</c:if>
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