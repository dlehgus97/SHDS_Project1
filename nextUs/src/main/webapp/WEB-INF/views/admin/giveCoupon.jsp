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
<link rel="stylesheet"
	href="../resources/css/admin/simpleTable.css" />
<link rel="stylesheet" href="../resources/css/admin/coupon2.css" />

<script src="../resources/js/admin/memberBanManagement.js"></script>
<script src="../resources/js/admin/coupon.js"></script>
<style>
	#couponManagement{color:purple;}
	#memberStatus_M{color:purple;}
</style>

</head>
<body>
<%@ include file="/WEB-INF/views/admin/adminHeader.jsp" %>
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
					<br>
					<form method="post" name="couponForm" id="couponForm" action="giveCoupon.do">
					&emsp;&ensp;&ensp;쿠폰 이름:&emsp;<input type="text" name="name"
						placeholder=' 쿠폰 이름을 입력하세요'/>&emsp;
						
					<input type="radio" class="fc" name="type" value=1 checked="checked">고정할인&emsp;
					<input type="radio" class="pc" name="type" value=2>%할인
			
					<br><br>
					
					&emsp;&ensp;&ensp;할&emsp;&nbsp;&emsp;인:&emsp;<input type="text" name="discount" placeholder='할인 금액(원)을 입력해주세요'/>
					<br><br>
					
					&ensp;&nbsp;&ensp;발급대상자: 
					
					<div class="target_list" style="overflow: auto;">
						<table class="member_list">
							<colgroup>
								<col width="240px" />
								<col width="380px" />
								<col width="380px" />
							</colgroup>
							<thead>
								<tr>
									<th><input id="selectAll" class="selectAll_button" type="checkbox"></th>
									<th>이메일</th>
									<th>닉네임</th>
								</tr>
							</thead>
							<tbody>

							<c:forEach var="vo" items="${memberlist.list}">
									<tr class="clickable-cell">
										<td><input class="target_button" name="memberEmails" type="checkbox" value='${vo.email}'></td>
										<td>${vo.email != null ? vo.email : '(미입력)'}</td>
										<td>${vo.nickname != null ? vo.nickname : '(미입력)'}</td>
									</tr>
							</c:forEach>
					</tbody>
				</table>
						
						
						
					</div>
					
					<input type="submit" value="쿠폰 지급">
				</form>
				</div>			
		</div>
	</div>
<script>
// 전체 선택/해제 기능
document.getElementById('selectAll').addEventListener('change', function(event) {
    var checkboxes = document.querySelectorAll('.target_button');
    checkboxes.forEach(function(checkbox) {
        checkbox.checked = event.target.checked;
    });
});

// 개별 선택/해제 기능
document.querySelectorAll('.clickable-cell').forEach(function(cell) {
    cell.addEventListener('click', function(event) {
        // 클릭된 셀이 td이면 그 안의 checkbox를 찾아서 상태 변경
        var checkbox = cell.querySelector('.target_button');
        if (checkbox) {
            checkbox.checked = !checkbox.checked;
        }
    });
});
//나중에 볼 재혁이형을 위하여:이게 행을 클릭해도 체크박스 체크되게 하려한건데
//웃긴건 체크박스를 직접 클릭하면 체크가 안댐요ㅋ
</script>

</body>
</html>