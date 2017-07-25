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
						var text = '<tr><td rowspan="2">' + obj[i].roomName + '</td><td rowspan="2">' + obj[i].style + '</td><td rowspan="2">' + obj[i].roomSize 
									+ '</td><td rowspan="2">' + obj[i].personMin + '/' + obj[i].personMax + '</td><td>' + '비수기' 
									+ '</td><td>' + obj[i].nWeekPrice + '</td><td>' + obj[i].nWeekendPrice + '</td><td rowspan="2">'
									+ '<a href="${pageContext.request.contextPath}/busi/pension/updateRoom.do?houseNo='+houseNo+'&roomNo='+ obj[i].no +'">'
									+ '<button class="btn btn-info"><i class="icon-pencil icon-white"></i></button></a>' + '</td><td rowspan="2">'
									+ '<a><button class="btn btn-danger" onclick="roomDel(' + obj[i].no + ')">'
									+ '<i class="icon-remove icon-white"></i></button>' + '</td></tr>'
									+ '<tr><td>' + '성수기' + '</td><td>' + obj[i].hWeekPrice + '</td><td>' + obj[i].hWeekendPrice + '</td></tr>';
						$(id).append(text);
					}
					console.log(obj);
				}
			});
		}
		function houseDel(no){
			var text = prompt('\"지금삭제\"를 입력하시면 삭제됩니다.\n 삭제된 데이터는 복구할 수 없습니다.');
			if(text=='지금삭제'){
				location.href="${pageContext.request.contextPath}/busi/pension/deleteHouse.do?no="+no;
			}
		}
		function roomDel(no){
			var text = prompt('\"지금삭제\"를 입력하시면 삭제됩니다.\n 삭제된 데이터는 복구할 수 없습니다.');
			if(text=='지금삭제'){
				location.href="${pageContext.request.contextPath}/busi/pension/deleteRoom.do?no="+no;
			}
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
						<li><a href="${pageContext.request.contextPath}/data/home.do?userNo=${ userVO.no }">대시보드</a></li>
						<li class="active"><a href="${pageContext.request.contextPath}/busi/pension/list.do">펜션정보 </a></li>
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
					<div class="btn-group pull-right">
						<a href="${pageContext.request.contextPath}/busi/pension/regHouse.do">
							<button class="btn btn-success"> 펜션추가 <i class="icon-plus icon-white"></i></button>
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
                                <div class="btn-group pull-right">
                                	<a>
										<button class="btn btn-danger" onclick="houseDel(${house.no})"> 삭제 <i class="icon-remove icon-white"></i></button>
									</a>
								</div>
                            </div>
                            <div class="block-content collapse in">
                                <div class="span3">
                                	<img src="${pageContext.request.contextPath}/upload/${house.photo}">
                                </div>
                                <div class="span9">
									<div class="row-fluid">
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
                                </div>
                                <div class="row-fluid">
                                <div class="span12">
	                            	<div class="block-content collapse in">
	                                	<div class="span12">
											<table class="table table-striped" >
												<thead>
													<tr>
														<th><p>객실명</p></th>
														<th><p>객실 형태(스타일)</p></th>
														<th><p>크기</p></th>
														<th><p>인원(기준/최대)</p></th>
														<th><p>기간</p></th>
														<th><p>주중요금</p></th>
														<th><p>주말요금</p></th>
														<th colspan="2">
															<a href="${pageContext.request.contextPath}/busi/pension/regRoom.do?no=${house.no}">
																<button class="btn btn-success"> 객실추가 <i class="icon-plus icon-white"></i></button>
															</a>
														</th>
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