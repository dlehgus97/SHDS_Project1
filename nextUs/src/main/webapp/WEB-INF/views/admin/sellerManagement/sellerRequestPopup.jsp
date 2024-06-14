<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>셀러 등록 요청 상세내용</title>
</head>
<body>
	<h1>승인요청</h1>

	<c:forEach var="vo" items="${map.list}">
				이메일: ${vo.email != null ? vo.email : '(미입력)'} <br>
				닉네임: ${vo.nickname != null ? vo.nickname : '(미입력)'} <br>
				요청일자: <fmt:formatDate pattern="yyyy-MM-dd HH:MM"
			value="${vo.regdate}" />
		<br>
				첨부파일<br>
				${vo.file_no != null ? vo.file_no : '(미입력)'}
	
	
	<form method="post" name="approve" id="approve"
			action="requestApprove.do">
			<input name="memberno" type="hidden" value='${vo.memberno}'>
			<input name="bank" type="hidden" value='${vo.bank}'>
			<input name="account" type="hidden" value='${vo.account}'>
			<!-- 얘는 안보이게 no를 action에 넘겨주려고 -->
			<input type="submit" id="approve" value="승인">
		</form>

		<form method="post" name="deny" id="deny" action="requestDeny.do">
			<input name="no" type="hidden" value='${vo.no}'>
			<!-- 얘는 안보이게 no를 action에 넘겨주려고 -->
			<input type="submit" id="deny" value="승인거부">
		</form>

	</c:forEach>
	<button onclick="closePopup()">닫기</button>






	<script>
		function closePopup() {
			window.close();
		}
	</script>
</body>
</html>