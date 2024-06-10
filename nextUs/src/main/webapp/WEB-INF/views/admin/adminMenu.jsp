<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../resources/css/admin/adminMenu.css" />

</head>

<body>
	<div class="left-side-bar">
		<ul>
			<li><a id="adminMain" href="/adminMain">메인화면</a></li>
			<li><a id="sellerSettlement_M" href="/sellerSettlement">정산관리</a>
				<ul>
					<li><a id="sellerSettlement" href="/sellerSettlement">판매자 정산 내역</a></li>
					<li><a id="saleStatement" href="/saleStatement">매출 통계</a></li>
				</ul>
			</li>
			<li><a id="sellerRegistManagement_M" href="/sellerRegistManagement">셀러관리</a>
				<ul>
					<li><a id="sellerRegistManagement" href="/sellerRegistManagement">샐러 등록 관리</a></li>
					<li><a id="sellerBanManagement" href="/sellerBanManagement">샐러 제재 관리</a></li>
				</ul>
			</li>
			<li><a id="memberStatus_M" href="/memberStatus">회원관리</a>
				<ul>
					<li><a id="memberStatus" href="/memberStatus">회원 현황</a></li>
					<li><a id="memberBanManagement" href="/memberBanManagement">회원 제재 관리</a></li>
					<li><a id="couponManagement" href="/couponManagement">쿠폰관리</a></li>
				</ul>
			</li>
			<li><a id="productManagement" href="/productManagement">상품관리</a></li>
			<li><a id="refundRequest" href="/refundRequest">환불관리</a></li>
			
			<li><a id="serviceCenter" href="/notice">고객센터</a>
				<ul>
					<li><a id="notice" href="/notice">공지사항</a></li>
					<li><a id="QnA" href="/QnA">고객센터(Q&A)</a></li>
					<li><a id="FaQ" href="/FaQ">자주 묻는 질문(FAQ)</a></li>
					<li><a id="event" href="/event">이벤트</a></li>
				</ul>
			</li>
			<li><a id="report" href="/report">신고접수내역</a></li>
		</ul>
	</div>
	
</body>



</html>
