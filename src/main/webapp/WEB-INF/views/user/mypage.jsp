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
						<li><a href="#contact">고객센터</a></li>
						<li><a href="#aboutus">ABOUT</a></li>
					</ul>
				</nav>
			</div>
		</div>
		<div class="container">
			<!-- resumt -->
			<div class="panel panel-info intro col-sm-8 col-sm-offset-2">
				<div class="panel-heading resume-heading">
					<div class="row">
						<div class="col-lg-12">
							<div class="col-xs-12 col-sm-7">
								<figure>
									<img class="img-circle img-responsive" alt="${userVO.name }"
										src="${pageContext.request.contextPath }/resources/images/profile.png">
								</figure>
							</div>
							<div class="col-xs-12 col-sm-5">
								<ul class="list-group">
									<li class="list-group-item">${userVO.name }</li>
									<li class="list-group-item alert alert-info"><i class="fa fa-phone"></i>
										${userVO.tel }</li>
									<li class="list-group-item alert alert-info"><i class="fa fa-envelope"></i>
										${userVO.email }</li>
									<li class="list-group-item alert alert-info"><i class="fa fa-envelope"></i>
										${userVO.birthday }</li>
								</ul>
								
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
				<a id="back-button" class="red-btn" href="#"><i class="icon-fontawesome-webfont-27"></i> Go Back</a>
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
		<form role="form" class="contact-form" id="contact-form">
			<div class="wow fadeInLeft animated" data-wow-offset="30" data-wow-duration="1.5s" data-wow-delay="0.15s">
			<div class="col-lg-4 col-sm-4">
				<input type="text" name="name" placeholder="Your Name" class="form-control input-box" id="name">
			</div>
			<div class="col-lg-4 col-sm-4">
				<input type="email" name="email" placeholder="Your Email" class="form-control input-box" id="email">
			</div>
			<div class="col-lg-4 col-sm-4">
				<input type="text" name="subject" placeholder="Subject" class="form-control input-box" id="subject">
			</div>
			</div>
			
			<div class="col-md-12 wow fadeInRight animated" data-wow-offset="30" data-wow-duration="1.5s" data-wow-delay="0.15s">
				<textarea name="message" class="form-control textarea-box" placeholder="Your Message" id="message"></textarea>
			</div>
			<!-- IF MAIL SENT SUCCESSFULLY -->
					<h4 class="success pull-left white-text">
						Your message has been sent successfully.
					</h4>
					
					<!-- IF MAIL SENDING UNSUCCESSFULL -->
					<h4 class="error pull-left white-text">
						E-mail must be valid and message must be longer than 1 character.
					</h4>
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
				We design &amp; develop qaulity products to help small &amp; medium level business.
		</h6>
	</div>
	<!-- / END SECTION HEADER -->
	
	<!-- 3 COLUMNS OF ABOUT US-->
	<div class="row">
		
		<!-- COLUMN 1 - BIG MESSAGE ABOUT THE COMPANY-->
		<div class="col-lg-4 col-md-4 column">
			<div class="big-intro wow fadeInLeft animated" data-wow-offset="30" data-wow-duration="1.5s" data-wow-delay="0.15s">
				 Developing Amazing Things with Passion since 2002.
			</div>
		</div>
		
		<!-- COLUMN 2 - BRIEF ABOUT THE COMPANY-->
		<div class="col-lg-4 col-md-4 column">
			<p class="wow fadeInUp animated" data-wow-offset="30" data-wow-duration="1.5s" data-wow-delay="0.15s">
				 Created forth two. Behold appear first, kind all i saying fowl man itself moved which every open shall moved subdue appear. Saying life wherein stars. Give dry, own, male had that us third lesser over deep. May every bring in it Whose. Female earth heaven won't behold female.<br/><br/>
				Moved bearing give a two after. Had. Seas. Man they're. Grass above kind saying thing for that void sixth fly His after it.<br/><br/>
				The set doesn't moved. Deep don't fruit fowl gathering heaven days moving creeping under from i air. Set it fifth Meat was darkness. every bring in it Whose. Female earth heaven won't behold female.
			</p>
		</div>
		
		<!-- COLUMN 1 - SKILSS-->
		<div class="col-lg-4 col-md-4 column">
			<ul class="skills wow fadeInRight animated" data-wow-offset="30" data-wow-duration="1.5s" data-wow-delay="0.15s">
				
				<!-- SKILL ONE -->
				<li class="skill">
					<div class="skill-count">
						<input type="text" value="86" data-thickness=".2" class="skill1">
					</div>
					<h6>Web Design</h6>
					<p>
						We are expert on HTML development. Clean, semantic and valid HTML codes.
					</p>
				</li>
				
				<!-- SKILL TWO -->
				<li class="skill">
					<div class="skill-count">
						<input type="text" value="80" data-thickness=".2" class="skill2">
					</div>
					<h6>development</h6>
					<p>
						We are expert on HTML development. Clean, semantic and valid HTML codes.
					</p>
				</li>
				
				<!-- SKILL THREE -->
				<li class="skill">
					<div class="skill-count">
						<input type="text" value="89" data-thickness=".2" class="skill3">
					</div>
					<h6>photography</h6>
					<p>
						We are expert on HTML development. Clean, semantic and valid HTML codes.
					</p>
				</li>
				
				<!-- SKILL FOUR -->
				<li class="skill">
					<div class="skill-count">
						<input type="text" value="95" data-thickness=".2" class="skill4">
					</div>
					<h6>SEO</h6>
					<p>
						We are expert on HTML development. Clean, semantic and valid HTML codes.
					</p>
				</li>
				
			</ul> 
		</div> <!-- / END SKILLS COLUMN-->
	</div> <!-- / END 3 COLUMNS OF ABOUT US-->

	<!-- CLIENTS -->
	<div class="our-clients">
		<h5><span class="section-footer-title">OUR HAPPY CLIENTS</span></h5>
	</div>
	<!-- CLIENT LIST -->
</div> <!-- / END CONTAINER -->

</section> <!-- END ABOUT US SECTION -->

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