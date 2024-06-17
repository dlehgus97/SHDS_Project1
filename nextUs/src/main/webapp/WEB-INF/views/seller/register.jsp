<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>셀러 등록 신청하기 | 재능판매의 연결체 NEXtUS !</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/footer.css">
<link rel="stylesheet" type="text/css" href="/resources/css/header.css">
<link rel="stylesheet" type="text/css" href="/resources/css/seller/regist.css">
</head>
<body>
<%@ include file="/WEB-INF/views/include/header.jsp" %>

	<div id="regist_container">
		<div id="regist_warn_container">
			<h1>셀러 자격 요건</h1>
			<p>제출물에 적절한 기술이 명시됐나요?</p>
			<p>ex) 개발의 경우, 개발 기술이 적용 된 결과물 예시 혹은 적용된 상세 기술</p><br>
			<p>포트폴리오의 경우 .pdf 파일로 업로드 해주시기 바랍니다. (최대 크기 20mb)</p>
			<p>
				포트폴리오의 용량이 초과하는 경우 추가로 포트폴리오 내에, 블로그, notion 등의 링크를 추가해주시면 
				넥서스의 담당 직원이 추가 확인 후 심사에 포함합니다.
			</p>
			<p>심사완료는 영업일 기준 최대 7일이 소요될 수 있으며, 특별한 경우엔 연장될 수 있습니다.</p>
			<p>셀러신청의 경우 자사의 방향과 맞지 않거나, 부적절한 기술이 포함 된 경우 등록이 거부될 수 있습니다.</p>
			<div id="warn_confirm_container">
				<input id="warn_confirm" type="checkbox">위 사항을 인지했습니다.
			</div>
		</div>
		<div id="regist_content_container">
			<img id="reg_logo" src="../resources/imgs/nexus2.png" alt="logo">
			<p>당신의 역량을 알려주세요!</p>
			<form>
				<div>
					<input type="text" name="email" placeholder="이메일"><button type="button" id="email_confirm">인증하기</button>
				</div>
				<div>
					<input type="text" id="email_confirm_num" placeholder="인증번호 입력"><button type="button" id="email_num_button">인증확인</button>
				</div>
				<div>
					<select name="bank" id="bank" required>
						<option value="select">은행</option>
						<option value="shinhan">신한은행</option>
						<option value="kookmin">국민은행</option>
						<option value="woori">우리은행</option>
					</select>
					<input type="text" id="account" name="account" placeholder="계좌번호">
				</div>
				<div>
					<input type="file" name="file" id="file">
				</div>
			</form>
		</div>
	</div>

<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>