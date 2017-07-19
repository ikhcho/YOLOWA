<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>YOLOWA</title>

<!-- header -->
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link href="${pageContext.request.contextPath }/resources/css/menu/header.css" rel="stylesheet">
<script src="${pageContext.request.contextPath }/resources/js/menu/jquery-1.12.4.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/menu/jquery-ui.js"></script>
<script src="${pageContext.request.contextPath }/resources/bootstrap/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/menu/header.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/login/loginForm.js"></script>

<link href="${pageContext.request.contextPath }/resources/css/home/style.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/css/home/response.css" rel="stylesheet">
<link href="${ pageContext.request.contextPath }/resources/bootstrap/bootstrap/css/bootstrap-responsive.css" rel="stylesheet" media="screen">
<link href="${ pageContext.request.contextPath }/resources/bootstrap/assets/styles.css" rel="stylesheet" media="screen">
<link href="${pageContext.request.contextPath }/resources/css/home/style.css" rel="stylesheet">
<script src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=oAJ6Q1ZOST_VK52BarQt&submodules=geocoder"></script>
<script>
	$(function(){
		var map = null;
		$(document).on('click','#mapBtn',function(){
			map = new naver.maps.Map('map');
			var myaddress = '${houseVO.addr}';// 도로명 주소나 지번 주소만 가능 (건물명 불가!!!!)
				naver.maps.Service.geocode({address: myaddress}, function(status, response) {
			    if (status !== naver.maps.Service.Status.OK) {
			    	return alert(myaddress + '의 검색 결과가 없거나 기타 네트워크 에러');
			    }
			
			    var result = response.result;
				// 검색 결과 갯수: result.total
			    // 첫번째 결과 결과 주소: result.items[0].address
			    // 첫번째 검색 결과 좌표: result.items[0].point.y, result.items[0].point.x
			    var myaddr = new naver.maps.Point(result.items[0].point.x, result.items[0].point.y);
			    map.setCenter(myaddr); // 검색된 좌표로 지도 이동
			    // 마커 표시
			    var marker = new naver.maps.Marker({
					position: myaddr,
					map: map
				});
			});
		});
	});
</script>
</head>
<body>
	<jsp:include page="/menu/header.do"/>
		<section class="about-us" id="about-us">
			<div class="container">
				<div class="row-fluid">
					<div class="span6">
						<img width="100%" height="400px" src="/upload/${houseVO.photo}" alt="${houseVO.houseName }">
					</div>
					<div class="span6">
						<hr />
						<div>
							<h2>${ houseVO.houseName }</h2>
						</div>
						<hr />
						<div class="col-sm-6 col-sm-offset-1">
							<div class="row">
								<div class="pull-left"> 상세주소 : ${ houseVO.addr }</div>
							</div>
							<div class="row">
								<div class="pull-left"> 입실시간 : ${ houseVO.checkin }</div>
							</div>
							<div class="row">
								<div class="pull-left"> 퇴실시간 : ${ houseVO.checkout }</div>
							</div>
							<div class="row">
								<div class="pull-left">
									<div>픽업여부 : 
										<c:choose>
											<c:when test="${ houseVO.pickup eq 'Y' }">픽업가능</c:when>
											<c:otherwise>픽업불가능</c:otherwise>
										</c:choose>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="pull-left"> 예약문의 : ${ houseVO.tel }</div>
							</div>
							<div class="row">
								<div class="pull-left"> 성수기구분 : ${ houseVO.hotStart } ~ ${ houseVO.hotEnd }</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<section class="packages " id="packages ">
			<div class="container">
				<div class="row-fluid">
					<div class="panel panel-warning">
						<div class="navbar navbar-inner panel-heading">
							<ul class="nav nav-pills">
								<li class="active"><a href="#room" data-toggle="tab">객실안내</a></li>
								<li><a href="#house" data-toggle="tab">펜션정보</a></li>
								<li><a href="#map" data-toggle="tab" id="mapBtn">찾아오는 길</a></li>
								<li><a href="#board" data-toggle="tab">이용후기</a></li>
								<li><a href="#notify" data-toggle="tab">이용 및 취소안내</a></li>
							</ul>
						</div>
						<div class="panel-body collapse in">
							<div class="span11">
								<div id="rootwizard">
									<div class="tab-content">
										<div class="tab-pane active" id="room">
											<jsp:include
												page="${ pageContext.request.contentType }/detail/${houseVO.no}/roomInfo.do" />
										</div>
										<div class="tab-pane" id="house">
											<jsp:include page="houseInformation.jsp" />
										</div>
										<div class="tab-pane" id="map">
											<div id="map" class="col-sm-12" style="height:600px;"></div>
										</div>
										<div class="tab-pane" id="board"></div>
										<div class="tab-pane" id="notify"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<footer>
			<div class="container">
	
				<!-- COMPANY ADDRESS-->
				<div class="col-md-5 company-details">
					<div class="icon-top red-text">
					    <i class="icon-fontawesome-webfont-302"></i>
					</div>
					PO Box 16122 Collins Street West, Victoria 8007 Australia
				</div>
				
				<!-- COMPANY EMAIL-->
				<div class="col-md-2 company-details">
					<div class="icon-top green-text">
					<i class="icon-fontawesome-webfont-329"></i>
					</div>
					 contact@designlab.co
				</div>
				
				<!-- COMPANY PHONE NUMBER -->
				<div class="col-md-2 company-details">
					<div class="icon-top blue-text">
					<i class="icon-fontawesome-webfont-101"></i>
					</div>
					+613 0000 0000
				</div>
				
				<!-- SOCIAL ICON AND COPYRIGHT -->
				<div class="col-lg-3 col-sm-3 copyright">
					<ul class="social">
						<li><a href=""><i class="icon-facebook"></i></a></li>
						<li><a href=""><i class="icon-twitter-alt"></i></a></li>
						<li><a href=""><i class="icon-linkedin"></i></a></li>
						<li><a href=""><i class="icon-behance"></i></a></li>
						<li><a href=""><i class="icon-dribbble"></i></a></li>
					</ul>
					 ©2013 Zerif LLC
				</div>
			</div>
		</footer>
</body>
</html>