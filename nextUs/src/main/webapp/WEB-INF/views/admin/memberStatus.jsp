<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 현황</title>
<link rel="stylesheet" href="../resources/css/admin/adminMain.css" />
<link rel="stylesheet" href="../resources/css/admin/memberStatus.css" />
<script src="../resources/js/admin/memberStatus.js"></script>
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
			
				<div class="bg-wh member_table">
					<br>
					<form method="get" name="searchForm" id="searchForm" action="memberStatus.do">
						회원관리
						<select name="searchType">
							<option value="all">전체</option>
							<option value="no">번호</option>
							<option value="email">이메일</option>
							<option value="nickname">닉네임</option>
							<option value="gender">성별</option>
						</select>
						<input type="text" name="searchWord" />
						<input type="submit" value="검색">
					</form>


					<table class="member_list">
						<colgroup>
							<col width="200px" />
							<col width="200px" />
							<col width="200px" />
							<col width="230px" />
							<col width="230px" />
							<col width="200px" />
						</colgroup>
						<thead>
							<tr>
								<th>번호</th>
								<th>이메일</th>
								<th>닉네임</th>
								<th>가입일</th>
								<th>최근 구매일(확정)</th>
								<th>누적 구매수</th>
							</tr>
						</thead>
						<tbody>

							<c:forEach var="vo" items="${map.list }">
								<tr>
									<td align="center">${vo.no }</td>
									<td align="center">${vo.email }</td>
									<td align="center">${vo.nickname }</td>
									<td align="center" class="date"><fmt:formatDate value="${vo.regdate }"
											pattern="YYYY-MM-dd" /></td>
									<td align="center" class="date"><fmt:formatDate value="${vo.regdate }"
											pattern="YYYY-MM-dd" /></td>
									<td align="center">0</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>



				</div>
			</div>
		</div>
	
</body>
</html>