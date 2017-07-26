<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    
    <script>
	function goWriteForm() {
	
		location.href = "${ pageContext.request.contextPath }/admin/cupdate.do";
	}
	
	function doAction(boardNo) {
		
		location.href = "${ pageContext.request.contextPath }/board/" + boardNo + "/qdetail.do";
		
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
						<li><a href="${pageContext.request.contextPath}/admin/home.do">대시보드</a></li>
						<li><a href="${pageContext.request.contextPath}/admin/getApprove.do">가맹 신청 현황</a></li>
						<li><a href="${pageContext.request.contextPath}/admin/getCommentBlind.do">후기 신고 현황</a></li>
						<li><a href="${pageContext.request.contextPath}/admin/getHouseBlind.do">업체 신고 현황</a></li>
						<li class="active"><a href="${pageContext.request.contextPath}/admin/clist.do">문의 현황</a></li>
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
							<div class="muted pull-left">문의 목록</div>
						</div>
						<div class="block-content collapse in">
							<div class="span12">
							<!-- block -->
								<table class="table table-striped">
									<thead>
									<tr>
										<th>no</th>
										<th>펜션번호</th>
										<th>유저번호</th>
										<th width="40%">질문</th>
										<th>답변</th>
										<th>공개여부</th>
										<th>등록일</th>
									</tr>
									</thead>
									<tbody>
										<c:forEach items="${ list }" var="board" varStatus="loop">
											<tr <c:if test="${ loop.count mod 2 eq 0 }">class="even"</c:if> >
												<td>${ board.no }</td>
												<td>${ board.house_no }</td>
												<td>${ board.user_no }</td>
												<td>
													<a href="javascript:doAction('${board.no}')">
								 						<c:out value="${ board.question }" /> 
													</a>
												</td>
												<td>${ board.answer }</td>
												<td>${ board.open_state }</td>
												<td>${ board.reg_date }</td>
											</tr>
										</c:forEach>
									</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	</div>
			
	<!--/.fluid-container-->
	<script src="${pageContext.request.contextPath}/resources/bootstrap/vendors/jquery-1.9.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/bootstrap/bootstrap/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/bootstrap/vendors/easypiechart/jquery.easy-pie-chart.js"></script>
	<script src="${pageContext.request.contextPath}/resources/bootstrap/assets/scripts.js"></script>
</body>

</html>
