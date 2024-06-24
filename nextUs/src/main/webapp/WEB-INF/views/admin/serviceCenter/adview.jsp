<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head> 
<meta charset="utf-8">
<title>공지사항</title>
<META name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no"> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>

<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.18/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.jqueryui.min.css">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
<link rel="stylesheet" href="/resources/css/reset.css"/>
<link rel="stylesheet" href="/resources/css/style.css"/>
<link rel="stylesheet" href="/resources/css/contents.css"/>

<script>
        function confirmDelete(no) {
            Swal.fire({
                title: '삭제하시겠습니까?',
                text: "마지막 경고입니다",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor:'#d33',
                cancelButtonColor:  '#3085d6',
                confirmButtonText: '삭제',
                cancelButtonText: '취소'
            }).then((result) => {
            	 if (result.isConfirmed) {
                     Swal.fire({
                         title: '삭제가 완료되었습니다.',
                         icon: 'success',
                         confirmButtonText: '확인'
                     }).then(() => {
                         window.location.href = 'deleteNotice.do?no=' + no;
                     });
                 }
            });
        }
</script>
<style>
.size{
background-color:white;

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



								<h1 class="header-title" style="font-size: 35px">공지사항</h1>
								<div class="bbs">
									<div class="view">
										<div class="title">
											<dl>
												<dt>${vo.title }</dt>
												<dd class="date">
													작성일 :
													<fmt:formatDate value="${vo.writedate }"
														pattern="YYYY-MM-dd HH:mm:ss" />
												</dd>
											</dl>
										</div>
										<div class="cont">${vo.content }</div>
										<div class="btnSet clear">
											<div class="fl_l">
												<a href="../notice.do" class="btn">목록</a> <a
													href="adedit.do?no=${vo.no}" class="btn">수정</a> <a
													href="javascript:void(0);"
													onclick="confirmDelete(${vo.no})" class="btn">삭제</a>
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