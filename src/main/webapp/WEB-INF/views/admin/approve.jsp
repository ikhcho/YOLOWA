<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>YOLOWA</title>
	<!-- Bootstrap -->
	<link href="${pageContext.request.contextPath}/resources/bootstrap/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
	<link href="${pageContext.request.contextPath}/resources/bootstrap/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
    <link href="${pageContext.request.contextPath}/resources/bootstrap/vendors/easypiechart/jquery.easy-pie-chart.css" rel="stylesheet" media="screen">
    <link href="${pageContext.request.contextPath}/resources/bootstrap/assets/styles.css" rel="stylesheet" media="screen">
    <script src="${pageContext.request.contextPath}/resources/bootstrap/vendors/modernizr-2.6.2-respond-1.1.0.min.js"></script>
    
    <script src="jquery-3.2.1.min.js"></script>
    <script type="text/javascript">
    	$(".approveState").click(function() {
			$.post("${pageContext.request.contextPath}/admin/getApprove.do",
			{
				
			},
			function() {
				
			}
			});
		});
    </script>
</head>
<body>
	<div class="page-wrapper">
		<div class="container">
			<div class="col-sm-12" id="content">
				<div class="row-fluid">
					<!-- block -->
					<div class="block">
						<div class="navbar navbar-inner block-header">
							<div class="muted pull-left">가맹 신청 현황</div>
							<div class="pull-right">
								<form action="${pageContext.request.contextPath}/admin/getApprove.do" method="post">
									<select name="approveState">
										<option selected="selected">검색</option>
										<option value="신청">신청</option>
										<option value="승인">승인</option>			
										<option value="거부">거부</option>			
									</select>
									<button class="btn btn-default" type="submit">검색</button>
								</form>
							</div>
						</div>
						<div class="block-content collapse in">
							<div class="span12">
							<!-- block -->
									<table class="table table-striped">
										<thead>
											<tr>
												<th>유저번호 userNo</th>
												<th>승인 상태 approveState</th>
												<th>사업자번호 approveKey</th>
												<th><span class="badge badge-warning pull-right">${ approve.size() }</span></th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${ approve }" var="approveVO">
													<tr>
														<td>${ approveVO.userNo }</td>
														<td>${ approveVO.approveState }</td>
														<td>${ approveVO.approveKey }</td>
														<td><c:if test="${ approveVO.approveState == '신청' }">
															<button name="approveState" onclick="doApprove()">승인</button>
															<button name="approveState" onclick="doApprove()">거부</button>
														</c:if></td>
													</tr>
												</c:forEach>
										</tbody>
									</table>
							<!-- /block -->
						<div class="navbar navbar-inner block-header">
							<div class="muted pull-left">userNo로 검색</div>
							<div>
								<form action="${pageContext.request.contextPath}/admin/getApprove.do" method="post">
									<input type="text" name="userNo">
									<input type="text" name="approveKey">
									<input type="submit" value="검색">
								</form>
							</div>
						</div>
					</div>
					<!-- /block -->
				</div>
			</div>			
		</div>
	</div>
</body>
</html>