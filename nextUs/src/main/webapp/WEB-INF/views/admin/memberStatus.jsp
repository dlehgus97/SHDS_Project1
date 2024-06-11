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
<style>
#memberStatus {
	color: purple;
}

#memberStatus_M {
	color: purple;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/admin/adminHeader.jsp"%>
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
				<form method="get" name="searchForm" id="searchForm"
					action="memberStatus.do">
					&ensp;회원조회 <select name="searchType">
						<option value="all">전체</option>
						<option value="no">번호</option>
						<option value="email">이메일</option>
						<option value="nickname">닉네임</option>
						<option value="gender">성별</option>
					</select> <input type="text" name="searchWord" /> <input type="submit"
						value="검색">
				</form>

				<br>
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

						<c:if test="${empty member.list}">
							<tr>
								<td class="first" colspan="8">검색 결과가 없습니다.</td>
							</tr>
						</c:if>
						<c:if test="${!empty member.list }">
							<c:forEach var="vo" items="${member.list}">
								
									<tr>
										<td>${vo.no != null ? vo.no : '(미입력)'}</td>
										<td>${vo.email != null ? vo.email : '(미입력)'}</td>
										<td>${vo.nickname != null ? vo.nickname : '(미입력)'}</td>
										<td class="date"><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${vo.regdate}" /></td>
										<!-- 최근구매일로 바꾸기 -->
										<td class="date"><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${vo.regdate}" /></td>
										<!-- 누적구매수로 바꾸기 -->
										<td>${vo.purchaseCount}</td>
									</tr>
								

							</c:forEach>
						</c:if>
					</tbody>
				</table>



			</div>
		</div>
	</div>

</body>
</html>