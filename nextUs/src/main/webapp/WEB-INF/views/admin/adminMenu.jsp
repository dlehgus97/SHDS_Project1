<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html class="no-js" lang="en">
<head>
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">

<meta name="viewport" content="width=device-width, initial-scale=1">
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

</head>
<body>

	<!-- sidebar menu area start -->
	<div class="sidebar-menu">
		<div class="sidebar-header">
			<div class="logo">
				<a href="/adminMain"><img src="../resources/imgs/nexus2.png" alt="logo"></a>
			</div>
		</div>
		<div class="main-menu">
			<div class="menu-inner">
				<nav>
					<ul class="metismenu" id="menu">
						<li><a href="/adminMain"><i class="ti-dashboard"></i> <span>메인메뉴</span></a></li>
					
						<li><a href="javascript:void(0)" aria-expanded="true"><i class="ti-layers-alt"></i><span>회원관리</span></a>
							<ul class="collapse">
								<li><a href="/memberStatus">회원 현황</a></li>
								<li><a href="/memberBanManagement">회원 제재 관리</a></li>
								 <li><a href="#" aria-expanded="true">쿠폰관리</a>
                                        <ul class="collapse">
                                            <li><a href="/couponManagement">쿠폰발급 내역</a></li>
                                            <li><a href="/giveCoupon">쿠폰 지급</a></li>
                                        </ul>
                                    </li>
							</ul>
						</li>
						
						<li>
							<a href="javascript:void(0)"aria-expanded="true">
							<i class="ti-layers-alt"></i>
							<span>셀러관리</span><span>
							<c:if test="${sellerRequestMap.countUnapproved > 0}">
                				<img src="../resources/imgs/alarm.png" alt="New" style="width:16px;height:16px;"/>
           					</c:if></span>
							</a>
							<ul class="collapse">
								<li><a href="/sellerRequestManagement">셀러 등록 관리<span>
								<c:if test="${sellerRequestMap.countUnapproved > 0}">
                					<img src="../resources/imgs/alarm.png" alt="New" style="width:16px;height:16px;"/>
           						</c:if>
           						</span></a></li>
								<li><a href="/sellerBanManagement">셀러 제재 관리</a></li>
							</ul>
						</li>
						
						
						<li><a href="/sellerSettlement"><i class="fa fa-calculator"></i> <span>판매자 정산 내역</span></a></li>
						
						<li><a href="/productManagement"><i class="fa fa-table"></i> <span>상품관리</span></a></li>
						<li><a href="/refundRequest"><i class="fa fa-table"></i> <span>환불관리</span></a></li>
						<li><a href="/report"><i class="fa fa-exclamation-triangle"></i> <span>신고접수내역</span></a></li>
						
						<li><a href="javascript:void(0)" aria-expanded="true"><i class="ti-slice"></i><span>고객센터</span></a>
							<ul class="collapse">
								<li><a href="/notice.do">공지사항</a></li>
								<li><a href="/adqna/index.do">고객센터(Q&A)</a></li>
								<li><a href="/adfaq/index.do">자주 묻는 질문(FAQ)</a></li>
								<li><a href="/adevent/index.do">이벤트</a></li>
							</ul>
						</li>
						
					</ul>
				</nav>
			</div>
		</div>
	</div>



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
