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
<title>셀러 정산 | Admin</title>
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


<style>
table {
	width: 100%;
	border-collapse: collapse;
	font-size: 18px;
}

tbody tr:hover {
	background-color: #f1f1f1; /* 배경색 변경 */
}

.mybutton {
	margin-top:13px;
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
								<h1 class="header-title" style="font-size: 35px">판매자 정산 내역</h1>
								<div class="data-tables datatable-dark">
									<table id="dataTable3" class="text-center">
										<thead class="text-capitalize">
											<tr>
												<th>거래번호</th>
												<th>판매자 이메일</th>
												<th>결제일</th>
												<th>구매 확정 일자</th>
												<th>상품금액</th>
												<th>계좌번호</th>
												<th>정산하기</th>
											</tr>
										</thead>
										<tbody>
											<c:if test="${empty map.list}">
												<tr>
													<td class="first" colspan="8">정산 내역이 없습니다.</td>
												</tr>
											</c:if>
											<c:if test="${!empty map.list }">
												<c:forEach var="vo" items="${map.list}">

													<tr>
														<td>${vo.buyno}</td>
														<td>${vo.sellerEmail}</td>
														<td class="date"><fmt:formatDate pattern="yyyy-MM-dd"
																value="${vo.buydate}" /></td>
														<td class="date"><fmt:formatDate pattern="yyyy-MM-dd"
																value="${vo.decidedate}" /></td>
														<td><fmt:formatNumber value="${vo.price}" type="number" groupingUsed="true" />원</td>
														<td>${vo.account}</td>
														<td><c:choose>
																<c:when test="${vo.status == 5}">
																	<button class="btn btn-rounded btn-success mb-3 mybutton settlebutton"
																	type="button">정산 대기중</button>
																</c:when>
																<c:when test="${vo.status == 6}">
																	<button class="btn btn-rounded btn-primary mb-3 mybutton" type="button"
																		onclick="openPopup(event); return false;">정산 완료
																	</button>
																</c:when>
															</c:choose></td>
													</tr>
												</c:forEach>
											</c:if>
										</tbody>
									</table>
									<!-- paging -->


									<div class="pagenate" style="margin-top: 10px;">
										<ul class='paging'>
											<c:if test="${map.prev }">
												<li><a href="sellerSettlement?page=${map.startPage-1 }">
														<< </a></li>
											</c:if>
											<c:forEach var="p" begin="${map.startPage}"
												end="${map.endPage}">
												<c:if test="${p == BuyListVO.page}">
													<li><a href='#;' class='current'>${p}</a></li>
												</c:if>
												<c:if test="${p != BuyListVO.page}">
													<li><a href='sellerSettlement?page=${p}'>${p}</a></li>
												</c:if>
											</c:forEach>
											<c:if test="${map.next }">
												<li><a href="sellerSettlement?page=${map.endPage+1 }">
														>> </a></li>
											</c:if>
										</ul>
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
        $(".settlebutton").click(function () {
            var button = event.target;
            var tr = button.closest('tr');
            var buyno = tr.cells[0].innerText.trim(); // 첫 번째 셀의 내용을 가져옴
            var price = tr.cells[4].innerText.trim(); // 가격
            var account = tr.cells[5].innerText.trim(); // 가격
            
            //토스트
            const Toast = Swal.mixin({
                toast: true,
                position: 'center-center',
                showConfirmButton: false,
                timer: 2500,
                timerProgressBar: true,
                
              })
            
            
            
              Swal.fire({
            	    title: '정산하시겠습니까?',
            	    html: '금액: ' + price + '<br>계좌번호: ' + account,
            	    icon: 'info',
            	    showCancelButton: true,
            	    confirmButtonColor: '#4fd900',
            	    cancelButtonColor: '#3085d6',
            	    confirmButtonText: '정산하기',
            	    cancelButtonText: '취소',
            	}).then(result => {
            	    if (result.isConfirmed) {
            	        var settleURL = '/settle/' + buyno;
            	        
            	        Toast.fire({
            	            icon: 'success',
            	            title: '~정산중입니다~'
            	        }).then(() => {
            	            // 토스트가 사라진 후 AJAX 요청을 진행합니다.
            	            $.ajax({
            	                url: settleURL,
            	                type: 'POST',
            	                success: function(response) {
            	                    if (response === 'success') {
            	                        Swal.fire('정산이 완료되었습니다.', '텅장이 되겠어요~!', 'success')
            	                        .then(function() {
            	                            location.reload(); // 확인 버튼을 누를 때 페이지 새로고침
            	                        });
            	                    } else {
            	                        Swal.fire('정산 실패', '다시 시도해주세요.', 'error');
            	                    }
            	                },
            	                error: function(xhr, status, error) {
            	                    Swal.fire('정산 실패', '다시 시도해주세요.', 'error');
            	                }
            	            });
            	        });
            	    }
            	});
        });
        
       
    });
    </script>

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