<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${pageTitle}</title>

<link rel="stylesheet" type="text/css" href="/resources/css/footer.css">
<link rel="stylesheet" type="text/css" href="/resources/css/header.css">
<link rel="stylesheet" href="/resources/css/reset.css"/>
<link rel="stylesheet" href="/resources/css/style.css"/>
<link rel="stylesheet" href="/resources/css/contents.css"/>



<style>

    #map {
        width: 80%; /* 맵의 너비를 80%로 설정 */
        height: 500px; /* 맵의 높이를 고정값으로 설정 */
        margin-top: 20px; /* 위쪽 여백 추가 */
        margin-bottom: 20px; /* 아래쪽 여백 추가 */
    }
</style>

</head>
<body>
	<div class="wrap">
		<%@ include file="/WEB-INF/views/include/header.jsp" %>
    <div id="map" style="width: 500px; height: 400px;"></div> 
    
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=265c623ea9e9ac2c92eb2a25f35d5fb1"></script>
    <script type="text/javascript">
        var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
        var options = { //지도를 생성할 때 필요한 기본 옵션
            center: new kakao.maps.LatLng(37.55935629955787 , 126.92263065644309), //지도의 중심좌표.
            level: 3 //지도의 레벨(확대, 축소 정도)
        };

        var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
        
        var marker = new kakao.maps.Marker({ 
            // 지도 중심좌표에 마커를 생성합니다 
            position: map.getCenter() 
        }); 
        // 지도에 마커를 표시합니다
        marker.setMap(map);
    </script>
    <%@ include file="/WEB-INF/views/include/footer.jsp" %>
    </div>
		
</body>
</html>
