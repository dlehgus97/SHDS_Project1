<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠폰 발급 대상자 목록</title>
<link rel="stylesheet" href="../resources/admin/assets/css/bootstrap.min.css">
<link rel="stylesheet" href="../resources/admin/assets/css/font-awesome.min.css">
<link rel="stylesheet" href="../resources/admin/assets/css/themify-icons.css">
<link rel="stylesheet" href="../resources/admin/assets/css/metisMenu.css">
<link rel="stylesheet" href="../resources/admin/assets/css/owl.carousel.min.css">
<link rel="stylesheet" href="../resources/admin/assets/css/slicknav.min.css">
<!-- amchart css -->
<link rel="stylesheet" href="https://www.amcharts.com/lib/3/plugins/export/export.css" type="text/css" media="all" />
<!-- others css -->
<link rel="stylesheet" href="../resources/admin/assets/css/typography.css">
<link rel="stylesheet" href="../resources/admin/assets/css/default-css.css">
<link rel="stylesheet" href="../resources/admin/assets/css/styles.css">
<link rel="stylesheet" href="../resources/admin/assets/css/responsive.css">
<!-- modernizr css -->
<script src="../resources/admin/assets/js/vendor/modernizr-2.8.3.min.js"></script>
<script>
	window.onload = function() {
		var urlParams = new URLSearchParams(window.location.search);
		var data = urlParams.get('data');
		console.log('Received data:', data);
	};
</script>
<style>
	thead{ background-color:#333333;color:white}
	tbody tr:hover {
	background-color: #f1f1f1; /* 배경색 변경 */
}
</style>
</head>
<body>
	<div class="col-lg-6 mt-5">
		<div class="card">
			<div class="card-body">
				 <h3 id="dataValue"></h3>
				 <br>
				<div class="single-table">
					<div class="table-responsive">
						<table class="table table-bordered text-center">
							<thead class="text-uppercase">
								<tr>
									<th>이메일</th>
									<th>사용유무</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${empty map.list}">
									<tr>
										<td class="first" colspan="8">검색 결과가 없습니다.</td>
									</tr>
								</c:if>
								<c:if test="${!empty map.list }">
									<c:forEach var="vo" items="${map.list}">
										<tr>
											<td>${vo.memberEmail != null ? vo.memberEmail : '(미입력)'}</td>
											<td>${vo.status == 1?"사용 전":"사용함"}</td>
											<!-- 여기 뭔가 표현 바꿔야할듯 -->
										</tr>

									</c:forEach>
								</c:if>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	 <script>
        // 현재 URL 가져오기
        const currentUrl = window.location.href;

        // URL에서 파라미터 추출하기
        const urlParams = new URLSearchParams(currentUrl.split('?')[1]);
        const dataValue = urlParams.get('data');

        // h1 태그 안에 파라미터 값 넣기
        const h3Element = document.getElementById('dataValue');
        h3Element.textContent = dataValue;
    </script>
<script src="../resources/admin/assets/js/vendor/jquery-2.2.4.min.js"></script>
    <!-- bootstrap 4 js -->
    <script src="../resources/admin/assets/js/popper.min.js"></script>
    <script src="../resources/admin/assets/js/bootstrap.min.js"></script>
    <script src="../resources/admin/assets/js/owl.carousel.min.js"></script>
    <script src="../resources/admin/assets/js/metisMenu.min.js"></script>
    <script src="../resources/admin/assets/js/jquery.slimscroll.min.js"></script>
    <script src="../resources/admin/assets/js/jquery.slicknav.min.js"></script>

    <!-- others plugins -->
    <script src="../resources/admin/assets/js/plugins.js"></script>
    <script src="../resources/admin/assets/js/scripts.js"></script>



</body>
</html>