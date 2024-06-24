<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>관리자 메인 페이지</title>
<link rel="stylesheet" href="../resources/css/admin/memberStatus.css" />
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.18/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.jqueryui.min.css">
</head>
<body>
	<div id="preloader">
		<div class="loader"></div>
	</div>
	<div class="page-container">
		<%@ include file="/WEB-INF/views/admin/adminMenu.jsp"%>
		<div class="main-content" style="background-color: #485465;">
			<%@ include file="/WEB-INF/views/admin/adminHeader.jsp"%>

			<div class="main-content-inner">
				<div class="row">
					<div class="col-12 mt-5">
						<div class="card">
							<div class="card-body">
							
							<h1 class="header-title" style="font-size: 35px">제목</h1>
								<!-- 여기에 작성해라 -->




							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<%@ include file="/WEB-INF/views/admin/adminFooter.jsp"%>
	</div>



<!-- bootstrap -->
<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
<script src="https://cdn.datatables.net/1.10.18/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.18/js/dataTables.bootstrap4.min.js"></script>
<script src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.min.js"></script>
<script src="https://cdn.datatables.net/responsive/2.2.3/js/responsive.bootstrap.min.js"></script>

</body>
</html>