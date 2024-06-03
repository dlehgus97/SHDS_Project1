<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="/css/admin.css" type="text/css" />
<style>
.menu {
	list-style-type: none;
	margin: 0;
	padding: 0;

	height: 100%; /* 메뉴를 전체 높이로 설정 */
	display: flex;
	flex-direction: column;
	align-items: center; /* 자식 요소를 수직 중앙 정렬 */
}

.menu li {
	width: auto; /* 리스트 아이템의 너비를 자동으로 설정 */
	list-style-type: none; /* li 태그의 점을 없앰 */
	display: flex;
	justify-content: center; /* 자식 요소를 수평 중앙 정렬 */
	margin: 13px 0; /* li 요소의 위아래에 간격 추가 */
	height: 12%;
	width: 100%;
}
.menu li a {
	display: block;
	color: black;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
	background-color: #ffffff;
	width: 100%; /* 링크의 너비를 리스트 아이템의 너비에 맞춤 */
}
.menu li a:hover {
	background-color: #dddddd;
}




.menu li ul {
    display: none; /* 하위 ul 요소 숨기기 */
    position: absolute;
    background-color: #f9f9f9;
    min-width: 15%;
}

.menu li:hover ul {
    display: block; /* 부모 li에 마우스를 올렸을 때 하위 ul 요소 보이기 */
}

</style>
</head>
<body>
	<div class="menu">
		<ul>
			<li><a href="#">메인화면</a></li>
			<li><a href="#">정산관리</a>
				<ul>
					<li><a href="#">판매자 정산 내역</a></li>
					<li><a href="#">매출 통계</a></li>
				</ul>
			</li>
			<li><a href="#">셀러관리</a>
				<ul>
					<li><a href="#">샐러 등록 관리</a></li>
					<li><a href="#">샐러 제재 관리</a></li>
				</ul>
			</li>
			<li><a href="#">회원관리</a>
				<ul>
					<li><a href="#">회원 현황</a></li>
					<li><a href="#">회원 제재 관리</a></li>
					<li><a href="#">쿠폰관리</a></li>
				</ul>
			</li>
			<li><a href="#">상품관리</a></li>
			<li><a href="#">거래관리</a></li>
			<li><a href="#">고객센터</a>
				<ul>
					<li><a href="#">공지사항</a></li>
					<li><a href="#">고객센터(Q&A)</a></li>
					<li><a href="#">자주 묻는 질문(FAQ)</a></li>
					<li><a href="#">이벤트</a></li>
				</ul>
			</li>
			<li><a href="#">신고접수내역</a></li>
		</ul>
	</div>
</body>
</html>