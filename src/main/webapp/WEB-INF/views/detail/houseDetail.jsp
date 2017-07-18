<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link
	href="${ pageContext.request.contextPath }/resources/bootstrap/bootstrap/css/bootstrap.css"
	rel="stylesheet" media="screen">
<link
	href="${ pageContext.request.contextPath }/resources/bootstrap/bootstrap/css/bootstrap-responsive.css"
	rel="stylesheet" media="screen">
<link
	href="${ pageContext.request.contextPath }/resources/bootstrap/assets/styles.css"
	rel="stylesheet" media="screen">
<style>
.dongjoo th td {
	text-align: center;
}
</style>
</head>
<body>
	<header>
		<jsp:include page="/menu/header.do"></jsp:include>
	</header>
	<div class="page-wrapper">
		<div class="container">
			<div class="row-fluid">
				<div class="span6">
					<img
						src="http://image.wooripension.com/pension_images/w0101281/Exterior_files/20145914220.jpg"
						alt="">
				</div>
				<div class="span6">
					<hr />
					<div>
						<h2>${ houseVO.houseName }</h2>
					</div>
					<hr />
					<div>상세주소 : ${ houseVO.addr }</div>
					<div>입실시간 : ${ houseVO.checkin }</div>
					<div>퇴실시간 : ${ houseVO.checkout }</div>
					<div>픽업여부 : ${ houseVO.pickup }</div>
					<div>예약문의 : ${ houseVO.tel }</div>
					<div>성수기구분 : ${ houseVO.hotStart } ~ ${ houseVO.hotEnd }</div>
				</div>
			</div>

			<div class="block">
				<div class="navbar navbar-inner block-header">
					<ul class="nav nav-pills">
						<li class="active"><a href="#taba" data-toggle="tab">객실안내</a></li>
						<li><a href="#tabb" data-toggle="tab">펜션정보</a></li>
						<li><a href="#tabc" data-toggle="tab">찾아오는 길</a></li>
						<li><a href="#tabd" data-toggle="tab">이용후기</a></li>
						<li><a href="#tabe" data-toggle="tab">이용 및 취소안내</a></li>
					</ul>
				</div>
				<div class="block-content collapse in">
					<div class="span11">
						<div id="rootwizard">
							<div class="tab-content">
								<div class="tab-pane active" id="taba">
									<jsp:include
										page="${ pageContext.request.contentType }/detail/${houseVO.no}/roomInfo.do" />
								</div>
								<div class="tab-pane" id="tabb">
									<jsp:include page="houseInformation.jsp" />
								</div>
								<div class="tab-pane" id="tabc"></div>
								<div class="tab-pane" id="tabd"></div>
								<div class="tab-pane" id="tabe"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script
		src="${ pageContext.request.contextPath }/resources/bootstrap/vendors/jquery-1.9.1.js"></script>
	<script
		src="${ pageContext.request.contextPath }/resources/bootstrap/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>