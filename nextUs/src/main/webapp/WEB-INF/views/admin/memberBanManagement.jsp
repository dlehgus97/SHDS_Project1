<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 제재 내역</title>
<link rel="stylesheet" href="../resources/css/admin/adminMain.css" />
<link rel="stylesheet"
	href="../resources/css/admin/simpleTable.css" />
<script src="../resources/js/admin/memberBanManagement.js"></script>
<style>
	#memberBanManagement{color:purple;}
	#memberStatus_M{color:purple;}
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/admin/adminHeader.jsp" %>
	<div class="container">
		<div class="ad-menu">
			<%@ include file="/WEB-INF/views/admin/adminMenu.jsp"%>
		</div>
		<div class="m_right">
			<div class="header">
			
				<h2>회원 제재 내역</h2>
				<button class="button1" onclick="openPopup(); return false;">제재내역 추가</button>
			</div>
				<div class="bg-wh Ban_div">
				<table class="member_list">
						<colgroup>
							<col width="325px" />
							<col width="325px" />
							<col width="325px" />
							<col width="325px" />
						</colgroup>
						<thead>
							<tr>
								<th>번호</th>
								<th>이메일</th>
								<th>사유</th>
								<th>기간</th>
							</tr>
						</thead>
						<tbody>
							<!-- 테이블내용 작성 -->
						</tbody>
					</table>
				</div>

			
		</div>
	</div>

</body>
</html>