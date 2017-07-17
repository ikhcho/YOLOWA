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
	<jsp:include page="/WEB-INF/views/busi/header.jsp"/>
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