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
</head>
<body>
<div class="navbar navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container-fluid">
				<a class="btn btn-navbar" data-toggle="collapse"
					data-target=".nav-collapse"> <span class="icon-bar"></span> <span
					class="icon-bar"></span> <span class="icon-bar"></span>
				</a> <a class="brand"><strong>${userVO.name}</strong></a>
				<div class="nav-collapse collapse">
					<ul class="nav pull-right">
						<li class="dropdown"><a href="#" role="button"
							class="dropdown-toggle" data-toggle="dropdown"> <i
								class="icon-user"></i> Vincent Gabriel <i class="caret"></i>

						</a>
							<ul class="dropdown-menu">
								<li><a tabindex="-1" href="#">Profile</a></li>
								<li class="divider"></li>
								<li><a tabindex="-1" href="login.html">Logout</a></li>
							</ul></li>
					</ul>
					<ul class="nav">
						<li><a href="${pageContext.request.contextPath}/admin/home.do">대시보드</a></li>
						<li ><a href="${pageContext.request.contextPath}/admin/getApprove.do">가맹 신청 현황</a></li>
						<li><a href="${pageContext.request.contextPath}/admin/getCommentBlind.do">후기 신고 현황</a></li>
						<li class="active"><a href="${pageContext.request.contextPath}/admin/getHouseBlind.do">업체 신고 현황</a></li>
						<li><a href="${pageContext.request.contextPath}/admin/clist.do">문의 현황</a></li>
						<li><a href="${pageContext.request.contextPath}/user/home.do">예약사이트</a></li>
					</ul>
				</div>
				<!--/.nav-collapse -->
			</div>
		</div>
	</div>
	<div class="page-wrapper">
		<div class="container">
			<div class="col-sm-12" id="content">
				<div class="row-fluid">
					<!-- block -->
					<div class="block">
						<div class="navbar navbar-inner block-header">
							<div class="muted pull-left">후기 신고 현황</div>
						</div>
						<div class="block-content collapse in">
							<div class="span12">
							<!-- block -->
									<table class="table table-striped">
										<thead>
											<tr>
												<th>no</th>
												<th>펜션 번호</th>
												<th>신고자 번호</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${ houseBlind}" var="houseBlindVO">
													<tr>
														<td>${ houseBlindVO.no }</td>
														<td><a href="${pageContext.request.contextPath }/detail/houseDetail.do?no=${ houseBlindVO.houseNo }">${ houseBlindVO.houseNo }</a></td>
														<td>${ houseBlindVO.userNo }</td>
													</tr>
												</c:forEach>
										</tbody>
									</table>
							<!-- /block -->
					</div>
					<!-- /block -->
				</div>
			</div>			
		</div>
	</div>
</body>
</html>