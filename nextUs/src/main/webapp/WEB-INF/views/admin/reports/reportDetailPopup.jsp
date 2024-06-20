<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>셀러 등록 요청 상세내용</title>
<link rel="shortcut icon" type="image/png"
	href="admin/assets/images/icon/favicon.ico">
<link rel="stylesheet" href="../resources/admin/assets/css/bootstrap.min.css">
<link rel="stylesheet" href="../resources/admin/assets/css/font-awesome.min.css">
<link rel="stylesheet" href="../resources/admin/assets/css/themify-icons.css">
<link rel="stylesheet" href="../resources/admin/assets/css/metisMenu.css">
<link rel="stylesheet" href="../resources/admin/assets/css/owl.carousel.min.css">
<link rel="stylesheet" href="../resources/admin/assets/css/slicknav.min.css">
<!-- amchart css -->
<link rel="stylesheet"
	href="https://www.amcharts.com/lib/3/plugins/export/export.css"
	type="text/css" media="all" />
<!-- others css -->
<link rel="stylesheet" href="../resources/admin/assets/css/typography.css">
<link rel="stylesheet" href="../resources/admin/assets/css/default-css.css">
<link rel="stylesheet" href="../resources/admin/assets/css/styles.css">
<link rel="stylesheet" href="../resources/admin/assets/css/responsive.css">
<!-- modernizr css -->
<script src="../resources/admin/assets/js/vendor/modernizr-2.8.3.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
.mydiv{
display: flex;
gap:20px;
}

</style>
</head>
<body>
<div id="preloader">
        <div class="loader"></div>
    </div>
	 <div class="col-md-6 mt-5">
			<div class="card">
				<div class="card-body">
					<h1 class="header-title" style="font-size:30px;">신고 상세내용</h1>
					
					<ul class="list-group" style="font-size:15px;">
					<c:forEach var="vo" items="${map.list}">
						신고자 이메일<li class="list-group-item">${vo.reportermemberEmail != null ? vo.reportermemberEmail : '(미입력)'} </li><br>
						글 작성자 이메일<li class="list-group-item">${vo.reportedmemberEmail != null ? vo.reportedmemberEmail : '(미입력)'}</li><br>
						신고 날짜<li class="list-group-item"><fmt:formatDate pattern="yyyy-MM-dd HH:MM" value="${vo.date}" /></li><br>
						상세내용<li class="list-group-item">${vo.content != null ? vo.content : '(미입력)'}</li>
					</c:forEach>
					</ul>
				</div>
			</div>
		</div>


	
	
	
	<button onclick="closePopup()" class="btn btn-secondary btn-lg btn-block" style="width:430px; margin-left:40px;'">닫기</button>






	<script>
		function closePopup() {
			window.close();
		}
	</script>
	
	
	<!-- jquery latest version -->
    <script src="../resources/admin/assets/js/vendor/jquery-2.2.4.min.js"></script>
    <!-- bootstrap 4 js -->
    <script src="../resources/admin/assets/js/popper.min.js"></script>
    <script src="../resources/admin/assets/js/bootstrap.min.js"></script>
    <script src="../resources/admin/assets/js/owl.carousel.min.js"></script>
    <script src="../resources/admin/assets/js/metisMenu.min.js"></script>
    <script src="../resources/admin/assets/js/jquery.slimscroll.min.js"></script>
    <script src="../resources/admin/assets/js/jquery.slicknav.min.js"></script>

    <!-- start chart js -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js"></script>
    <!-- start highcharts js -->
    <script src="https://code.highcharts.com/highcharts.js"></script>
    <!-- start zingchart js -->
    <script src="https://cdn.zingchart.com/zingchart.min.js"></script>
    <script>
    zingchart.MODULESDIR = "https://cdn.zingchart.com/modules/";
    ZC.LICENSE = ["569d52cefae586f634c54f86dc99e6a9", "ee6b7db5b51705a13dc2339db3edaf6d"];
    </script>
    <!-- all line chart activation -->
    <script src="../resources/admin/assets/js/line-chart.js"></script>
    <!-- all pie chart -->
    <script src="../resources/admin/assets/js/pie-chart.js"></script>
    <!-- others plugins -->
    <script src="../resources/admin/assets/js/plugins.js"></script>
    <script src="../resources/admin/assets/js/scripts.js"></script>
</body>
</html>