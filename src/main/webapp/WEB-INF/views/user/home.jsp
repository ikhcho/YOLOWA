<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
<script src="${pageContext.request.contextPath }/resources/js/menu/header.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/login/loginForm.js"></script>
<link href="${pageContext.request.contextPath }/resources/css/home/style.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/css/home/response.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/home/owl.theme.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/home/owl.carousel.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/home/jquery.vegas.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/home/animate.min.css">

<!-- filter -->
<link href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css" rel="stylesheet">
<script src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>
<script>
$(function(){
	var option = [];
	function removeOption(arr, name) {
		arr = Array.from(new Set(arr));
		var index = arr.indexOf(name);
		arr.splice(index, 1);
		return arr;
	}
	$('#bbq').change(function() {
		if ($(this).prop('checked')) {
			$('.bbq-N').hide(1000);
			option.push('.bbq-N');
		} else {
			$('.bbq-N').show(1000);
			option = removeOption(option, '.bbq-N');
			for ( var i in option) {
				$(option[i]).hide();
			}
		}
	});
	$('#pool').change(function() {
		if ($(this).prop('checked')) {
			$('.pool-N').hide(1000);
			option.push('.pool-N');
		} else {
			$('.pool-N').show(1000);
			option = removeOption(option, '.pool-N');
			for ( var i in option) {
				$(option[i]).hide();
			}
		}
	});
	$('#parking').change(function() {
		if ($(this).prop('checked')) {
			$('.parking-N').hide(1000);
			option.push('.parking-N');
		} else {
			$('.parking-N').show(1000);
			option = removeOption(option, '.parking-N');
			for ( var i in option) {
				$(option[i]).hide();
			}
		}
	});
	$('#singing').change(function() {
		if ($(this).prop('checked')) {
			$('.singing-N').hide(1000);
			option.push('.singing-N');
		} else {
			$('.singing-N').show(1000);
			option = removeOption(option, '.singing-N');
			for ( var i in option) {
				$(option[i]).hide();
			}
		}
	});
	$('#football').change(function() {
		if ($(this).prop('checked')) {
			$('.football-N').hide(1000);
			option.push('.football-N');
		} else {
			$('.football-N').show(1000);
			option = removeOption(option, '.football-N');
			for ( var i in option) {
				$(option[i]).hide();
			}
		}
	});
	$('#pickup').change(function() {
		if ($(this).prop('checked')) {
			$('.pickup-N').hide(1000);
			option.push('.pickup-N');
		} else {
			$('.pickup-N').show(1000);
			option = removeOption(option, '.pickup-N');
			for ( var i in option) {
				$(option[i]).hide();
			}
		}
	});
});
</script>
</head>
<body>
<div class="preloader" style="display: none;">
  <div class="status" style="display: none;">&nbsp;</div>
</div>
	<jsp:include page="/menu/header.do" />
	<div class="intro" style="margin-top:185px">
		<section class="packages" id="packages">
			<div class="container">
				<div id="filter">
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
				</div>
				<c:if test="${list == '[]' }">
					<a href="${pageContext.request.contextPath }/user/home.do"><img width="100%" src="${pageContext.request.contextPath }/resources/images/no-find-house.jpg"></a>
				</c:if>
				<div class="row projects">
					<div id="loader">
						<div class="loader-icon"></div>
					</div>
					<div class="col-md-12" id="portfolio-list">
						<!-- PORTFOLIO ITEMS-->
						<ul class="cbp-rfgrid">
							<c:forEach items="${list}" var="houseVO">
								<!-- Pension -->
								<li class="wow fadeInLeft animated" data-wow-offset="30"
									data-wow-duration="1.5s" data-wow-delay="0.15s"><a
									href="${pageContext.request.contextPath}/detail/houseSimple.do?no=${houseVO.no }"
									class="more"> 
									<c:if test="${houseVO.photo != null}">
											<img src="${pageContext.request.contextPath }/upload/${houseVO.photo}" 
											class="bbq-${houseVO.bbq} pool-${houseVO.pool} parking-${houseVO.parking}
											singing-${houseVO.singing} football-${houseVO.football} pickup-${houseVO.pickup}"/>
										</c:if> 
										<c:if test="${houseVO.photo == null}">
											<img src="${pageContext.request.contextPath }/resources/images/noImage.png"
											class="bbq-${houseVO.bbq} pool-${houseVO.pool} parking-${houseVO.parking}
											singing-${houseVO.singing} football-${houseVO.football} pickup-${houseVO.pickup}"/>
										</c:if>
										<div class="project-info">
											<div class="project-details">
												<h5 class="white-text red-border-bottom">
													<strong>${houseVO.houseName}</strong>
												</h5>
												<div class="details white-text">최저가 ${houseVO.price}</div>
											</div>
										</div>
								</a></li>
								<!-- / Pension -->
							</c:forEach>
							
						</ul>
					</div>
					<!-- END OF PORTFOLIO ITEMS-->
				</div>
				<div id="loaded-content"></div>
				<div class="row">
					<div class="col-sm-3 col-sm-offset-3">
						<a id="back-button" class="red-btn" href="#"><i class="icon-fontawesome-webfont-27"></i> Go Back</a>
					</div>
					<div class="col-sm-3">
						<a id="detail-button" class="green-btn" href="#"><i class="icon-fontawesome-webfont-27"></i> More Detail</a>
					</div>
				</div>
				<!-- PROJECT DETAILS WILL BE LOADED HERE -->
				<!-- / END CONTAINER -->
			</div>
		</section>
		<!-- / END WORKS SECTION -->
	</div>
	</header>
	<footer>
		<div class="container">

			<!-- SOCIAL ICON AND COPYRIGHT -->
			<div class="col-lg-12 copyright">
				©2017 Yolowa Inc. Develop with <i>심형섭, 전지유, 조익현, 황동주</i>
			</div>
		</div>
	</footer>
	<script src="${pageContext.request.contextPath }/resources/js/menu/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/menu/wow.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/menu/jquery.nav.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/menu/jquery.knob.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/menu/owl.carousel.min.js"></script>
<%-- <script src="${pageContext.request.contextPath }/resources/js/menu/smoothscroll.js"></script> --%>
<script src="${pageContext.request.contextPath }/resources/js/menu/jquery.vegas.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/menu/zerif.js"></script>
</body>
</html>