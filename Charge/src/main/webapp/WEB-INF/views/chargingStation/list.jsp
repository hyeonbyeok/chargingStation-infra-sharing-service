<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>충전소 목록</title>
<jsp:include page="../include/head.jsp"></jsp:include>
<link rel="stylesheet" href="/css/char_list.css">
<script>
	$(function(){
		$(".display").change(function(){
			const item = {
				code: $(this).data("code"),
				display: 1
			}
			
			if($(this).is(':checked')){
				$.ajax("locView",{
					method:"post",
					contentType:"application/json",
					dataType:"json",
					data: JSON.stringify(item),
					success: result =>{
						
					},
					error: function(){
						
					}
				});
			} else {
				item.display = ' ';
				
				$.ajax("locView",{
					method:"post",
					contentType:"application/json",
					dataType:"json",
					data: JSON.stringify(item),
					success: result =>{
						
					},
					error: function(){
						
					}
				});
			}
		})
		
	});
	
	
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
				<span class="bec"><a href="">사설충전소 관리</a></span>
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
						<p>사설 충전소 관리</p>
					</div>
			</div>
			
		<div class="main_container">
			<!-- 검색탭 -->
				<div class="search">
					<div class="tt_wrap">
						<p id="tt_msg"></p>
					</div>
					
					<form class="search_box">
						<div class="search_land">
							<select name="search" class="form-select form-select-sm">
								<option value="0">검색항목</option>
								<option value="1" ${pager.search == 1 ? 'selected' : ''}>번호</option>
								<option value="2" ${pager.search == 2 ? 'selected' : ''}>건물명/지역명</option>
								<option value="3" ${pager.search == 3 ? 'selected' : ''}>주소</option>
								<option value="4" ${pager.search == 4 ? 'selected' : ''}>운영기관</option>
								<option value="5" ${pager.search == 5 ? 'selected' : ''}>아이디</option>
							</select> 
							
							<input type="text" name="keyword" value="${pager.keyword}" class="form-label" placeholder="검색어를 입력하세요">
							<button type="button" class="search-btn"></button>
						</div>
					</form>
				</div>
	
	
					<table class="table">
						<thead>
							<tr>
								<th>번호</th>
								<th>건물/지역명</th>
								<th>상세주소</th>
								<th>운영기관</th>
								<th>연락처</th>
								<th>아이디</th>
								<th>위치등록</th>
								<th>관리</th>
							</tr>	
						</thead>
						
						<tbody>
							<c:if test="${list.size() < 0 }">
								<tr>
									<td colspan="8">등록 된 충전소가 없습니다.</td>
								</tr>
							</c:if>
							<c:forEach items="${list}" var="item">
								<tr>
									<td>${item.code}</td>
									<td><a href="view/${item.code}">${item.name}</a></td>
									<td>${item.address}</td>
									<td>${item.organization}
									<c:if test="${item.tel != 'null-null-null'}">
										<td>${item.tel}</td>
									</c:if>
									<c:if test="${item.tel == 'null-null-null'}">
										<td></td>
									</c:if>
									<td>${item.id}</td>									
									<td>
										위치등록
										<input type="checkbox" name="display" class="display" data-code="${item.code}" value="${item.display}" ${item.display == '1' ? 'checked' : ''}>
									</td>									
									<td><a href="update/${item.code}" class="udt">변경</a> <a href="delete/${item.code}" class="udt1">삭제</a></td>
								</tr>
							</c:forEach>
						</tbody>
						
							<tfoot>
								<tr>
									<td colspan="8" class="foot">
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
</body>
</html>