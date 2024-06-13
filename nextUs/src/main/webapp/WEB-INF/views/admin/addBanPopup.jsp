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
<link rel="stylesheet" href="../resources/css/admin/addbanPopup.css" />
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
			</select> <input type="text" name="searchWord" /> <input type="submit"
				value="검색">
		</form>
		<br>
		<form method="post" name="banForm" id="banForm" action="BAN.do">
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
						<td><input name="membernos" type="checkbox" value='${vo.no}'></td>
						<td>${vo.email != null ? vo.email : '(미입력)'}</td>
						<td>${vo.nickname != null ? vo.nickname : '(미입력)'}</td>
						<td class="date"><fmt:formatDate pattern="yyyy-MM-dd"
								value="${vo.regdate}" /></td>
						<td>${vo.reportcount != null ? vo.reportcount : '0'}</td>
						<td>
							<button class="rev_button" type="button">신고내역 보기</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div class="ban_lower">
		<div class="doBan" style="font-size: 30px;">
				제재 사유<br>
				<textarea name="content" id="content"></textarea>
				<br> 제재 기간 <input type="date" name="date" id="date"
					style="width: 345px; height: 50px; font-size: 20px"> <br>
				<br> <input type="submit" id="banSubmit" value="등록하기">

		</div>
	</div>

	</form>

</body>
</html>