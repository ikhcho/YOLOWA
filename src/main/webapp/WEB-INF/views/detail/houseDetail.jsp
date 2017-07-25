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
<script src="${pageContext.request.contextPath }/resources/js/menu/header.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/login/loginForm.js"></script>
<link href="${pageContext.request.contextPath }/resources/css/home/style.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/css/home/response.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/home/owl.theme.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/home/owl.carousel.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/home/jquery.vegas.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/home/animate.min.css">

<link href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css" rel="stylesheet">
<script src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>

<script src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=oAJ6Q1ZOST_VK52BarQt&submodules=geocoder"></script>
<link href="${ pageContext.request.contextPath }/resources/bxslider/jquery.bxslider.css" rel="stylesheet">
<%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/useinfo/useInfo.css"> --%>

<script type="text/javascript">	
	$(function(){
		//예약버튼 uri 설정
		$('.btnReservation').each(function(index){
			$('.btnReservation').eq(index).click(function(){
				if('${userVO.id}' == ""){
					alert("로그인이 필요합니다.");
				} else {
					var popWidth  = '1000'; // 파업사이즈 너비
					var popHeight = '700'; // 팝업사이즈 높이
					var winWidth  = document.body.clientWidth;  // 현재창의 너비
					var winHeight = document.body.clientHeight; // 현재창의 높이
					var winX      = window.screenX || window.screenLeft || 0;// 현재창의 x좌표
					var winY      = window.screenY || window.screenTop || 0; // 현재창의 y좌표
					w = winX + (winWidth - popWidth) / 2;
					h = winY + (winHeight - popHeight) / 2;
					window.open("${ pageContext.request.contextPath }/reservation/houseReservation.do?houseNo=${ houseVO.no }&selectDate="
							+ $('.datepicker').val(), "예약하기", "width="+popWidth + " height="+popHeight +" top=100 left="+w);
				}
			});
		});
		
		//찾아오는 길 Naver Map API
		var map = null;
		$(document).on('click','#mapBtn',function(){
			var myaddress = '${houseVO.addr}';// 도로명 주소나 지번 주소만 가능 (건물명 불가!!!!)
				naver.maps.Service.geocode({address: myaddress}, function(status, response) {
			    if (status !== naver.maps.Service.Status.OK) {
			    	return alert(myaddress + '의 검색 결과가 없거나 기타 네트워크 에러');
			    }
			
			    var result = response.result;
			    
			    //map = new naver.maps.Map('map');
			    
			    map = new naver.maps.Map('map', {
			    	center: new naver.maps.LatLng(result.items[0].point.y, result.items[0].point.x),
		        	zoom: 10
			    });// 검색된 좌표로 지도 생성 
			    
			 	// 검색 결과 갯수: result.total
			    // 첫번째 결과 결과 주소: result.items[0].address
			    // 첫번째 검색 결과 좌표: result.items[0].point.y, result.items[0].point.x
			    var myaddr = new naver.maps.Point(result.items[0].point.x, result.items[0].point.y);
			    			    
			    //map.setCenter(myaddr); // 검색된 좌표로 지도 이동
			    
			    // 마커 표시
			    var marker = new naver.maps.Marker({
					position: myaddr,
					map: map
				}); 
			});
		});
		
		//찜가능여부 확인
		var userNo = '${userVO.no}'; 
		if(userNo == ''){
			userNo=0;
		}
		$.ajax({
			url : '/Yolowa/user/zzim.do',
			type : 'get',
			data : {
				'houseNo' : '${param.no}',
				'userNo' : userNo
			},
			success : function(data){
				if(data == "able"){
					$('#zzim').attr("class","glyphicon glyphicon-heart-empty");
				}else{
					$('#zzim').attr("class","glyphicon glyphicon-heart");
				}
			}
		});
	});
	
	//찜하기
	function zzim(){
		var method;
		if($('#zzim')[0].className.split(" ")[1] == "glyphicon-heart"){
			if(confirm('이미 찜한 펜션입니다.\n목록에서 삭제하겠습니까?')){
				method = "delete";
			}else{
				return false;
			}
		}else{
			method = "insert";
		}
		if('${userVO.no}' == ''){
			alert('로그인이 필요합니다.');
		}else{
			$.ajax({
				url : '/Yolowa/user/zzim.do',
				type : 'post',
				data : {
					'houseNo' : '${param.no}',
					'userNo' : '${userVO.no}',
					'method' : method
				},
				contentType : 'application/x-www-form-urlencoded; charset=utf-8',
				success : function(data){
					if(method =="delete"){
						$('#zzim').attr("class","glyphicon glyphicon-heart-empty");
					}else{
						$('#zzim').attr("class","glyphicon glyphicon-heart");
					}
					alert(data);
				}
			});
		}
	}
</script>
</head>
<body>
<div class="preloader" style="display: none;">
  <div class="status" style="display: none;">&nbsp;</div>
</div>
<jsp:include page="/menu/header.do" />
	<div class="intro" style="margin-top:185px">
		<section class="packages" id="packages">
		<!-- <section class="about-us" id="about-us"> -->
			<div class="container">
				<div class="row">
					<hr />
						<div>
							<button class="btn btn-danger pull-right" onclick="zzim()">찜하기&nbsp;<i class="glyphicon glyphicon-heart-empty" aria-hidden="true" id="zzim"></i></button>
							<h2>${ houseVO.houseName }</h2>
						</div>
						<hr />
					<div class="col-sm-6">
						<img width="100%" height="400px" src="/Yolowa/upload/${houseVO.photo}" alt="${houseVO.houseName }">
					</div>
					<div class="col-sm-6">
						<div class="col-sm-offset-1 text-left">
							<ul>
								<li> 상세주소 : ${ houseVO.addr }</li>
								<li> 입실시간 : ${ houseVO.checkin }</li>
								<li> 퇴실시간 : ${ houseVO.checkout }</li>
								<li>픽업여부 : 
										<c:choose>
											<c:when test="${ houseVO.pickup eq 'Y' }">픽업가능</c:when>
											<c:otherwise>픽업불가능</c:otherwise>
										</c:choose>
								<li> 예약문의 : ${ houseVO.tel }</li>
								<li> 성수기구분 : ${ houseVO.hotStart } ~ ${ houseVO.hotEnd }</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</section>
	</header>
	<section class="products">
			<div class="container">
		<section class="works" id="detail">
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
							<div class="span12">
								<div id="rootwizard">
									<div class="tab-content">
										<div class="tab-pane active" id="room">
											<jsp:include
												page="${ pageContext.request.contentType }/detail/${houseVO.no}/roomInfo.do" />
										</div>
										<div class="tab-pane" id="house">
											<jsp:include page="houseInfo.jsp" />
										</div>
										<div class="tab-pane" id="map">
											<div id="map" class="col-sm-12" style="height:600px;"></div>
										</div>
										<div class="tab-pane" id="board">
											<iframe width="100%" height="600px" frameborder="0"
												src="${ pageContext.request.contextPath }/board/list.do?no=${houseVO.no}">
											</iframe>
										</div>
										<div class="tab-pane" id="notify">
											<jsp:include page="useInfo.jsp"/>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
		</section>
			</div>
			</section>
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