<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>샐러 제재 내역</title>
<link rel="stylesheet" href="../resources/css/admin/adminMain.css" />
<link rel="stylesheet"
	href="../resources/css/admin/simpleTable.css" />
<script src="../resources/js/admin/memberBanManagement.js"></script>
<style>
	#report{color:purple;}
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
			
				<h2>신고접수내역</h2>
			</div>
				<div class="bg-wh Ban_div">
				<table class="member_list">
						<colgroup>
							<col width="236px" />
							<col width="306px" />
							<col width="236px" />
							<col width="276px" />
							<col width="246px" />
						</colgroup>
						<thead>
							<tr>
								<th>신고번호</th>
								<th>아이디</th>
								<th>글 유형</th>
								<th>신고 날짜</th>
								<th>상세내용</th>
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