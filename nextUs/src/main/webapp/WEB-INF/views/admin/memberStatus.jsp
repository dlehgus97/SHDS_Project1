<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매자 정산 내역</title>
<link rel="stylesheet" href="../resources/css/adminMain.css" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap"
	rel="stylesheet">

</head>
<body>
	<div class="container">
		<div class="ad-menu">
			<%@ include file="/WEB-INF/views/admin/adminMenu.jsp"%>
		</div>
		<div class="m_right">
			<div class="member_up">
				<div class="bg-wh member_graph"></div>
				<div class="bg-wh member_graph"></div>
			</div>
			<div class="member_table">
				<div class="bg-wh member_table">
					<h2>회원 관리</h2>
					<form method="get" name="searchForm" id="searchForm"
						action="memberStatus.do">
						<select name="searchBy">
							<option value="id">아이디</option>
							<option value="name">이름</option>
							<option value="nickname">닉네임</option>
							<option value="gender">성별</option>
						</select> <input type="text" name="searchKeyword" /> <input type="submit"
							value="검색">
					</form>


					<table class="member_list">
						<colgroup>
							<col width="225px" />
							<col width="225px" />
							<col width="262px" />
							<col width="262px" />
							<col width="225px" />
						</colgroup>
						<thead>
							<tr>
								<th>아이디</th>
								<th>닉네임</th>
								<th>가입일</th>
								<th>최근 구매일(확정)</th>
								<th>누적 구매수</th>
							</tr>
						</thead>
						<tbody>

							<c:forEach var="vo" items="${map.list }">
								<tr>
									<td>${vo.id }</td>
									<td>${vo.nickname }</td>
									<td class="date"><fmt:formatDate value="${vo.regdate }"
											pattern="YYYY-MM-dd" /></td>
									<td class="date"><fmt:formatDate value="${vo.regdate }"
											pattern="YYYY-MM-dd" /></td>
									<td>${vo.readcnt }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>



				</div>
			</div>
		</div>
	</div>
</body>
</html>