<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>YOLOWA</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/home/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/home/owl.theme.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/home/owl.carousel.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/home/jquery.vegas.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/home/animate.min.css">
<link href="${pageContext.request.contextPath }/resources/css/home/style.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/css/home/response.css" rel="stylesheet">
<script src="${pageContext.request.contextPath }/resources/js/menu/jquery-1.12.4.js"></script>
<link href="${pageContext.request.contextPath }/resources/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<script>
	if("${param.msg}" !=  "") {
		alert("${param.msg}");
	}
	function update(){
		$('#updateModal').modal();
	}
</script>
</head>
<body>
	<header id="profile" class="header">
		<div id="main-nav" class="navbar navbar-inverse bs-docs-nav"
			role="banner">
			<div class="container">
				<nav class="navbar-collapse collapse" role="navigation" id="bs-navbar-collapse">
					<a role="button" class="links" href="${pageContext.request.contextPath}/user/home.do">
					<img style="width:260px; padding-top:10px" src="${pageContext.request.contextPath }/resources/images/logo.png"></a>
					<ul class="nav navbar-nav navbar-right responsive-nav main-nav-list">
						<li><a href="#profile">프로필</a></li>
						<li><a href="#reservation">예약정보</a></li>
						<li><a href="#zzim">찜목록</a></li>
						<li><a href="#contact">문의하기</a></li>
						<li><a href="#aboutus">ABOUT</a></li>
						<li><a role="button" href="${pageContext.request.contextPath }/user/logout.do" onclick="javascript:return confirm('로그아웃 하시겠습니까?')">로그아웃</a></li>		
					</ul>
				</nav>
			</div>
		</div>
		<div class="container">
			<!-- resumt -->
			<div class="panel panel-info intro col-sm-8 col-sm-offset-2">
				<div class="panel-heading resume-heading">
					<div class="row">
						<div class="col-xs-12">
							<div class="col-xs-12 col-sm-7">
								<figure>
									<img class="img-circle img-responsive" alt="${userVO.name }"
										src="${pageContext.request.contextPath }/resources/images/profile.png">
								</figure>
							</div>
							<div class="col-xs-12 col-sm-5">
								<ul class="list-group">
									<li class="list-group-item alert alert-info">
		    							<i class="fa fa-user"></i> ${userVO.name }</li>
									<li class="list-group-item alert alert-info"><i class="fa fa-phone"></i>
										${userVO.tel }</li>
									<li class="list-group-item alert alert-info"><i class="fa fa-envelope"></i>
										${userVO.email }</li>
									<li class="list-group-item alert alert-info"><i class="fa fa-heart"></i>
										${userVO.birthday }</li>
								</ul>
								<button class="btn pull-right" onclick="update()">수정</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>
	
	<section class="products" data-type="background" data-speed="1" id="reservation">
		<div class="color-overlay">
			<div class="container">

				<!-- SECTION HEADER -->
				<div class="section-header">
					<!-- SECTION TITLE -->
					<h2 class="white-text">예약확인</h2>
				</div>
				<!-- / END SECTION HEADER -->

				<!-- PRODUCTS -->
				<div class="row wow fadeInLeft animated" data-wow-offset="30"
					data-wow-duration="1.5s" data-wow-delay="0.15s">
					<!-- SINGLE PRODUCT -->
					<div class="col-md-12">
						<div class="item item-2">
							<div class="item-overlay"></div>
							<div class="item-content">
								<div class="item-top-content">
									<div class="item-top-content-inner">
										<div class="item-product">
											<div class="item-top-title">
												<h5>Telfez</h5>
												<p class="subdescription">WordPress Theme</p>
											</div>
										</div>
										<div class="item-product-price">
											<span class="price-num green-text">$17</span>
											<p class="subdescription">$36</p>
											<div class="old-price"></div>
										</div>
									</div>
								</div>
								<div class="item-add-content">
									<div class="item-add-content-inner">
										<div class="section">
											<p>Creative WordPress Theme</p>
										</div>
										<div class="section">
											<a href="#" class="btn btn-primary custom-button red-btn">Demo</a><br />
											<a href="#" class="btn btn-primary custom-button green-btn">Buy</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- / END PRODUCTS LIST -->
			</div>
			<!-- / END CONTAINER -->
		</div>
		<!-- / END COLOR OVERLAY -->
	</section> <!-- / END PRODUCTS SECTION -->

	<section class="works" id="zzim">
		<div class="container">
			<div class="section-header">
				<!-- SECTION TITLE -->
				<h2 class="dark-text">나의 찜 리스트</h2>
			</div>
			<div class="row projects">
				<div id="loader">
					<div class="loader-icon"></div>
				</div>
				<div class="col-md-12" id="portfolio-list">
					<!-- PORTFOLIO ITEMS-->
					<ul class="cbp-rfgrid">
						<c:forEach items="${zzimList}" var="houseVO">
							<!-- Pension -->
							<li class="wow fadeInLeft animated" data-wow-offset="30"
								data-wow-duration="1.5s" data-wow-delay="0.15s"><a
								href="${pageContext.request.contextPath}/detail/houseSimple.do?no=${houseVO.no }"
								class="more">
									<img src="${pageContext.request.contextPath }/upload/${houseVO.photo}" />
									<div class="project-info">
										<div class="project-details">
											<h5 class="white-text red-border-bottom">
												<strong>${houseVO.houseName}</strong>
											</h5>
										</div>
									</div>
							</a></li>
							<!-- / Pension -->
						</c:forEach>
					</ul>
				</div>
				<!-- END OF PORTFOLIO ITEMS-->
			</div>
			<div id="loaded-content">
			
			</div>
			<div class="row">
					<div class="col-sm-3 col-sm-offset-3">
						<a id="back-button" class="red-btn" href="#"><i class="icon-fontawesome-webfont-27"></i> Go Back</a>
					</div>
					<div class="col-sm-3">
						<a id="detail-button" class="green-btn" href="#"><i class="icon-fontawesome-webfont-27"></i> More Detail</a>
					</div>
				</div>
   			
			<!-- PROJECT DETAILS WILL BE LOADED HERE -->
		</div>
		<!-- / END CONTAINER -->
	</section>

