<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠폰 발급 내역</title>
<link rel="stylesheet" href="../resources/css/admin/adminMain.css" />
<link rel="stylesheet" href="../resources/css/admin/simpleTable.css" />
<link rel="stylesheet" href="../resources/css/admin/coupon.css" />
<script src="../resources/js/admin/memberBanManagement.js"></script>
<script src="../resources/js/admin/coupon.js"></script>
<style>
#couponManagement {
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
			<div class="header header2">
				<div class="c1" onclick="handleClick('c1')">쿠폰 발급 내역</div>
				<div class="c2" onclick="handleClick('c2')">쿠폰 지급</div>
			</div>
			<div class="bg-wh Ban_div">
				<table class="member_list">
					<colgroup>
						<col width="220px" />
						<col width="300px" />
						<col width="260px" />
						<col width="260px" />
						<col width="260px" />
					</colgroup>
					<thead>
						<tr>
							<th>번호</th>
							<th>쿠폰이름</th>
							<th>유형</th>
							<th>할인액/할인율</th>
							<th>발급 대상자</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${empty coupon.list}">
							<tr>
								<td class="first" colspan="8">발급된 쿠폰이 없습니다.</td>
							</tr>
						</c:if>
						<c:if test="${!empty coupon.list }">
							<c:forEach var="vo" items="${coupon.list}">

								<tr>
									<td>${vo.no }</td>
									<td>${vo.name }</td>
									<td>${vo.type == 1?"고정할인":"%할인"}</td>
									<td><c:choose>
											<c:when test="${vo.type == 1}">
												${vo.discount}원
           									</c:when>

											<c:otherwise>
           										${vo.discount}%
        									</c:otherwise>
										</c:choose>
									</td>
									<td>
										<button class="look_button" type="button">보기</button>
									</td>

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