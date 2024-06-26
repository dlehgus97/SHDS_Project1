<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>셀러 등록 신청내역 | NEXt Us</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/footer.css">
<link rel="stylesheet" type="text/css" href="/resources/css/header.css">
<link rel="stylesheet" type="text/css" href="/resources/css/sellerReqList.css">
</head>
<body>
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
    <div id="outer_container">
    	<div id="seller_req_container">
    		<a id="seller_req" href="/seller/register">셀러 신청하기</a>
    		<p>! 처리되지 않은 신청건이 존재할 경우 신청이 불가합니다. !</p>
    	</div>
        <div id="req_container">
	        <c:if test="${empty reqList }">
	          	<img src="/resources/imgs/noOrderAlert.png" style="width: 640px; height:640px;">
          	</c:if>
            <c:forEach var="vo" items="${reqList}" varStatus="status">
                <div class="req_list_container">
                    <div class="file">
                        <p>첨부파일 : </p>
                        <c:if test="${vo.file_real != null}">
                            <a href="<c:url value="/download.do"/>?uploadPath=/upload/sellerReq&thumbnail_org=${URLEncoder.encode(vo.file_org)}&thumbnail_real=${vo.file_real}" target="_blank">${vo.file_org}</a>
                        </c:if>
                        <c:if test="${vo.file_real == null}">
                            <p>No file available</p>
                        </c:if>
                    </div>
                    <div class="status">
                        <p>신청현황 : </p>
                        <c:choose>
                            <c:when test="${vo.state == 0}">
                                <p style="color: blue;">신청승인</p>
                            </c:when>
                            <c:when test="${vo.state == 1}">
                                <p>신청검토중</p>
                            </c:when>
                            <c:when test="${vo.state == -1}">
                                <p style="color: red;">신청거부</p>
                            </c:when>
                            <c:otherwise>
                                <p>신청보류</p>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <button class="showDetailsBtn" data-index="${status.index}">추가내역 보기</button>
                    <div class="details" id="detailsSection${status.index}">
                        <h3>추가내역</h3>
                        <p>${vo.details}</p>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
    <%@ include file="/WEB-INF/views/include/footer.jsp"%>
    
    <script>
    //details 보는 버튼
    $(document).ready(function() {
        $('.showDetailsBtn').on('click', function() {
            const index = $(this).data('index');
            const detailsSection = $('#detailsSection' + index);
            detailsSection.toggleClass('show');
            if (detailsSection.hasClass('show')) {
                $('html, body').animate({
                    scrollTop: detailsSection.offset().top
                }, 'smooth');
            } else {
                $('html, body').animate({
                    scrollTop: $(this).closest('.req_list_container').offset().top
                }, 'smooth');
            }
        });
    });
    
	// 마우스 오버 이벤트
    $(document).ready(function() {
        // 모든 버튼 요소를 선택하고 마우스오버 이벤트 추가
        $('button').hover(
            function() {
                // 마우스오버 시 수행할 작업 작성
                console.log('Mouse over on button:', this);
                $(this).css('background-color', '#f9dbff'); // 예: 배경색 변경
            }, 
            function() {
                // 마우스가 버튼에서 벗어날 때 수행할 작업
                $(this).css('background-color', 'white'); // 원래 배경색 복원
            }
        );
        
        $('#seller_req').hover(
            function() {
                // 마우스오버 시 수행할 작업 작성
                console.log('Mouse over on button:', this);
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