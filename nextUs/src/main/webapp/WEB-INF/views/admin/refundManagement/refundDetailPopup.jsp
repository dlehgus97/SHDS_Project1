<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>환불 상세 | Admin</title>
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
.mydiv {
	display: flex;
	gap: 10px;
	margin-left:0px;
}

.cont {
	display: flex;
	justify-content: space-between; /* left와 right를 좌우로 정렬 */
}

.left {
	width: 50%; /* 좌측 영역의 너비 */
	padding: 10px;
}

.right {
	width: 50%; /* 우측 영역의 너비 */
	padding: 10px; /* 내부 여백 설정 */
}
.inner{
margin-top:79px;
}
textarea{
  border: 1.5px solid #dcdcdc; 
        border-radius: 5px; 
        font-size: 14px; 
}
</style>
</head>
<body>
<div id="preloader">
        <div class="loader"></div>
    </div>
    
    
    <div class="cont">
		<div class="left">
			<div class="card">
				<div class="card-body">
					<h1 class="header-title" style="font-size: 30px;">요청사항</h1>

					<ul class="list-group" style="font-size: 15px;">
						<c:forEach var="vo" items="${map.list}">
						구매번호<li class="list-group-item">${vo.buyno != null ? vo.buyno : '(미입력)'}번
							</li>
							<br>
						요청자 이메일<li class="list-group-item">${vo.email != null ? vo.email : '(미입력)'}
							</li>
							<br>
						요청 금액<li class="list-group-item">${vo.refund_amount != null ? vo.refund_amount : '(미입력)'}</li>
							<br>
						요청 일자<li class="list-group-item"><fmt:formatDate
									pattern="yyyy-MM-dd HH:MM" value="${vo.date}" /></li>
							<br>
						상세 내용<li class="list-group-item"
								style="min-height: 170px; overflow-y: auto;">${vo.content != null ? vo.content : '(미입력)'}</li>
						</c:forEach>
					</ul>
				</div>
			</div>








		</div>
		<div class="right">
			<div class="mydiv">
				<c:forEach var="vo" items="${map.list}">
					<form method="post" name="approve" id="approve" class="actionForm"
						style="margin-left: 0px;" action="refund.do">
						<div class="inner">
							답변 작성하기
							<textarea cols="50" rows="10" placeholder=" 답변을 입력해주세요"
								name="reply"id="reply" style="width: 400px; height: 400px;"></textarea>
						</div>
						<input name="buyno" type="hidden" id="buyno" value='${vo.buyno}'>
						<input name="refundno" type="hidden" id="refundno" value='${vo.refundno}'>
						<!-- 얘는 안보이게 no를 action에 넘겨주려고 -->
						<input class="btn btn-success btn-lg btn-block" type="submit"
							id="approve" value="환불승인" style="width: 400px;">
					</form>
				</c:forEach>
			</div>
			<br>
			<button onclick="closePopup()"
				class="btn btn-secondary btn-lg btn-block" style="width: 400px;">닫기</button>
		</div>

	</div>
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