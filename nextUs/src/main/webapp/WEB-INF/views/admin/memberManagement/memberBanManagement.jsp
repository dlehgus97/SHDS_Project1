<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html class="no-js" lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>제재내역 보기 | Admin</title>
<script src="../resources/js/admin/memberStatus.js"></script>
<link rel="stylesheet" href="../resources/css/admin/memberStatus.css" />
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.18/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.jqueryui.min.css">


<script src="../resources/js/admin/memberBanManagement.js"></script>
<style>
table {
	width: 100%;
	border-collapse: collapse;
	font-size: 18px;
}

tbody tr:hover {
	background-color: #f1f1f1; /* 배경색 변경 */
}
table tr{
	height:46px;
}
.mybutton {
	width: 250px;
	font-size: 45px;
	height: 45px;
	font-weight: bold;
}
.mybutton2 {
	margin-top: 13px;
}
</style>
</head>
<body>
<div id="preloader">
        <div class="loader"></div>
    </div>
	<div class="page-container">
		<%@ include file="/WEB-INF/views/admin/adminMenu.jsp"%>
		<div class="main-content" style="background-color:#f0fffe;">
			<%@ include file="/WEB-INF/views/admin/adminHeader.jsp"%>

			<div class="main-content-inner">
				<div class="row">
					<div class="col-12 mt-5">
						<div class="card">
							<div class="card-body">
								<div style="display: flex; justify-content: space-between;">

									<h1 class="header-title" style="font-size: 35px">회원 제재 내역</h1>
									<button class="btn btn-outline-dark mb-3 mybutton"
										onclick="openPopup('Member'); return false;">제재내역 추가</button>

								</div>
								<div class="data-tables datatable-dark">
									<table id="dataTable3" class="text-center">
										<thead class="text-capitalize">
											<tr>
												<th>번호</th>
												<th>이메일</th>
												<th>사유</th>
												<th>해제</th>
												<th>기간</th>
											</tr>
										</thead>
										<tbody>
											<c:if test="${empty map.list}">
												<tr>
													<td class="first" colspan="8">제재 내역이 없습니다.</td>
												</tr>
											</c:if>
											<c:if test="${!empty map.list }">
												<c:forEach var="vo" items="${map.list}">
													<tr>
														<td>${vo.no != null ? vo.no : '(미입력)'}</td>
														<td>${vo.email != null ? vo.email : '(미입력)'}</td>
														<td>${vo.content != null ? vo.content : '(미입력)'}</td>
														<td><button class="btn btn-warning mb-3 mybutton2 banFree"
																type="button">제재 해제</button></td>
														<td class="date">~ <fmt:formatDate
																pattern="yyyy-MM-dd" value="${vo.date}" /></td>

													</tr>


												</c:forEach>
											</c:if>
										</tbody>

									</table>
									<!-- paging -->
									<div class="pagenate">
										<ul class='paging'>
											<c:forEach var="p" begin="${map.startPage}"
												end="${map.endPage}">
												<c:if test="${p == BanVO.page}">
													<li><a href='#;' class='current'>${p}</a></li>
												</c:if>
												<c:if test="${p != BanVO.page}">
													<li><a
														href='memberBanManagement.do?page=${p}'>${p}</a></li>
												</c:if>
											</c:forEach>
										</ul>
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
    $().ready(function () {
        $(".banFree").click(function () {
            var button = event.target;
            var tr = button.closest('tr');
            var no = tr.cells[0].innerText.trim(); // 첫 번째 셀의 내용을 가져옴
            
            Swal.fire({
                title: '제재를 해제하시겠습니까?',
                text: '악질일 수도 있어요',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#ffd700',
                cancelButtonColor: '#3085d6',
                confirmButtonText: '해제',
                cancelButtonText: '취소',
            }).then(result => {
                if (result.isConfirmed) {
                    var banFreeUrl = '/banFree/' + no;
                    
                    $.ajax({
                        url: banFreeUrl,
                        type: 'POST',
                        success: function(response) {
                            if (response === 'success') {
                            	 Swal.fire('제재가 해제되었습니다.', '무죄입니다!!', 'success')
                                 .then(function() {
                                     location.reload(); // 확인 버튼을 누를 때 페이지 새로고침
                                 });
                            } else {
                                Swal.fire('해제 실패', '다시 시도해주세요.', 'error');
                            }
                        },
                        error: function(xhr, status, error) {
                            Swal.fire('해제 실패', '다시 시도해주세요.', 'error');
                        }
                    });
                }
            });
        });
 });

<!-- alertdesign -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
	
<script	src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
<script src="https://cdn.datatables.net/1.10.18/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.18/js/dataTables.bootstrap4.min.js"></script>
<script src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.min.js"></script>
<script src="https://cdn.datatables.net/responsive/2.2.3/js/responsive.bootstrap.min.js"></script>



</body>
</html>