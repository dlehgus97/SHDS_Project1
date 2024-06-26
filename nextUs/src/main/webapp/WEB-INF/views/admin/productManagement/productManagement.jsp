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
<title>판매글 | Admin</title>
<link rel="stylesheet" href="../resources/css/admin/memberStatus.css" />
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.18/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.jqueryui.min.css">

<style>
table {
	width: 100%;
	border-collapse: collapse;
	font-size: 18px;
}

tr {
	height: 45px;
}

tbody tr:hover {
	background-color: #f1f1f1; /* 배경색 변경 */
}

.mybutton {
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
		<div class="main-content">
			<%@ include file="/WEB-INF/views/admin/adminHeader.jsp"%>

			<div class="main-content-inner" style="background-color: #f0fffe;">
				<div class="row">
					<div class="col-12 mt-5">
						<div class="card">
							<div class="card-body">
								<div style="display: flex; justify-content: space-between;">
									<h1 class="header-title" style="font-size: 35px">판매글 관리</h1>
									<form method="get" name="searchForm" id="searchForm"
										action="productManagement.do">
										<select name="searchType">
											<option value="all">전체</option>
											<option value="no">제목</option>
											<option value="email">작성자</option>
										</select> <input type="text" name="searchWord" /> <input type="submit"
											class="btn btn-flat btn-secondary mb-3"
											style="font-size: 18px;" value="Search!!">
									</form>
								</div>
								<div class="data-tables datatable-dark">
									<table id="dataTable3" class="text-center">
										<thead class="text-capitalize">
											<tr>
												<th>글번호</th>
												<th>제목</th>
												<th>작성자</th>
												<th>게시일</th>
												<th>조회수</th>
												<th></th>
											</tr>
										</thead>
										<tbody>
											<c:if test="${empty selllist.list}">
												<tr>
													<td class="first" colspan="8">검색 결과가 없습니다.</td>
												</tr>
											</c:if>
											<c:if test="${!empty selllist.list }">
												<c:forEach var="vo" items="${selllist.list}">
													<tr>
														<td>${vo.sellno != null ? vo.sellno : '(미입력)'}</td>
														<td>${vo.title != null ? vo.title : '(미입력)'}</td>
														<td>${vo.sellerName != null ? vo.sellerName : '(미입력)'}</td>
														<td class="date"><fmt:formatDate pattern="yyyy-MM-dd"
																value="${vo.postdate}" /></td>
														<td>${vo.view_cnt != null ? vo.view_cnt : '0'}</td>
														<td>
															<button class="btn btn-flat btn-secondary mb-3 mybutton linkButton"
															type="button" onclick="goToSellPage(${vo.sellno})" >
															판매글 보기</button>&emsp;&emsp;
															<button class="btn btn-flat btn-danger mb-3 mybutton deleteButton"
																type="button">삭제</button>
														</td>
													</tr>


												</c:forEach>
											</c:if>
										</tbody>

									</table>
									<!-- paging -->
									<div class="pagenate">
										<c:forEach var="p" begin="${selllist.startPage}"
											end="${selllist.endPage}">
											<c:if test="${p == SellListVO.page}">
												<li><a href='#;' class='current'>${p}</a></li>
											</c:if>
											<c:if test="${p != SellListVO.page}">
												<li><a
													href='productManagement?page=${p}&searchType=${SellListVO.searchType}&searchWord=${SellListVO.searchWord}'>${p}</a></li>
											</c:if>
										</c:forEach>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<%@ include file="/WEB-INF/views/admin/adminFooter.jsp"%>
	</div>

	<script>
    $().ready(function () {
        $(".deleteButton").click(function () {
            var button = event.target;
            var tr = button.closest('tr');
            var sellno = tr.cells[0].innerText.trim(); // 첫 번째 셀의 내용을 가져옴
            
            Swal.fire({
                title: '글을 삭제하겠습니까?',
                text: '다시 되돌릴 수 없습니다.',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#d33',
                cancelButtonColor: '#3085d6',
                confirmButtonText: '삭제',
                cancelButtonText: '취소',
            }).then(result => {
                if (result.isConfirmed) {
                    var deleteUrl = '/deleteSelllist/' + sellno;
                    
                    $.ajax({
                        url: deleteUrl,
                        type: 'POST',
                        success: function(response) {
                            if (response === 'success') {
                            	 Swal.fire('삭제가 완료되었습니다.', '판매자가 서운하겠어요~!', 'success')
                                 .then(function() {
                                     location.reload(); // 확인 버튼을 누를 때 페이지 새로고침
                                 });
                            } else {
                                Swal.fire('삭제 실패', '다시 시도해주세요.', 'error');
                            }
                        },
                        error: function(xhr, status, error) {
                            Swal.fire('삭제 실패', '다시 시도해주세요.', 'error');
                        }
                    });
                }
            });
        });
        
        $(".linkButton").click(function () {
        	 var button = event.target;
             var tr = button.closest('tr');
             var sellno = tr.cells[0].innerText.trim(); // 첫 번째 셀의 내용을 가져옴
        	
             window.open('/selllist/view.do?sellno=' + sellno, '_blank');
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