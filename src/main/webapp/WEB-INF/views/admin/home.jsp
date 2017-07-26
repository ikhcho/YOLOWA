<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    
    <script src="${pageContext.request.contextPath}/resources/bootstrap/vendors/jquery-1.9.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/bootstrap/bootstrap/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/bootstrap/vendors/easypiechart/jquery.easy-pie-chart.js"></script>
	<script src="${pageContext.request.contextPath}/resources/bootstrap/assets/scripts.js"></script>
	
	<script src="${pageContext.request.contextPath}/resources/bootstrap/vendors/datatables/js/jquery.dataTables.min.js"></script>
	
	<script src="${pageContext.request.contextPath}/resources/bootstrap/assets/DT_bootstrap.js"></script>
	
	<script src="${pageContext.request.contextPath}/resources/bootstrap/vendors/raphael-min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/bootstrap/vendors/morris/morris.js"></script>
	
	<script>
        $(function() {
            // Easy pie charts
            $.ajax({
			url : '/Yolowa/admin/locationMap.do',
			type : 'get',
			
			success : function(successData) {
					var dataMap = JSON.parse(successData);
					var text = "[";
					for (key in dataMap) {
						text += '{ \"x\" : \"' + key + '\", \"y\" : \"' + dataMap[key] + '\"}';
						text += ","
					}
					text = text.substring(0, text.length - 1);
					text+=']';
					var barData = eval(text);
					Morris.Bar({
						element : 'hero-graph',
						data : barData,
						xkey : 'x',
						ykeys : ['y'],
						labels : ['s']
					});
				}
			});
		});
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
						<li class="active"><a href="${pageContext.request.contextPath}/admin/home.do">대시보드</a></li>
						<li><a href="${pageContext.request.contextPath}/admin/getApprove.do">가맹 신청 현황</a></li>
						<li><a href="${pageContext.request.contextPath}/admin/getCommentBlind.do">댓글 신고 현황</a></li>
						<li><a href="${pageContext.request.contextPath}/admin/getHouseBlind.do">업체 신고 현황</a></li>
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
<!-- 지역별 수 -->	<div class="row-fluid">
					<!-- block -->
					<div class="span12">
					<div class="block">
						<div class="navbar navbar-inner block-header">
							<div class="muted pull-left">지역별 업체 수</div>
						</div>
						<div class="block-content collapse in">
							<div class="span12">
                                <div id="hero-graph" style="height: 230px;"></div>
                            </div>
						</div>
					</div>
					</div>
					<!-- /block -->
				</div>
				<div class="row-fluid">
				<div class="span12">
						<!-- block -->
						<div class="block">
							<div class="navbar navbar-inner block-header">
								<div class="muted pull-left">YOLOWA 통계</div>
								<div class="pull-right">
									<span class="badge badge-info"></span>

								</div>
							</div>
							<div class="block-content collapse in">
								<table class="table table-striped">
									<thead>
										<tr>
											<th>예약 수</th>
											<th>수익</th>
											<th>방문자 수</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>${ reservationCount }</td>
											<td>${ totalProfit }</td>
											<td><%-- ${ applicationScope } --%></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<!-- /block -->
					</div>
				</div>
<!-- 예약 현황 -->	<div class="row-fluid">
					<div class="span12">
						<!-- block -->
						<div class="block">
							<div class="navbar navbar-inner block-header">
								<div class="muted pull-left">예약 현황</div>
								<div class="pull-right">
									<span class="badge badge-info">${ reservationState.size() }</span>
								</div>
							</div>
							<div class="block-content collapse in">
								<table class="table table-striped">
									<thead>
										<tr>											
											<th>번호</th>
											<th>펜션</th>
											<th>방이름</th>
											<th>예약자</th>
											<th>예약자연락처</th>
											<th>입실일</th>
											<th>퇴실일</th>
											<th>인원</th>
											<th>가격</th>
											<th>예약일</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${ reservationState }" var="reservation">
										<tr>
											<td>${ reservation.no }</td>
											<td>${ reservation.houseName }</td>
											<td>${ reservation.roomName }</td>
											<td class="center">${ reservation.userName }</td>
											<td class="center">${ reservation.userTel }</td>
											<td>${ reservation.resStart }</td>
											<td>${ reservation.resEnd }</td>
											<td class="center">${ reservation.personCnt }</td>
											<td>${ reservation.totalPrice }</td>
											<td>${ reservation.regDate }</td>
										</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						<!-- /block -->
					</div>
				</div>
					<!-- block -->
					<!-- /block -->
				</div>
				
			</div>
		</div>
		<hr>
	</div>
	<!--/.fluid-container-->	
</body>
</html>