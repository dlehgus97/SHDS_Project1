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
				포트폴리오의 용량이 초과하는 경우 추가로 링크 혹은 내용을 추가해주시면 
				넥서스의 담당 직원이 추가 확인 후 심사에 포함합니다.
			</p>
			<p>심사완료는 영업일 기준 최대 7일이 소요될 수 있으며, 특수한 경우엔 연장될 수 있습니다.</p>
			<p>셀러신청의 경우 자사의 방향과 맞지 않거나, 부적절한 기술 및 내용이 포함 된 경우 등록이 거부될 수 있습니다.</p>
			<div id="warn_confirm_container">
				<input id="warn_confirm" type="checkbox"><b>위 사항을 인지했습니다.</b>
			</div>
		</div>
		<div id="regist_content_container">
			<img id="reg_logo" src="../resources/imgs/nexus2.png" alt="logo">
			<p>당신의 역량을 알려주세요!</p>
			<form id="regist_form" action="/seller/alarm/success" method="post" enctype="multipart/form-data">
				<div id="text_area">
					<textarea name="details" id="details" placeholder="신청 이유나 추가 정보를 입력하세요."></textarea>
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
					<div class="filebox">
					    <input class="upload-name" value="첨부파일" placeholder="첨부파일" readonly>
					    <label for="file">파일찾기</label> 
					    <input type="file" id="file" name="file">
					</div>
				</div>
				<button type="submit" id="submit">제출</button>
			</form>
		</div>
	</div>

<%@ include file="/WEB-INF/views/include/footer.jsp" %>

<script>
	$(document).ready(function() {
	    $('#regist_form').on('submit', function(event) {
	        if (!$('#warn_confirm').is(':checked')) {
	            alert('안내 사항을 인지했는지 확인해주세요.');
	            event.preventDefault(); // 폼 전송을 막음
	            return;
	        }
	
	        var fileInput = $('#file')[0];
	        if (fileInput.files.length > 0) {
	            var fileSize = fileInput.files[0].size; // 파일 크기 (바이트 단위)
	            var maxSize = 20 * 1024 * 1024; // 최대 크기 20MB (바이트 단위)
	
	            if (fileSize > maxSize) {
	                alert('파일 크기가 20MB를 초과합니다.');
	                event.preventDefault(); // 폼 전송을 막음
	            }
	        }
	    });
	});
	
	$("#file").on('change',function(){
	  var fileName = $("#file").val();
	  $(".upload-name").val(fileName);
	});
	
	$(document).ready(function() {
	    // 모든 버튼 요소를 선택하고 마우스오버 이벤트 추가
	    $('button').hover(
	        function() {
	            // 마우스오버 시 수행할 작업 작성
	            $(this).css('background-color', '#f9dbff'); // 예: 배경색 변경
	        }, 
	        function() {
	            // 마우스가 버튼에서 벗어날 때 수행할 작업
	            $(this).css('background-color', 'white'); // 원래 배경색 복원
	        }
	    );
	});
</script>
</body>
</html>
