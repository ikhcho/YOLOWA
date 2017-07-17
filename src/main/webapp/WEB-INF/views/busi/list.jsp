<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>YOLOWA</title>
	<!-- Bootstrap -->
	<link href="${pageContext.request.contextPath}/resources/bootstrap/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
	<link href="${pageContext.request.contextPath}/resources/bootstrap/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
    <link href="${pageContext.request.contextPath}/resources/bootstrap/vendors/easypiechart/jquery.easy-pie-chart.css" rel="stylesheet" media="screen">
    <link href="${pageContext.request.contextPath}/resources/bootstrap/assets/styles.css" rel="stylesheet" media="screen">
    <link href="${pageContext.request.contextPath}/resources/bootstrap/assets/DT_bootstrap.css" rel="stylesheet" media="screen">
    <script src="${pageContext.request.contextPath}/resources/bootstrap/vendors/modernizr-2.6.2-respond-1.1.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/bootstrap/vendors/jquery-1.9.1.min.js"></script>
    <script>
		function getRoom(houseNo){
			$.ajax({
				url : '/Yolowa/busi/pension/room.do',
				type : 'get',
				data : {
					'no' : houseNo
				},
				success : function(data){
					var obj = JSON.parse(data);
					var text = ''
					for(var i=0; i<obj.length; i++){
						var id = '#house_'+houseNo;
						var text = '<tr><td>' + obj[i].roomName + '</td><td>' + obj[i].style + '</td><td>' + obj[i].roomSize + '</td><td>'
									+ obj[i].personMin + '/' + obj[i].personMax + '</td><td>' + obj[i].nWeekPrice + '</td><td>'
									+ obj[i].nWeekendPrice + '</td><td>' + obj[i].hWeekPrice + '</td><td>' + obj[i].hWeekendPrice + '</td></tr>';
						$(id).append(text);
					}
					console.log(obj);
				}
			});
		}
	</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/busi/header.jsp"/>
	<div class="page-wrapper">
		<div class="container">
			<!--/span-->
			<div class="col-sm-12" id="content">
				<div class="row-fluid">
					<div class="btn-group pull-right">
						<a href="${pageContext.request.contextPath}/busi/pension/regHouse.do">
							<button class="btn btn-success"> Add New <i class="icon-plus icon-white"></i></button>
						</a>
					</div>
				</div>
				<c:if test="${list != null }">
					<c:forEach items="${list}" var="house" >
					<div class="row-fluid">
                        <!-- block -->
                        <div class="block">
                            <div class="navbar navbar-inner block-header">
                                <div class="muted pull-left">${house.houseName }</div>
                            </div>
                            <div class="block-content collapse in">
                                <div class="span3">
                                	<img src="${pageContext.request.contextPath}/resources/images/github-logo.png">
                                </div>
                                <div class="span9">
                                	<table>
                                		<tr>
                                			<th>상세주소</th>
                                			<td>${house.addr }</td>
                                		</tr>
                                		<tr>
                                			<th>전화번호</th>
                                			<td>${house.tel }</td>
                                		</tr>
                                		<tr>
                                			<th>홈페이지주소</th>
                                			<td>${house.homepage }</td>
                                		</tr>
                                	</table>
                                </div>
                                <div class="row-fluid">
                                <div class="span12">
	                            	<div class="block-content collapse in">
	                                	<div class="span12">
											<table class="table table-striped" >
												<thead>
													<tr>
														<th>객실명</th>
														<th>객실 형태(스타일)</th>
														<th>크기</th>
														<th>인원(기준/최대)</th>
														<th>비수기 주중요금</th>
														<th>비수기 주말요금</th>
														<th>성수기 주중요금</th>
														<th>성수기 주말요금</th>
													</tr>
												</thead>
												<tbody id="house_${house.no}">
													<script>
														getRoom('${house.no}');
													</script>
												</tbody>
											</table>
										</div>
	                                </div>
	                            </div>
                                </div>
                            </div>
                        </div>
					</div>
					</c:forEach>
				</c:if>
			</div>
		</div>
	</div>
	<!--/.fluid-container-->
	
	<script src="${pageContext.request.contextPath}/resources/bootstrap/bootstrap/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/bootstrap/vendors/datatables/js/jquery.dataTables.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/bootstrap/assets/scripts.js"></script>
	<script src="${pageContext.request.contextPath}/resources/bootstrap/assets/DT_bootstrap.js"></script>
</body>

</html>