<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품관리</title>
<link rel="stylesheet" href="../resources/css/admin/adminMain.css" />
<link rel="stylesheet"
	href="../resources/css/admin/productManagement.css" />
<script src="../resources/js/admin/memberStatus.js"></script>
<style>
#productManagement {
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
		<div class="right">
			<div class="bg-wh product_div">
				<h1 style="margin-left: 30px; margin-top: 10px; font-size: 30px;">판매글
					관리</h1>
				<form method="get" name="productManagement" id="productManagement"
					action="">
					<!-- action입력 -->
					<select name="searchType">
						<option value="all">전체</option>
						<option value="title">제목</option>
						<option value="seller">작성자</option>
					</select>&emsp;
					<input type="text" name="searchWord" />&emsp;
					<input type="submit" value="검색">
				</form>
				<br>
				<table class="product_list">
					<colgroup>
						<col width="180px" />
						<col width="280px" />
						<col width="200px" />
						<col width="230px" />
						<col width="230px" />
						<col width="260px" />
					</colgroup>
					<thead>
						<tr>
							<th>글번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>게시일</th>
							<th>조회수</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${empty selllist.list}">
							<tr>
								<td class="first" colspan="8">검색 결과가 없습니다.</td>
							</tr>
						</c:if>
						<c:if test="${!empty selllist.list }">
							<c:forEach var="vo" items="${selllist.list}">
								<tr>
									<td>${vo.sellno != null ? vo.sellno : '(미입력)'}</td>
									<td>${vo.title != null ? vo.title : '(미입력)'}</td>
									<td>${vo.sellerName != null ? vo.sellerName : '(미입력)'}</td>
									<td class="date"><fmt:formatDate
											pattern="yyyy-MM-dd" value="${vo.postdate}" /></td>
									<td>${vo.view_cnt != null ? vo.view_cnt : '0'}</td>
									<td>
									<button class="rev_button" type="button" onclick="goToSellPage(${vo.sellno})">판매글 보기</button>
									<button class="del_button" type="button">삭제</button>
									</td>
								</tr>


							</c:forEach>
						</c:if>
					</tbody>
				</table>

			</div>
		</div>
	</div>
	
	
	<script>
    function goToSellPage(sellno) {
        var sellPageUrl = '/selllist/view.do?no=' + sellno;
        window.location.href = sellPageUrl;
    }
</script>
</body>
</html>