<section class="contact-us" id="contact">
<div class="container">
	
	<!-- SECTION HEADER -->
        <div class="section-header">
		
		<!-- SECTION TITLE -->
		<h2 class="white-text">Get in touch</h2>
		
		<!-- SHORT DESCRIPTION ABOUT THE SECTION -->
		<h6 class="white-text">
			Have any question? Drop us a message. We will get back to you in 24 hours.
		</h6>
	</div>
	<!-- / END SECTION HEADER -->
	
	<!-- CONTACT FORM-->
	<div class="row">
		
		<form role="form" action="${pageContext.request.contextPath}/board/qwrite.do" method="POST">
			<div class="wow fadeInLeft animated" data-wow-offset="30" data-wow-duration="1.5s" data-wow-delay="0.15s">
			<div class="col-lg-4 col-sm-4">
				<select name="house_no" class="form-control input-box" id="name">
					<option value="99999">관리자</option>
					<c:forEach items="${houseList}" var="houseVO">
						<option value="${houseVO.no }">${houseVO.houseName }</option>
					</c:forEach>
				</select>
			</div>
			<div class="col-lg-4 col-sm-4">
				<input type="hidden" name="user_no" value="${userVO.no}">
				<input type="text" class="form-control input-box" value="${userVO.name}" readonly="readonly">				
			</div>
			</div>
			
			<div class="col-md-12 wow fadeInRight animated" data-wow-offset="30" data-wow-duration="1.5s" data-wow-delay="0.15s">
				<textarea name="question" class="form-control textarea-box" placeholder="Your Message" id="message"></textarea>
			</div>
			
			<button class="btn btn-primary custom-button red-btn wow fadeInLeft animated" id="submit" data-wow-offset="30" data-wow-duration="1.5s" data-wow-delay="0.15s" type="submit">Send Message</button>
		</form>
	</div>
	<!-- / END CONTACT FORM-->
</div> <!-- / END CONTAINER -->
</section> <!-- / END CONTACT US SECTION-->



	<section class="about-us" id="aboutus">
