<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>충전소 정보 변경</title>
<jsp:include page="../include/head.jsp"></jsp:include>
<link rel="stylesheet" href="/css/char_update.css">
<script>
	$(function(){
		$("#addBtn").on("click",function(){
			const tel1 = /^\d{3}$/;
			const tel2 = /^\d{4}$/;
			const tel3 = /^\d{4}$/;

			if($("#name").val() == ""){
				alert("건물/지역명을 적어주세요");
				return;
			}
			if($("#address").val() == ""){
				alert("주소를 입력 해 주세요");
				return;
			}
			if($("#tel1").val() == "" || $("#tel2").val() == "" || $("#tel3").val() == ""){
				alert("전화번호를 입력 해 주세요");
				return;
			}
			if($("#tel1").val() != "" || $("#tel2").val() != "" || $("#tel3").val() != ""){
				if(!tel1.test($("#tel1").val())){
					alert("전화번호 입력이 이상합니다.");
					return;
				}
				if(!tel2.test($("#tel2").val())){
					alert("전화번호 입력이 이상합니다.");
					return;
				}
				if(!tel3.test($("#tel3").val())){
					alert("전화번호 입력이 이상합니다.");
					return;
				}
			}
			if($("#type").val() == ""){
				alert("충전기 타입을 입력 해 주세요");
				return;
			}
			if($("#chargeAmount").val() == ""){
				alert("급속충전량을 적어주세요");
				return;
			}
			
			
			$("#update").submit();
		});	
	});
	//이미지 추가 삭제 버튼
	$(function (){
		var count = 0
		var addbtn = 0
		$("#imgAdd").click(function(){
			const input = "<div class='input_box'><input type='file'  class='int' name='cImg'><div> ";
			$("#img_input:last").append(input);
			addbtn += 1;
			if(count == 0) {
				const button ="<button type='button' id='imgDelete' class='btn btn-outline-dark'>삭제</button>";
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
	//이미지 등록된 것들 삭제
$(function(){
	$("button.delete").click(function() {
		const code = $(this).data("code");
		
		$.ajax("../image/delete/" + code, {
			method: "GET",
			success: function(result) {
				if(result)
					$("button.delete[data-code='" + code + "']").parent().remove();
			},
			error: function(status) {
				console.log(status);
			}				
		});
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
			<!-- 등록 이미지 -->
			<div class="cont_img">
				<div class="img_cover"></div>
				<div class="cont_txt">
					<h1>충전소 변경하기</h1>
					<p>충전소 위치정보를 변경해 보세요</p>
				</div>
			</div>
			<!-- 등록 탭 -->
			
		<div class="a_cont">
				<form id="update" method="post" enctype="multipart/form-data">
					<div class="update_container">
						<div class="update_wrap">
							<div class="box_title">
								<p>변경하기</p>
							</div>	
							
							<div class="boxbox">
									<div class="int_wrap">
										<label id="label">건물/지역명</label>
										<div class="input_box">
											<input type="text" id="name" name="name" class="int" placeholder="폴리텍 대학 대전 캠퍼스" value="${item.name }">
										</div>
									</div>
									
									<div class="int_wrap">
										<label id="label">상세 주소</label>
										<div class="input_box">
												<input type="text" class="int" id="sample6_address" name="address" placeholder="도로명 주소로 선택해주세요" value="${item.address }" readonly><br>
										</div>
										<div class="address_btn">
											<button type="button" onclick="sample6_execDaumPostcode()" value="주소 찾기" class="btn btn-outline-primary">주소 찾기</button>
										</div>
									</div>
									<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
									<script>
									    function sample6_execDaumPostcode() {
									        new daum.Postcode({
									            oncomplete: function(data) {
									                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
									
									                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
									                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
									                var addr = ''; // 주소 변수
									                
									
									                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
									                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
									                    addr = data.roadAddress;
									                } else { // 사용자가 지번 주소를 선택했을 경우(J)
									                    addr = data.jibunAddress;
									                }
	
									
									                // 우편번호와 주소 정보를 해당 필드에 넣는다.
									                document.getElementById("sample6_address").value = addr;
									                
											        searchPlaces();
											        
									            }
									        }).open();
									      
									    }
									</script>
									
									<div>
										<div id="map" style="width:400px;height:350px;margin:20px 0;"></div>
										<p style="font-size:14px; margin-bottom: 5px;"><em>충전소의 위치에 클릭해주세요!</em></p> 
									</div>
									<div>
										<label> 위도 </label>
										<input type="text" id="lat" name="lat" value="${item.lat }" readonly>
									</div>
									<div>
										<label> 경도 </label>
										<input type="text" id="lng" name="lng" value="${item.lng }" readonly>
									</div>
									<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a163b9c1554276acb41e377bdbfa6b84&libraries=services"></script>
									<script>
									var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
									    mapOption = { 
									        center: new kakao.maps.LatLng(36.350847179614824, 127.4537181632319), // 지도의 중심좌표
									        level: 3 // 지도의 확대 레벨
									    };
									
									var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
									
									// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
									var mapTypeControl = new kakao.maps.MapTypeControl();

									// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
									// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
									map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

									// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
									var zoomControl = new kakao.maps.ZoomControl();
									map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
									
									// 지도를 클릭한 위치에 표출할 마커입니다
									var marker = new kakao.maps.Marker(); 
									// 지도에 마커를 표시합니다
									marker.setMap(map);
									
									// 지도에 클릭 이벤트를 등록합니다
									// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
									kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
									    
									    // 클릭한 위도, 경도 정보를 가져옵니다 
									    var latlng = mouseEvent.latLng; 
									    
									    // 마커 위치를 클릭한 위치로 옮깁니다
									    marker.setPosition(latlng);
									    
									    $("#lat").val(latlng.getLat());
									    $("#lng").val(latlng.getLng());
									
									});
									
									//장소 검색 객체를 생성합니다
									var ps = new kakao.maps.services.Places(); 
									
									
									
									//키워드 검색을 요청하는 함수입니다
									function searchPlaces() {
									
									    var keyword = document.getElementById('sample6_address').value;
									
									    if (!keyword.replace(/^\s+|\s+$/g, '')) {
									        alert('키워드를 입력해주세요!');
									        return false;
									    }
									
									    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
									    ps.keywordSearch( keyword, placesSearchCB); 
									}
									
									
									// 키워드 검색 완료 시 호출되는 콜백함수 입니다
									function placesSearchCB (data, status, pagination) {
									    if (status === kakao.maps.services.Status.OK) {
									
									        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
									        // LatLngBounds 객체에 좌표를 추가합니다
									        var bounds = new kakao.maps.LatLngBounds();
									
									        for (var i=0; i<data.length; i++) {
									            
									            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
									        }       
									
									        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
									        map.setBounds(bounds);
									    } 
									}
									
									</script>
									
									<div class="int_wrap">
										<label id="label">운영기관</label>
										<div class="input_box">
											<input type="text" id="organization" class="int" name="organization"placeholder="폴리텍 대학" value="${item.organization }">
										</div>
									</div>
									
									<div class="tel_wrap">
										<label id="label">연락처</label>
											<div class="tel_box">
												<div class="tel_boxy1">
													<input type="tel" id="tel1" name="tel1" pattern="[0-9]{3}" value="${item.tel1}"> 				
													<input type="tel" id="tel2" name="tel2" pattern="[0-9]{4}" value="${item.tel2}"> 
													<input type="tel" id="tel3" name="tel3" pattern="[0-9]{4}" value="${item.tel3}"> 			
												</div>
											</div>
									</div>
									
									<div class="int_wrap">
										<label id="label">충전 요금</label>
										<div class="input_box">
											<input type="text" id="fare" class="int" name="fare" placeholder="1000" value="${item.fare }">
										</div>
									</div>
									
									<div class="int_wrap">
										<label id="label">사용가능 시간</label>
										<div class="input_box">
											<input type="text" id="availableTime" name="availableTime" class="int" value="${item.availableTime}">
										</div>
									</div>
									
									<div class="int_wrap">
										<label id="label">충전기 타입</label>
										<div class="select_box">
											<select id="type" name="type">
												<option value="${item.type}">${item.type}</option>
												<option value="Type A">Type A</option>
												<option value="Type B">Type B</option>
												<option value="Type C">Type C</option>
												<option value="Type D">Type D</option>
										</select>
										</div>
									</div>
									
									<div class="int_wrap">
										<label id="label">급속 충전량</label>
										<div class="select_box">
											<select id="chargeAmount" name="chargeAmount">
												<option value="${item.chargeAmount}">${item.chargeAmount}</option>
												<option value="급속">급속</option>
												<option value="완속">완속</option>
											</select>
										</div>
									</div>
									
						 <div class="user_wrap">
								<label id="label">충전소 사진</label>
								<div>			
									<ul>
										<c:if test="${images == null || images.size() < 1}">
											<li>등록 된 제품이미지가 없습니다</li>
										</c:if>
										<c:forEach var="image" items="${images}">
											<li>${image.filename}<button type="button" class="btn btn-sm btn-danger delete" data-code="${image.code}">삭제</button> </li>
										</c:forEach>				
									</ul>
								</div>
								<div id="img_input">
									<div class="input_box">
										<input type="file" id="img" class="int" name="cImg"> 
									</div>
								</div>
								<button type="button" id="imgAdd">추가</button>
						 </div>
									
						<div class="add_btn">
							<button type="button" id="addBtn">변경하기</button>
						</div>
							</div>
						</div>
					</div>
			</form>
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
<jsp:include page="../include/body.jsp"></jsp:include>
</body>
</html>