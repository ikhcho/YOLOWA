<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
						<li><a href="${pageContext.request.contextPath}/busi/home.do">대시보드</a></li>
						<li class="active"><a href="${pageContext.request.contextPath}/busi/pension/list.do">펜션정보 </a></li>
						<li><a href="${pageContext.request.contextPath}/busi/home.do">예약사이트 </a></li>
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
				
			</div>
		</div>
	</div>
	<!--/.fluid-container-->
	<script src="${pageContext.request.contextPath}/resources/bootstrap/vendors/jquery-1.9.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/bootstrap/bootstrap/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/bootstrap/vendors/easypiechart/jquery.easy-pie-chart.js"></script>
	<script src="${pageContext.request.contextPath}/resources/bootstrap/assets/scripts.js"></script>
	<script>
        $(function() {
            // Easy pie charts
            $('.chart').easyPieChart({animate: 1000});
        });
        </script>
</body>

</html>