<div class="container">
	
	<!-- SECTION HEADER -->
	<div class="section-header">
		
		<!-- SECTION TITLE -->
		<h2 class="white-text">About US</h2>
		
		<!-- SHORT DESCRIPTION ABOUT THE SECTION -->
		<h6 class="white-text">
				We design &amp; develop qaulity products to reserve the pension &amp; hotel.
		</h6>
	</div>
	<!-- / END SECTION HEADER -->
	
	<!-- 3 COLUMNS OF ABOUT US-->
	<div class="row">
		
		<!-- COLUMN 1 - BIG MESSAGE ABOUT THE COMPANY-->
		<div class="col-lg-4 col-md-4 column">
			<div class="big-intro wow fadeInLeft animated" data-wow-offset="30" data-wow-duration="1.5s" data-wow-delay="0.15s">
				 HYOUNGSUB<br/>DONGJOO<br/>IKHYEON<br/>JIYU
			</div>
		</div>
		
		<!-- COLUMN 2 - BRIEF ABOUT THE COMPANY-->
		<div class="col-lg-4 col-md-4 column">
			<p class="wow fadeInUp animated" data-wow-offset="30" data-wow-duration="1.5s" data-wow-delay="0.15s">
				
				서비스 개발(객실정보, 펜션정보, 가맹신청, 관리자 모드, 블라인드)및 통합, DB설계<br/><br/>
				서비스 개발(펜션 예약하기 및 비용 계산, 객실정보, 펜션정보, 통계)및 통합, DB설계<br/><br/>
				서비스 개발(로그인, 펜션검색, 펜션위치, 펜션 및 객실 등록, 프로필 수정, 찜, 예약 현황)및 통합, Bootstrap, Modal, CSS, DB설계<br/><br/>
				서비스 개발(마이페이지, 찜, 예약 현황, 문의하기, 후기 등록)
			</p>
		</div>
		
		<!-- COLUMN 1 - SKILSS-->
		<div class="col-lg-4 col-md-4 column">
			<ul class="skills wow fadeInRight animated" data-wow-offset="30" data-wow-duration="1.5s" data-wow-delay="0.15s">
				
				<!-- SKILL ONE -->
				<li class="skill">
					<div class="skill-count">
						<input type="text" value="30" data-thickness=".2" class="skill1">
					</div>
					<h6>DB DESIGN</h6>
					<p>
						ORACLE, APACHE
					</p>
				</li>
				
				<!-- SKILL TWO -->
				<li class="skill">
					<div class="skill-count">
						<input type="text" value="60" data-thickness=".2" class="skill2">
					</div>
					<h6>DEVELOPMENT</h6>
					<p>
						JAVA, JAVASCRIPT, JQUERY, AJAX, JSP, JSON
					</p>
				</li>
				
				<!-- SKILL THREE -->
				<li class="skill">
					<div class="skill-count">
						<input type="text" value="80" data-thickness=".2" class="skill3">
					</div>
					<h6>WEB DESIGN</h6>
					<p>
						HTML, CSS, BOOTSTRAP, MODAL
					</p>
				</li>
				
				<!-- SKILL FOUR -->
				<li class="skill">
					<div class="skill-count">
						<input type="text" value="100" data-thickness=".2" class="skill4">
					</div>
					<h6>TEST</h6>
					<p>
						TEST
					</p>
				</li>
				
			</ul> 
		</div> <!-- / END SKILLS COLUMN-->
	</div> <!-- / END 3 COLUMNS OF ABOUT US-->

	<!-- CLIENTS -->
	<div class="our-clients">
		<h5><span class="section-footer-title">YOLOWA</span></h5>
	</div>
	<!-- CLIENT LIST -->
</div> <!-- / END CONTAINER -->

</section> <!-- END ABOUT US SECTION -->
	<footer>
		<div class="col-lg-12 copyright">
			©2017 Yolowa Inc. Develop with <i>심형섭, 전지유, 조익현, 황동주</i>
		</div>
	</footer>
	
<div class="modal fade" id="updateModal">
  <div class="modal-dialog">
		<div class="modal-content" style="min-width:100%">
			<div class="modal-header">
				<!-- 닫기(x) 버튼 -->
				<button type="button" class="close" data-dismiss="modal">x</button>
				<!-- header title -->
			</div>
			<!-- body -->
			<div class="modal-body">
				<div class="row">
					<div class="col-md-12">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h3 class="panel-title">프로필수정</h3>
								
							</div>
							<div class="panel-body">
								<form action="${pageContext.request.contextPath }/user/mypageupdate.do" method="post">
									<div class="col-xs-12">
										<fieldset class="col-xs-10 col-xs-offset-1">
											<div class="input-group form-group">
												<input type="text" class="form-control" value="${ userVO.id }" aria-describedby="addon1" readonly="readonly" name="id">
												<span style="cursor:pointer" role="button" class="input-group-addon" id="addon1">
													<i class="fa fa-user"></i>
												</span>
											</div>
											<div class="input-group form-group">
												<input type="password" class="form-control" value="${ userVO.password }" aria-describedby="addon2" name="password">
												<span style="cursor:pointer" role="button" class="input-group-addon" id="addon2">
													<i class="fa fa-lock  "></i>
												</span>
											</div>
											<div class="input-group form-group">
												<input type="text" class="form-control" value="${ userVO.birthday }" aria-describedby="addon3" readonly="readonly" maxlength="10">
												<span style="cursor:pointer" role="button" class="input-group-addon" id="addon3">
													<i class="fa fa-heart"></i>
												</span>
											</div>
											<div class="input-group form-group">
												<input type="text" class="form-control" value="${ userVO.tel }" aria-describedby="addon4" name="tel" maxlength="13">
												<span style="cursor:pointer" role="button" class="input-group-addon" id="addon3">
													<i class="fa fa-phone"></i>
												</span>
											</div>
											<div class="input-group form-group">
												<input type="text" class="form-control" value="${ userVO.email }" aria-describedby="addon5" name="email">
												<span style="cursor:pointer" role="button" class="input-group-addon" id="addon3">
													<i class="fa fa-envelope"></i>
												</span>
											</div>
										</fieldset>
										<button role="button" class="btn btn-success pull-right" type="submit">수정</button>
									</div>
									<!-- Change this to a button or input when using this as a form -->
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- Footer -->
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
	
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