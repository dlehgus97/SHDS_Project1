<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head> 
<meta charset="utf-8">
<title>고객센터 QnA_상세보기</title>
<META name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no"> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
	
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.18/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.jqueryui.min.css">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
<link rel="stylesheet" href="/resources/css/reset.css"/>
<link rel="stylesheet" href="/resources/css/style.css"/>
<link rel="stylesheet" href="/resources/css/contents.css"/>

    <style>
        .answer-box {
            border: 1px solid #ccc;
            padding: 20px;
            margin-top: 20px;
            background-color: #f9f9f9;
            position: relative;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .answer-text {
        	width: 50%;
        	margin-right: 50px;
        	text-align: left;
        }
        .answer-date {
        	width: 20%;
        	margin-right: 50px;
        }

        .answer-box .answer-text {
            flex: 1;
        }

        .answer-box .btnSet {
            display: flex;
            flex-direction: column;
            gap: 10px;
        }

        .answer-box .btnSet a {
            display: block;
            width: fit-content;
        }
    </style>
</head> 
<body>

	<div id="preloader">
		<div class="loader"></div>
	</div>

	<div class="page-container">
		<%@ include file="/WEB-INF/views/admin/adminMenu.jsp"%>
		<div class="main-content" style="background-color: #f0fffe;">
			<%@ include file="/WEB-INF/views/admin/adminHeader.jsp"%>

			<div class="main-content-inner">
				<div class="row">
					<div class="col-12 mt-5">
						<div class="card">
							<div class="card-body">


								<h1 class="header-title" style="font-size: 35px">고객센터(QnA)</h1>
								<div class="bbs">
									<div class="view">
										<div class="title">
											<dl>
												<dt>${vo.title }</dt>
												<dd class="date">
													작성일 :
													<fmt:formatDate value="${vo.write_date }"
														pattern="yyyy-MM-dd HH:mm:ss" />
												</dd>
											</dl>
										</div>
										<div class="cont">${vo.text }</div>
										<div class="btnSet clear">
											<!-- Answer Box -->
											<c:if test="${not empty vo.answer}">
												<div class="answer-box">
													<div class="answer-text">${vo.answer}</div>
													<div class="answer-date">답변 시간: ${vo.answer_date}</div>
													<!-- 답변 시간 표시 -->
													<div class="btnSet">
														<a href="#" class="btn btn-reply">수정</a> <a href="#"
															class="btn btn-delete">삭제</a>
													</div>
												</div>
											</c:if>
											<!-- End of Answer Box -->
											<br>
											<div class="fl_l">
												<c:if test="${empty vo.answer}">
													<a href="#" class="btn btn-reply">답변하기</a>
												</c:if>
												<a href="index.do" class="btn">목록</a>
												<a href="/adqna/delete.do?no=${vo.no }" class="btn">삭제</a>
												
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div><%@ include file="/WEB-INF/views/admin/adminFooter.jsp"%>
	</div>

<script>
$(document).ready(function() {
    $('.btn-reply').click(function(e) {
        e.preventDefault();
        // 기존 답변 박스를 숨깁니다.
        $(this).closest('.answer-box').hide();
        if ($('#replyBox').length === 0) {
            var answerText = $(this).closest('.answer-box').find('.answer-text').text().trim();
            var replyBoxHtml = '<div id="replyBox">' +
                               '<textarea id="answer" style="width: 100%; height: 100px;">' + answerText + '</textarea>' +
                               '<div style="text-align: right; margin-top: 10px;">' +
                               '<button id="submitReply" class="btn">등록</button>' +
                               '<button id="cancelReply" class="btn">취소</button>' +
                               '</div>' +
                               '</div>';
            $('.cont').after(replyBoxHtml);

            $('#cancelReply').click(function() {
                $('#replyBox').remove();
                $('.answer-box').show(); // 취소 시 다시 기존 답변 박스를 보여줍니다.
            });

            $('#submitReply').click(function() {
                var answer = $('#answer').val();
                var no = '${vo.no}';
                
                if (answer.trim() !== "") {
                    $.ajax({
                        url: '/adqna/answer.do',
                        type: 'POST',
                        data: { answer: answer, no: no },
                        success: function(response) {
                            if (response.status === 'success') {
                                alert(response.message);
                                $('#replyBox').remove();
                                var answerBoxHtml = '<div class="answer-box">' +
                                                    '<div class="answer-text">' + '<div>답변 : </div>' + answer + '</div>' +
                                                    '<div class="answer-date">답변 시간: ' + response.answer_date + '</div>' + // 답변 시간 추가
                                                    '<div class="btnSet">' +
                                                    '<a href="#" class="btn btn-reply">수정</a>' +
                                                    '<a href="#" class="btn btn-delete">삭제</a>' +
                                                    '</div>' +
                                                    '</div>';
                                $('.cont').after(answerBoxHtml);
                            } else {
                                alert(response.message);
                            }
                        },
                        error: function() {
                            alert('답변 등록에 실패했습니다.');
                        }
                    });
                } else {
                    alert('답변을 입력하세요.');
                }
            });
        }
    });
});

    $('.btn-delete').click(function(e) {
        e.preventDefault();
        var no = '${vo.no}';
        
        $.ajax({
            url: '/adqna/delete.do',
            type: 'POST',
            data: { no: no },
            success: function(response) {
                alert('삭제되었습니다.');
                window.location.href = 'view.do?no=${vo.no}';
            },
            error: function() {
                alert('삭제에 실패했습니다.');
            }
        });
    });

</script>

	<!-- alertdesign -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<!-- bootstrap -->
<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
<script src="https://cdn.datatables.net/1.10.18/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.18/js/dataTables.bootstrap4.min.js"></script>
<script src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.min.js"></script>
<script src="https://cdn.datatables.net/responsive/2.2.3/js/responsive.bootstrap.min.js"></script>	    
</body> 
</html>