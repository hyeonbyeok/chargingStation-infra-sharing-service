<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script>
document.title = "내정보";
</script>
<jsp:include page="../include/head.jsp"></jsp:include>
<link rel="stylesheet" href="/css/mypage.css">

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
	
	<!-- 메인컨턴츠 -->
	<div id="container">
		<div class="container">
			<div class="user_wrap">
				<div class="user_info">
						<h2 class="user_info_title">내 정보</h2>
					<div class="edit">
					  <div class="edit_inner">
					  
					  	<div class="info_table">
							<div class="infos_tr">
								<div class="infos_th">아이디</div>
								<div class="infos_td">	
									<div class="infos_id">${member.id}</div>
								</div>
							</div>
							
							<div class="infos_tr">
								<div class="infos_th">이름</div>
								<div class="infos_td">	
									<div class="infos_name">${member.name}</div>
								</div>
							</div>
							
							<div class="infos_tr">
								<div class="infos_th">전화번호</div>
								<div class="infos_td">	
									<div class="infos_tel">${member.tel}</div>
								</div>
							</div>
							<div class="infos_tr">
								<div class="infos_th">이메일</div>
								<div class="infos_td">	
									<div class="infos_email">${member.email}</div>
								</div>
							</div>
						
							<div class="write_wrap">
								<h2 class="write_wrap_title">회원 설정</h2>
								
								<div class="write_info">
									<a href="../mypage/pwChange">비밀번호 변경</a>
									<a href="../mypage/update">회원정보변경</a>
									<span><a href="./delete">회원탈퇴</a></span>
								</div>
							</div>
						</div>
					 </div>
					</div>
				</div>
			</div>
			
			
			
		<!-- 건의내역 -->	
			<div class="cscf_container">
				<h3>건의사항</h3>
				<table class="table">
					<thead>
						<tr>
							<th>건의 내역</th>
							<th>상태</th>
						</tr>	
					</thead>
					<tbody>
						<c:if test="${list.size() < 0 }">
							<tr>
								<td colspan="2">건의 내역이 없습니다.</td>
							</tr>
						</c:if>
						<c:forEach items="${list}" var="item">
							<tr>
								<td><a href="../cscf/view/${item.code}">${item.title}</a></td>
								<td>${item.stats == '1' ? '확인완료' : '확인중'}</td>
							</tr>
						</c:forEach>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="2" class="foot">
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
			
		<!-- 등록내역 -->
			<div class="cscf_container">
				<h3>충전소 등록 내역</h3>
				<table class="table">
					<thead>
						<tr>
							<th>등록 내역</th>
							<th>상태</th>
						</tr>	
					</thead>
					<tbody>
						<c:if test="${CSlist.size() < 0 }">
							<tr>
								<td colspan="2">등록 된 충전소가 없습니다.</td>
							</tr>
						</c:if>
						<c:forEach items="${CSlist}" var="item">
							<tr>
								<td><a href="../chargingStation/view/${item.code}">${item.name}</a></td>
								<td>${item.display == '1' ? '등록 완료' : '확인중'}</td>
							</tr>
						</c:forEach>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="2" class="foot">
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

	</div>
</div>
</body>
</html>