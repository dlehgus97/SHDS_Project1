<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠폰 발급 대상자 목록</title>
<link rel="stylesheet"
	href="../resources/css/admin/couponMemberPopup.css" />

<script>
	window.onload = function() {
		var urlParams = new URLSearchParams(window.location.search);
		var data = urlParams.get('data');
		console.log('Received data:', data);
	};
</script>
</head>
<body>
	<div class="container">
		<div class="title">
			<h1>쿠폰 발급 대상자 목록</h1>
		</div>
		<table class="member_list">
			<colgroup>
				<col width="200px" />
				<col width="200px" />
			</colgroup>
			<thead>
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
							<td>${vo.status == 1?"사용 전":"사용함"}</td><!-- 여기 뭔가 표현 바꿔야할듯 -->
						</tr>

					</c:forEach>
				</c:if>
			</tbody>
		</table>
	</div>




</body>
</html>