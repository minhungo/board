<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link href="${path}/resources/css/spcss.css" rel="stylesheet"/> 	
<meta name="viewport" content="width=device=width, initial-scale=1.0">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=DynaPuff&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/d21710f86c.js" 
crossorigin="anonymous">
</script>		
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Roboto+Condensed:wght@700&display=swap" rel="stylesheet">
<style>

p > a {
color:black;
}

p > a:hover {
color:black;
}


.wrap {
	position: absolute;
	left: 0;
	bottom: 40px;
	width: 288px;
	height: 132px;
	margin-left: -144px;
	text-align: left;
	overflow: hidden;
	font-size: 12px;
	font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
	line-height: 1.5;
}

.wrap * {
	padding: 0;
	margin: 0;
}

.wrap .info {
	width: 286px;
	height: 120px;
	border-radius: 5px;
	border-bottom: 2px solid #ccc;
	border-right: 1px solid #ccc;
	overflow: hidden;
	background: #fff;
}

.wrap .info:nth-child(1) {
	border: 0;
	box-shadow: 0px 1px 2px #888;
}

.info .title {
	padding: 5px 0 0 10px;
	height: 30px;
	background: #eee;
	border-bottom: 1px solid #ddd;
	font-size: 18px;
	font-weight: bold;
}

.info .close {
	position: absolute;
	top: 10px;
	right: 10px;
	color: #888;
	width: 17px;
	height: 17px;
	background:
		url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');
}

.info .close:hover {
	cursor: pointer;
}

.info .body {
	position: relative;
	overflow: hidden;
}

.info .desc {
	position: relative;
	margin: 13px 0 0 90px;
	height: 75px;
}

.desc .ellipsis {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.desc .jibun {
	font-size: 11px;
	color: #888;
	margin-top: -2px;
}

.info .img {
	position: absolute;
	top: 6px;
	left: 5px;
	width: 73px;
	height: 71px;
	border: 1px solid #ddd;
	color: #888;
	overflow: hidden;
}

.info:after {
	content: '';
	position: absolute;
	margin-left: -12px;
	left: 50%;
	bottom: 0;
	width: 22px;
	height: 12px;
	background:
		url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')
}

.info .link {
	color: #5085BB;
}

</style>
</head>

<body>
<c:import url="header.jsp"/>
<hr style="height:3px; ">
	<div class="container" style="margin:80px auto;">
		<div class="row">
			<div class="col" style="width:500px; height:500px;">

				<div class="main_image" >
      			<h1 style="font-size:60px; margin-bottom:60px;">Contact Us</h1>
					<p  style="font-size:20px;">
					<span style="font-weight:bold;">Our Address:</span><br>15, Jong-ro 12-gil, Jongro-gu,<br> Seoul, Republic of Korea<br><br></p>
					<p  style="font-size:20px;">
					<span style="font-weight:bold;">Out HomePage:</span><br><a href="https://soldesk.com/">https://soldesk.com</a></p>
			</div>
			<div class="container row"  style="text-align:center; margin-top:80px; margin-left:-100px;" >
		<div class="container col"><i class="fa-sharp fa-solid fa-phone fa-3x" style="width:100px;"></i><br><br><span style="margin-top:200px; padding:auto; font-size:20px;">010-1234-5678</span></div>
		<div class="container col"><i class="fa-sharp fa-solid fa-envelope-open-text fa-3x"></i><br><br><span style="margin-top:200px; padding:auto; font-size:20px;">Email@naver.com</span></div>
		</div>
			</div>
		
		<div class="col">

		<div id="map"
			style="width: 700px; height: 500px; margin-left: auto; margin-right: auto; position: relative; overflow: hidden; border:2px solid black;"></div>

		<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e77525e38509739b132e4342779f32c4"></script>
		<script>
			var mapContainer = document.getElementById('map'), // 지도의 중심좌표
			mapOption = {
				center : new kakao.maps.LatLng(37.569406667112155,
						126.98609971827726), // 지도의 중심좌표
				level : 3
			// 지도의 확대 레벨
			};

			var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
			
			// 지도에 마커를 표시합니다 
			var marker = new kakao.maps.Marker({
				map : map,
				position : new kakao.maps.LatLng(37.569406667112155,
						126.98609971827726)
			});
			
			// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
			var zoomControl = new kakao.maps.ZoomControl();
			map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
			
			

			// 커스텀 오버레이에 표시할 컨텐츠 입니다
			// 커스텀 오버레이는 아래와 같이 사용자가 자유롭게 컨텐츠를 구성하고 이벤트를 제어할 수 있기 때문에
			// 별도의 이벤트 메소드를 제공하지 않습니다 
			var content = '<div class="wrap">'
					+ '    <div class="info">'
					+ '        <div class="title">'
					+ '            솔데스크 종로 본원'
					+ '            <div class="close" onclick="closeOverlay()" title="닫기"></div>'
					+ '        </div>'
					+ '        <div class="body">'
					+ '            <div class="img">'
					+ '                <img src="resources/image/soldesk.png" width="73" height="70">'
					+ '           </div>'
					+ '            <div class="desc">'
					+ '                <div class="ellipsis">서울 종로구 종로12길 15</div>'
					+ '                <div class="jibun ellipsis">(우) 03190(지번) 관철동 13-13</div>'
					+ '                <div><a href="https://soldesk.com/index.asp" target="_blank" class="link">홈페이지</a></div>'
					+ '            </div>' + '        </div>' + '    </div>'
					+ '</div>';

			// 마커 위에 커스텀오버레이를 표시합니다
			// 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
			var overlay = new kakao.maps.CustomOverlay({
				content : content,
				map : map,
				position : marker.getPosition()
			});

			// 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
			kakao.maps.event.addListener(marker, 'click', function() {
				overlay.setMap(map);
			});

			// 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
			function closeOverlay() {
				overlay.setMap(null);
			}
		</script>
	</div>
		
	</div>
	</div>
	<br><br>
	<hr style="margin-left:200px; margin-right:200px; margin-bottom:50px;">
	
<c:import url="footer.jsp"/>
	<script type="text/javascript" src="${path}/resources/js/js.js"></script>

</body>
</html>



