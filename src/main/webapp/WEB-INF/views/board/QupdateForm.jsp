<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>YOLOWA</title>
<!-- Bootstrap -->
<link
	href="${pageContext.request.contextPath}/resources/bootstrap/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" media="screen">
<link
	href="${pageContext.request.contextPath}/resources/bootstrap/bootstrap/css/bootstrap-responsive.min.css"
	rel="stylesheet" media="screen">
<link
	href="${pageContext.request.contextPath}/resources/bootstrap/vendors/easypiechart/jquery.easy-pie-chart.css"
	rel="stylesheet" media="screen">
<link
	href="${pageContext.request.contextPath}/resources/bootstrap/assets/styles.css"
	rel="stylesheet" media="screen">
<script
	src="${pageContext.request.contextPath}/resources/bootstrap/vendors/modernizr-2.6.2-respond-1.1.0.min.js"></script>

<script>
	function doList() {
		location.href = "${pageContext.request.contextPath}/admin/clist.do"
	}
</script>
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
						<li><a
							href="${pageContext.request.contextPath}/admin/home.do">대시보드</a></li>
						<li><a
							href="${pageContext.request.contextPath}/admin/getApprove.do">가맹
								신청 현황</a></li>
						<li><a
							href="${pageContext.request.contextPath}/admin/getCommentBlind.do">댓글
								신고 현황</a></li>
						<li><a
							href="${pageContext.request.contextPath}/admin/getHouseBlind.do">업체
								신고 현황</a></li>
						<li class="active"><a
							href="${pageContext.request.contextPath}/admin/clist.do">문의
								현황</a></li>
						<li><a href="${pageContext.request.contextPath}/user/home.do">예약사이트</a></li>
					</ul>
				</div>
				<!--/.nav-collapse -->
			</div>
		</div>
	</div>
	<div class="page-wrapper">
		<div class="container">
			<!--/span-->
			<div class="col-sm-12" id="content">
				<div class="row-fluid">
					<!-- block -->
					<div class="block">
						<div class="navbar navbar-inner block-header">
							<div class="muted pull-left">문의 답변</div>
						</div>
						<div class="block-content collapse in">
							<div class="span12">
								<form action="${pageContext.request.contextPath }/admin/cupdate.do" method="post">
									<input type="hidden" name="no" value="${ param.no }" />
									<table class="table table-striped">
										<tr>
											<th width="25%">no</th>
											<td>${ board.no }</td>
										</tr>
										<tr>
											<th>house_no</th>
											<td>${ board.house_no }</td>
										</tr>
										<tr>
											<th>user_no</th>
											<td>${ board.user_no }</td>
										</tr>
										<tr>
											<th>question</th>
											<td>${ board.question }</td>
										</tr>
										<tr>
											<th width="25%">answer</th>
											<td><textarea style="width:100%" rows="7" cols="50" name="answer">${ board.answer }</textarea>
											</td>
										</tr>
									</table>
									<input type="submit" value=" 수정  " />&nbsp;&nbsp; <input
										type="button" value=" 목록  " onclick="doList()" />
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
