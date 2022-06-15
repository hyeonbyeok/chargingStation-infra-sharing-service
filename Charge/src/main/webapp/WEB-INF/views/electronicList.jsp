<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>충전소 찾기</title>
<jsp:include page="include/head.jsp"></jsp:include>
<link rel="stylesheet" href="/css/electronicList.css">

<style>
	.map_wrap, .map_wrap * {font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
	.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
	.bg_white {background:#fff;}
	#menu_wrap {padding:5px;overflow-y:auto;background:#fff;z-index: 1;font-size:12px;border-radius: 20px; height: 800px; position: relative; z-index: 2; margin-left: 40px; margin-top:10px;}
	#placesList li {list-style: none;}
	#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
	#placesList .item span {display: block;margin-top:4px;}
	#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
	#placesList .item .info{padding:10px 0 10px 55px;}
	#placesList .info .gray {color:#8a8a8a;}
	#placesList .info .jibun {padding-left:26px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
	#placesList .info .tel {color:#009900;}
	#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
	#placesList .item .marker_1 {background-position: 0 -10px;}
	#placesList .item .marker_2 {background-position: 0 -56px;}
	#placesList .item .marker_3 {background-position: 0 -102px}
	#placesList .item .marker_4 {background-position: 0 -148px;}
	#placesList .item .marker_5 {background-position: 0 -194px;}
	#placesList .item .marker_6 {background-position: 0 -240px;}
	#placesList .item .marker_7 {background-position: 0 -286px;}
	#placesList .item .marker_8 {background-position: 0 -332px;}
	#placesList .item .marker_9 {background-position: 0 -378px;}
	#placesList .item .marker_10 {background-position: 0 -423px;}
	#placesList .item .marker_11 {background-position: 0 -470px;}
	#placesList .item .marker_12 {background-position: 0 -516px;}
	#placesList .item .marker_13 {background-position: 0 -562px;}
	#placesList .item .marker_14 {background-position: 0 -608px;}
	#placesList .item .marker_15 {background-position: 0 -654px;}
	#pagination {margin:10px auto;text-align: center;}
	#pagination a {display:inline-block;margin-right:10px;}
	#pagination .on {font-weight: bold; cursor: default;color:#777;}
	
	/*인포창*/
	.wrap {width: 350px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Noto Sans KR', sans-serif;line-height: 1.5; border-radius:0.5em;}
	.wrap * {padding: 0;margin: 0;}
	.wrap .info {width: 350px;border-radius: 10px; overflow: hidden;background: #fff;}
	.wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
	.info .title {padding-left: 0px;height: 55px;background: #3a76fff0;border-bottom: 1px solid #ddd;font-size: 18px; font-weight: 600; color:#fff;}
    .info .body {position: relative;overflow: hidden;}
    .info .desc {position: relative;margin: 8px 0 4px 108px;}
    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
    .desc .jibun {font-size: 11px;color: #888;margin-top: 2px;}
    .info .img {position: absolute;top: 6px;left: 5px;width: 83px;height: 81px;border: 1px solid #ddd;color: #888;overflow: hidden;}
    .info .link {color: #5085BB; margin-bottom: 3px;}
    .info .yasuo{ margin:3px 0; font-size:12px;}
</style>

<script>

function goTop(){
	window.scrollTo(0,0);
}

	$(function(){
		
		
		$("#typeAll").click(function(){
			
			if($("#typeAll").is(':checked') == true){
				
				$(".type:checkbox ").prop('checked',true);
			}else{
				$(".type:checkbox").prop('checked',false);
			}
		});
		$(".type:checkbox").click(function(){
			console.log("체크");
			
			if($(".type:checkbox:checked").length < 4){
				console.log("체크해제");
				$("#typeAll").prop('checked',false);
			}else{
				$("#typeAll").prop('checked',true);
			}
			
		})
	
	});
</script>
<body>
<div id = "wrap">
	<!-- 헤더 -->
	<header id="header">
		<div class="head_wrap">
			<!-- 로고 -->
				<h1 class="logo">
					<a href="./">
						<span>로고</span>
					</a>
				</h1>
				
			<!-- 메뉴 -->
				<div class="nav">
					<ul>
						<li class="depth1"><a href="electronicList">충전소찾기</a></li>
						<li class="depth1"><a href="notice/list">공지사항</a></li>
						<li class="depth1"><a href="cscf/add">건의하기</a></li>
						<li class="depth1"><a href="chargingStation/add">충전소등록</a></li>
					<c:if test="${sessionScope.member.id == 'admin'}">
						<li class="depth1"><a href="chargingStation/list">관리자목록</a></li>
					</c:if>
					</ul>
				</div>
					
			<!-- 로그인 -->
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
							
							<li class="log"><a href="logout" class="log">로그아웃</a></li>
							<li class="log"><a href="/mypage/" class="log">내 정보</a></li>
						</c:if>
					</ul>
				</div>	
			</div>
		</header>
	
	<!-- 메인 -->
	<div id="container">
		<div class="main_container">
		
		<div class="map_cont">
			<div class="all_wrap">
					</div>
				
					<div class="map_wrap">
					
						
						
						<div style="display: flex;">
							<div id="map" style="width:1920px;height:849px;">
						
							<div id="menu_wrap" class="list_area bg_white">
								<div class="search_wrap">
									<div class="search_one">
										<form onsubmit="searchPlaces(); return false;">
						                    <input type="text" id="keyword" size="30" placeholder="지역을 입력하세요" class="search_box">
						                    <button type="submit" class="bttn">
												<img src="/img/search_icon.png">
											</button>
						                </form>
									</div>
								</div>
						        <ul id="placesList"></ul>
						        <div id="pagination"></div>
							</div>
							
							<div id="floatingSticky" class="floating-sticky on" style="margin-top:653px; margin-left: 1807px;">
								<div class="menu-list">
									<div class="inner ui-draggable ui-draggable-handle">
										<a href="/cscf/add" class="btn-floating" onclick="floating_open();"><span>메뉴 보기</span></a>
									</div>
								</div>
								<button type="button" class="btn-gotop">
									<span>위로</span>
								</button>
							</div>
							</div>
						
						
							<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a163b9c1554276acb41e377bdbfa6b84&libraries=services"></script>
							<script>
								// 마커를 담을 배열입니다
								var markers = [];
								
								var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
								    mapOption = { 
								        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
								        level: 3 // 지도의 확대 레벨
								    };
								
								
								var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
								
								// 장소 검색 객체를 생성합니다
								var ps = new kakao.maps.services.Places();
								  
								
								
								// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
								var mapTypeControl = new kakao.maps.MapTypeControl();
								
								// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
								// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
								map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
								
								// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
								var zoomControl = new kakao.maps.ZoomControl();
								map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
								
								// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
								var infowindow = new kakao.maps.InfoWindow({zIndex:1});

								// 키워드로 장소를 검색합니다
								searchPlaces();
								
								function searchPlaces() {

								    var keyword = document.getElementById('keyword').value;
									keyword ="대전 동구 가양동 전기차충전소";
									
									$(".search_one > form").attr('onsubmit','searchPlaces1(); return false;');
									
								    if (!keyword.replace(/^\s+|\s+$/g, '')) {
								        alert('키워드를 입력해주세요!');
								        return false;
								    }

								    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
								    ps.keywordSearch( keyword, placesSearchCB); 
								}
								
								// 키워드 검색을 요청하는 함수입니다
								function searchPlaces1() {

								    var keyword = document.getElementById('keyword').value;
									keyword += " 전기차충전소";
									
								
								    if (!keyword.replace(/^\s+|\s+$/g, '')) {
								        alert('키워드를 입력해주세요!');
								        return false;
								    }

								    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
								    ps.keywordSearch( keyword, placesSearchCB); 
								}

								// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
								function placesSearchCB(data, status, pagination) {
								    if (status === kakao.maps.services.Status.OK) {

								        // 정상적으로 검색이 완료됐으면
								        // 검색 목록과 마커를 표출합니다
								        displayPlaces(data);

								        // 페이지 번호를 표출합니다
								        displayPagination(pagination);

								    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

								        alert('검색 결과가 존재하지 않습니다.');
								        return;

								    } else if (status === kakao.maps.services.Status.ERROR) {

								        alert('검색 결과 중 오류가 발생했습니다.');
								        return;

								    }
								}
								
								var positions = [];

								$.ajax("charInfo",{
									method:"GET",
									contentType:"application/json",
									dataType:"json",
									success: function(data){
										console.log(data);
										
									/*	$.each(data, function(index, item) { // 데이터 =item
											positions.push({
												title: item.name  ,
												content: '<div style="width:150px;">'+item.name+'</div>',
												latlng: new kakao.maps.LatLng(item.lat, item.lng)
											 });
										});
									*/
								
											for(var i = 0; i < data.length; i++){
													let imgSrc = '';
													if(data[i].images.length == 0){
				            							
				            						}else{
				            							imgSrc = '/upload/'+ data[i].images[0].uuid+'_'+data[i].images[0].filename;
				            						}
													
													positions.push({
														title: data[i].name  ,
														content: '<div class="wrap">' + 
											            '    <div class="info">' + 
											            '        <div class="title">' +
											            '<img src="img/car.png" width=80px height=55px target="_blank">'+
											                       	data[i].name + 
											            '        </div>' + 
											            '        <div class="body">' + 
											            '            <div class="img">' +
											            '                <img src="'+ imgSrc
											            						
											            								
											            				
											            				+'" width="83" height="80">' +
											            '           </div>' + 
											            '            <div class="desc">' +
											                            	data[i].address +
											                     			'<div class="ellipsis">'+                                
											                                '</div>'+
											                                '<div class="jibun ellipsis">'+
											                                data[i].organization +
											                                '</div>'+
											            '                <div class="link">'+data[i].tel+'</div>' + 
											            '				<div class="yasuo">'+data[i].availableTime+'</div>'+
											            '				<div class="yasuo">충전기 타입 : '+data[i].type +'</div>'+
											            '            </div>' + 
											            '        </div>' + 
											            '    </div>' +
											            '</div>',
														latlng: new kakao.maps.LatLng(data[i].lat, data[i].lng)
													 });
												}
									
										console.log(positions)
										var imageSrc = "/img/사설충전소마커.png"; 

								for (var i = 0; i < positions.length; i ++) {
								    
								    // 마커 이미지의 이미지 크기 입니다
								    var imageSize = new kakao.maps.Size(36, 40); 
								    
								    // 마커 이미지를 생성합니다    
								    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
								    
								    // 마커를 생성합니다
								    var marker = new kakao.maps.Marker({
								        map: map, // 마커를 표시할 지도
								        position: positions[i].latlng, // 마커를 표시할 위치
								        image : markerImage // 마커 이미지 
								    });
								    
								    var infowindow = new kakao.maps.InfoWindow({
								        content: positions[i].content, // 인포윈도우에 표시할 내용
								        removable: true
								    });
								    
								    
								    kakao.maps.event.addListener(marker, 'click', makeOverListener(map, marker, infowindow));												
								    
								    /* kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow)); */

								   
								}
								

								
									},
									error: function(){
										console.log('실패');
									}
								});
								
								// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
								function makeOverListener(map, marker, infowindow) {
								    return function() {
								    	
								        	infowindow.open(map, marker);

								    	
								    };
								}

								// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
								function makeOutListener(infowindow) {
								    return function() {
								        infowindow.close();
								    };
								}
								
								// 검색 결과 목록과 마커를 표출하는 함수입니다
								function displayPlaces(places) {

								    var listEl = document.getElementById('placesList'), 
								    menuEl = document.getElementById('menu_wrap'),
								    fragment = document.createDocumentFragment(), 
								    bounds = new kakao.maps.LatLngBounds(), 
								    listStr = '';
								    
								    // 검색 결과 목록에 추가된 항목들을 제거합니다
								    removeAllChildNods(listEl);

								    // 지도에 표시되고 있는 마커를 제거합니다
								    removeMarker();
								    
								    for ( var i=0; i<places.length; i++ ) {

								        // 마커를 생성하고 지도에 표시합니다
								        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
								            marker = addMarker(placePosition, i), 
								            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

								        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
								        // LatLngBounds 객체에 좌표를 추가합니다
								        bounds.extend(placePosition);

								        // 마커와 검색결과 항목에 mouseover 했을때
								        // 해당 장소에 인포윈도우에 장소명을 표시합니다
								        // mouseout 했을 때는 인포윈도우를 닫습니다
								        (function(marker, title) {
								            kakao.maps.event.addListener(marker, 'mouseover', function() {
								                displayInfowindow(marker, title);
								            });

								            kakao.maps.event.addListener(marker, 'mouseout', function() {
								                infowindow.close();
								            });

								            itemEl.onmouseover =  function () {
								                displayInfowindow(marker, title);
								            };

								            itemEl.onmouseout =  function () {
								                infowindow.close();
								            };
								        })(marker, places[i].place_name);

								        fragment.appendChild(itemEl);
								    }

								    // 검색결과 항목들을 검색결과 목록 Element에 추가합니다
								    listEl.appendChild(fragment);
								    menuEl.scrollTop = 0;

								    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
								    map.setBounds(bounds);
								}

								// 검색결과 항목을 Element로 반환하는 함수입니다
								function getListItem(index, places) {

								    var el = document.createElement('li'),
								    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
								                '<div class="info" >' +
								                '   <h5>' + places.place_name + '</h5>';

								    if (places.road_address_name) {
								        itemStr += '    <span>' + places.road_address_name + '</span>' +
								                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
								    } else {
								        itemStr += '    <span>' +  places.address_name  + '</span>'; 
								    }
								                 
								      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
								                '</div>';           

								    el.innerHTML = itemStr;
								    el.className = 'item';

								    return el;
								}

								// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
								function addMarker(position, idx, title) {
								    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
								        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
								        imgOptions =  {
								            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
								            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
								            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
								        },
								        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
								            marker = new kakao.maps.Marker({
								            position: position, // 마커의 위치
								            image: markerImage 
								        });

								    marker.setMap(map); // 지도 위에 마커를 표출합니다
								    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

								    return marker;
								}

								// 지도 위에 표시되고 있는 마커를 모두 제거합니다
								function removeMarker() {
								    for ( var i = 0; i < markers.length; i++ ) {
								        markers[i].setMap(null);
								    }   
								    markers = [];
								}

								// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
								function displayPagination(pagination) {
								    var paginationEl = document.getElementById('pagination'),
								        fragment = document.createDocumentFragment(),
								        i; 

								    // 기존에 추가된 페이지번호를 삭제합니다
								    while (paginationEl.hasChildNodes()) {
								        paginationEl.removeChild (paginationEl.lastChild);
								    }

								    for (i=1; i<=pagination.last; i++) {
								        var el = document.createElement('a');
								        el.href = "#";
								        el.innerHTML = i;

								        if (i===pagination.current) {
								            el.className = 'on';
								        } else {
								            el.onclick = (function(i) {
								                return function() {
								                    pagination.gotoPage(i);
								                }
								            })(i);
								        }

								        fragment.appendChild(el);
								    }
								    paginationEl.appendChild(fragment);
								}

								// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
								// 인포윈도우에 장소명을 표시합니다
								function displayInfowindow(marker, title) {
								    var content = '<div style="width:200px; padding:5px;z-index:1;">' + title + '</div>';

								    infowindow.setContent(content);
								    infowindow.open(map, marker);
								}

								 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
								function removeAllChildNods(el) {   
								    while (el.hasChildNodes()) {
								        el.removeChild (el.lastChild);
								    }
								}
							</script>
							</div>
						</div>
					</div>
						
					
				</div>
		</div>
	</div>
</body>
</html>