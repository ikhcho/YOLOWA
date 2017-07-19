<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>YOLOWA</title>
<!-- CSS -->
<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/css/menu/header.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/css/home/style.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/css/home/response.css" rel="stylesheet">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">


<!-- Javascript -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="${pageContext.request.contextPath }/resources/bootstrap/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/menu/header.js"></script>
<script src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/login/loginForm.js"></script>

</head>
<body>
	<jsp:include page="/menu/header.do" />
		<div id="filter">
			<div class="container">
				<div class="checkbox col-sm-12 text-center">
					<label class="col-sm-2"> <input id="bbq" type="checkbox"
						data-toggle="toggle" data-onstyle="success"><b>바베큐</b>&nbsp;&nbsp;
					</label> <label class="col-sm-2"> <input id="pool" type="checkbox"
						data-toggle="toggle" data-onstyle="success"><b>수영장</b>&nbsp;&nbsp;
					</label> <label class="col-sm-2"> <input id="parking"
						type="checkbox" data-toggle="toggle" data-onstyle="success"><b>주차장</b>&nbsp;&nbsp;
					</label> <label class="col-sm-2"> <input id="singing"
						type="checkbox" data-toggle="toggle" data-onstyle="success"><b>노래방</b>&nbsp;&nbsp;
					</label> <label class="col-sm-2"> <input id="football"
						type="checkbox" data-toggle="toggle" data-onstyle="success"><b>족구장</b>&nbsp;&nbsp;
					</label> <label class="col-sm-2"> <input id="pickup"
						type="checkbox" data-toggle="toggle" data-onstyle="success"><b>픽업</b>
					</label>
				</div>
				<script>
					$('#bbq').change(function() {
						console.log($(this).prop('checked'));
					});
					$('#pool').change(function() {
						console.log($(this).prop('checked'));
					});
					$('#parking').change(function() {
						console.log($(this).prop('checked'));
					});
					$('#singing').change(function() {
						console.log($(this).prop('checked'));
					});
					$('#football').change(function() {
						console.log($(this).prop('checked'));
					});
					$('#pickup').change(function() {
						console.log($(this).prop('checked'));
					});
				</script>
			</div>
		</div>
		<div class="page-wrapper">
			<div class="row">
				<div class="container">
					<section class="works" id="works">
						<div class="container">
		
							<div class="row projects">
								<div id="loader">
									<div class="loader-icon"></div>
								</div>
								<div class="col-md-12" id="portfolio-list">
									<!-- PORTFOLIO ITEMS-->
									<ul class="cbp-rfgrid">
										<c:forEach items="${list}" var="houseVO">
										<!-- Pension -->
										<li class="wow fadeInLeft animated" data-wow-offset="30" data-wow-duration="1.5s" data-wow-delay="0.15s">
											<a href="${pageContext.request.contextPath}/detail/${houseVO.no }/houseDetail.do" class="more">
												<c:if test="${houseVO.photo != null}">
													<img src="${pageContext.request.contextPath }/upload/${houseVO.photo}" alt="project" />
												</c:if>
												<c:if test="${houseVO.photo == null}">
													<img src="${pageContext.request.contextPath }/resources/images/no-image.png" alt="project" />
												</c:if>
												<span class="pull-left blue-text"><h4>${houseVO.houseName}</h4></span>
												<br/>
												<span class="pull-left red-text"><h4>최저가 ${houseVO.price}</h4></span>
												<div class="project-info">
													<div class="project-details">
														<h5 class="white-text red-border-bottom">${houseVO.houseName}</h5>
														<div class="details white-text">
															${houseVO.addr }
														</div>
													</div>
												</div>
											</a>
										</li>
										<!-- / Pension -->
										</c:forEach>
									</ul>
								</div>
								<!-- END OF PORTFOLIO ITEMS-->
							</div>
		
							<!-- PROJECT DETAILS WILL BE LOADED HERE -->
							<div id="loaded-content"></div>
		
							<a id="back-button" class="red-btn" href="#"><i
								class="icon-fontawesome-webfont-27"></i> Go Back</a>
						</div>
						<!-- / END CONTAINER -->
					</section>
					<!-- / END WORKS SECTION -->
				</div>
			</div>
		</div>
</body>
</html>