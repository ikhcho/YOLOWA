<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>YOLOWA</title>
	<!-- Bootstrap -->
	<link href="${pageContext.request.contextPath}/resources/bootstrap/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
	<link href="${pageContext.request.contextPath}/resources/bootstrap/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
    <link href="${pageContext.request.contextPath}/resources/bootstrap/vendors/easypiechart/jquery.easy-pie-chart.css" rel="stylesheet" media="screen">
    <link href="${pageContext.request.contextPath}/resources/bootstrap/assets/styles.css" rel="stylesheet" media="screen">
    <link href="${pageContext.request.contextPath}/resources/bootstrap/vendors/morris/morris.css" rel="stylesheet" media="screen">
    <link href="${pageContext.request.contextPath}/resources/bootstrap/assets/DT_bootstrap.css" rel="stylesheet" media="screen">
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
								class="icon-user"></i> ${ userVO.name } <i class="caret"></i>

						</a>
							<ul class="dropdown-menu">
								<li><a tabindex="-1" href="${pageContext.request.contextPath}/busi/pension/list.do">펜션정보</a></li>
								<li class="divider"></li>
								<li><a tabindex="-1" href="${pageContext.request.contextPath }/user/logout.do">Logout</a></li>
							</ul></li>
					</ul>
					<ul class="nav">
						<li class="active"><a href="${pageContext.request.contextPath}/data/home.do?userNo=${userVO.no}">대시보드</a></li>
						<li><a href="${pageContext.request.contextPath}/busi/pension/list.do">펜션정보 </a></li>
						<li><a href="${pageContext.request.contextPath}/user/home.do">예약사이트 </a></li>
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
					<div class="alert alert-success">
						<button type="button" class="close" data-dismiss="alert">&times;</button>
						<h4>${ userVO.name }</h4><!-- 펜션이름 설명 -->
						${ userVO.name }의 통계
					</div>
					<div class="navbar">
						<div class="navbar-inner">
							<ul class="breadcrumb">
								<i class="icon-chevron-left hide-sidebar"><a href='#'
									title="Hide Sidebar" rel='tooltip'>&nbsp;</a></i>
								<i class="icon-chevron-right show-sidebar"
									style="display: none;"><a href='#' title="Show Sidebar"
									rel='tooltip'>&nbsp;</a></i>
								<li><a href="#">Dashboard</a> <span class="divider">/</span>
								</li>
								<li><a href="#">Settings</a> <span class="divider">/</span>
								</li>
								<li class="active">Tools</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="row-fluid">
					<!-- block -->
					<div class="block">
						<div class="navbar navbar-inner block-header">
							<div class="muted pull-left">월별 통계</div>
						</div>
						<div class="block-content collapse in">
							<div class="span12">
                                <div id="hero-graph" style="height: 230px;"></div>
                            </div>
						</div>
					</div>
					<!-- /block -->
				</div>
				<div class="row-fluid">
					<div class="span6">
						<!-- block -->
						<div class="block">
							<div class="navbar navbar-inner block-header">
								<div class="muted pull-left">방별 이용객수 TOP3</div>
							</div>
							<div class="block-content collapse in">
								<table class="table table-striped">
									<thead>
										<tr>
											<th>Rank</th>
											<th>펜션이름</th>
											<th>방이름</th>
											<th>이용객수</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${ listP }" begin="0" end="2" step="1" var="dataVO" varStatus="status">
											<tr>
												<td>${ dataVO.rank }</td>
												<td>${ dataVO.houseName }</td>
												<td>${ dataVO.roomName }</td>
												<td>${ dataVO.totalPersonCnt }</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						<!-- /block -->
					</div>
					<div class="span6">
						<!-- block -->
						<div class="block">
							<div class="navbar navbar-inner block-header">
								<div class="muted pull-left">방별 예약건수 TOP3</div>
							</div>
							<div class="block-content collapse in">
								<table class="table table-striped">
									<thead>
										<tr>
											<th>Rank</th>
											<th>펜션이름</th>
											<th>방이름</th>
											<th>예약건수</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${ listR }" var="dataVO" begin="0" end="2" step="1" varStatus="status">
											<tr>
												<td>${ dataVO.rank }</td>
												<td>${ dataVO.houseName }</td>
												<td>${ dataVO.roomName }</td>
												<td>${ dataVO.totalCnt }</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						<!-- /block -->
					</div>
				</div>
				<div class="row-fluid">
					<div class="span6">
						<!-- block -->
						<div class="block">
							<div class="navbar navbar-inner block-header">
								<div class="muted pull-left">방별 수익률 TOP3</div>
							</div>
							<div class="block-content collapse in">
								<table class="table table-striped">
									<thead>
										<tr>
											<th>Rank</th>
											<th>펜션이름</th>
											<th>방이름</th>
											<th>총 이익</th>
											<th>총 수익</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${ listT }" var="dataVO" begin="0" end="2" step="1" varStatus="status">
											<tr>
												<td>${ dataVO.rank }</td>
												<td>${ dataVO.houseName }</td>
												<td>${ dataVO.roomName }</td>
												<td>${ dataVO.totalPrice }</td>
												<td>${ dataVO.totalProfit }</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						<!-- /block -->
					</div>
					<div class="span6">
						<!-- block -->
						<div class="block">
							<div class="navbar navbar-inner block-header">
								<div class="muted pull-left">펜션별 별점 TOP3</div>
							</div>
                        	<div class="block-content collapse in">
                        		<c:forEach items="${ listS }" var="scoreVO" begin="0" end="2" >
									<div class="span4">
										<div class="chart" data-percent="${ scoreVO.avgScore * 10} }"><fmt:formatNumber value="${ scoreVO.avgScore }" pattern="#.##"/></div>
										<div class="chart-bottom-heading">
											<span class="label label-info">${ scoreVO.houseName }</span>
		
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
						<!-- /block -->
					</div>
				</div>
				<div class="row-fluid">
                        <!-- block -->
                        <div class="block">
                            <div class="navbar navbar-inner block-header">
                                <div class="muted pull-left">예약 현황</div>
                            </div>
                            <div class="block-content collapse in">
                                <div class="span12">
                                    
  									<table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="example">
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
											<c:forEach items="${ ckList }" var="ckResList">
												<tr class="odd gradeX">
													<td>${ ckResList.no }</td>
													<td>${ ckResList.houseName }</td>
													<td>${ ckResList.roomName }</td>
													<td class="center">${ ckResList.userName }</td>
													<td class="center">${ ckResList.userTel }</td>
													<td>${ ckResList.resStart }</td>
													<td>${ ckResList.resEnd }</td>
													<td class="center">${ ckResList.personCnt }</td>
													<td>${ ckResList.totalPrice }</td>
													<td>${ ckResList.regDate }</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
                                </div>
                            </div>
                        </div>
                        <!-- /block -->
                    </div>
			</div>
		</div>
		<hr>
		<footer>
			<p>&copy; Vincent Gabriel 2013</p>
		</footer>
	</div>
	<!--/.fluid-container-->
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
            $('.chart').easyPieChart({animate: 1000});
            
         // Morris Line Chart
            var tax_data = ${listMonth};
            Morris.Bar({
                element: 'hero-graph',
                data: tax_data,
                xkey: 'resStart',
                xLabels: "month",
                ykeys: ["count"],
                labels: ["count"]
            });
            
        });
        </script>
</body>

</html>