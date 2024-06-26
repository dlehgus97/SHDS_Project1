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
					<h1 class="header-title" style="font-size:30px;">프로필</h1>
					
					<ul class="list-group" style="font-size:15px;">
					<c:forEach var="vo" items="${map.list}">
						이메일<li class="list-group-item">${vo.email != null ? vo.email : '(미입력)'} </li><br>
						닉네임<li class="list-group-item">${vo.nickname != null ? vo.nickname : '(미입력)'}</li><br>
						요청일자<li class="list-group-item"><fmt:formatDate pattern="yyyy-MM-dd HH:MM" value="${vo.regdate}" /></li><br>
						첨부파일<li class="list-group-item">${vo.file_org != null ? vo.file_org : '(미입력)'}</li>
					</c:forEach>
					</ul>
				</div>
			</div>
		</div>


	
	
	<div class="mydiv">
	<c:forEach var="vo" items="${map.list}">
		<form method="post" name="approve" id="approve" style="margin-left:40px;"
			action="requestApprove.do">
			<input name="memberno" type="hidden" value='${vo.memberno}'>
			<input name="bank" type="hidden" value='${vo.bank}'> <input
				name="account" type="hidden" value='${vo.account}'>
			<!-- 얘는 안보이게 no를 action에 넘겨주려고 -->
			<input class="btn btn-success btn-lg btn-block" type="submit" id="approve" value="승인" style="width:195px;">
		</form>
		<br>
		<form method="post" name="deny" id="deny" action="requestDeny.do">
			<input name="memberno" type="hidden" value='${vo.memberno}'>
			
			<!-- 얘는 안보이게 no를 action에 넘겨주려고 -->
			<input class="btn btn-danger btn-lg btn-block" type="submit" id="deny" value="승인거부" style="width:195px;">
		</form>
		</c:forEach>
	</div>
	<br>
	<button onclick="closePopup()" class="btn btn-secondary btn-lg btn-block" style="width:430px; margin-left:40px;'">닫기</button>




	
	<script>
        window.onbeforeunload = function() {
            window.opener.location.reload();
        };
        
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

  
    <!-- others plugins -->
    <script src="../resources/admin/assets/js/plugins.js"></script>
    <script src="../resources/admin/assets/js/scripts.js"></script>
</body>
</html>