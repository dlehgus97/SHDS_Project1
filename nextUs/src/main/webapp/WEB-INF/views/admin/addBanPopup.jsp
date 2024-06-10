<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제재 내역 추가</title>
<link rel="stylesheet" href="../resources/css/admin/memberStatus.css" />
<link rel="stylesheet" href="../resources/css/admin/banPopup.css" />
<script src="../resources/js/admin/memberStatus.js"></script>
</head>
<body>
	<h2>제재 내역 추가</h2>
	<hr>
	<div class="ban_upper">
		<form method="get" name="searchForm" id="searchForm"
			action="addBanPopup.do">
			<select name="searchType">
				<option value="all">전체</option>
				<option value="email">이메일</option>
				<option value="nickname">닉네임</option>
			</select>
			<input type="text" name="searchWord" />
			<input type="submit" value="검색">
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
					<th><input type="checkbox" name="select" id="chkRowAll"></th>
					<th>이메일</th>
					<th>닉네임</th>
					<th>가입일</th>
					<th>누적 신고횟수</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="vo" items="${map.list }">
					<tr>
						<td align="center"><input type="checkbox" name="select"
							id="chkRow"></td>
						<td align="center">${vo.email }</td>
						<td align="center">${vo.nickname }</td>
						<td align="center" class="date"><fmt:formatDate
								value="${vo.regdate }" pattern="YYYY-MM-dd" /></td>
						<td align="center"></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div class="ban_lower">
		<div class="doBan">
		<form method="get" name="banForm" id="banForm" action="banMember.do" style="font-size:30px;">
			제재 사유<br>
			<textarea name="context" id="context"></textarea><br>
			제재 기간
			<input type="date" name = "date" id="date" style="width:345px;height:50px;font-size:20px">
			<br><br>
			<input type="submit" id="banSubmit" value="등록하기">
			
		</form>
		</div>
	</div>
	


</body>
</html>