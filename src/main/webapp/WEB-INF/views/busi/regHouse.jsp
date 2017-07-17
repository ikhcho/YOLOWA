<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>YOLOWA</title>
	<!-- Bootstrap -->
	<link href="${pageContext.request.contextPath}/resources/bootstrap/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
	<link href="${pageContext.request.contextPath}/resources/bootstrap/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
    <link href="${pageContext.request.contextPath}/resources/bootstrap/assets/styles.css" rel="stylesheet" media="screen">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link href="${pageContext.request.contextPath}/resources/bootstrap/vendors/uniform.default.css" rel="stylesheet" media="screen">
    <link href="${pageContext.request.contextPath}/resources/bootstrap/vendors/wysiwyg/bootstrap-wysihtml5.css" rel="stylesheet" media="screen">
    <script src="${pageContext.request.contextPath}/resources/bootstrap/vendors/modernizr-2.6.2-respond-1.1.0.min.js"></script>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<script>
	 $(function(){
		 $(':reset').click(function(){
				history.go(-1);
			}); 
	 });
		function doWrite(){
			
			var w = document.writeForm;
			
			if(w.houseName.value==""){
				alert("펜션이름을 입력하세요");
				w.houseName.focus();
				return false;
			}
			
			if(w.addr.value == ""){
				alert("주소를 입력하세요");
				w.addr.focus();
				return false;
			}
			
			if(w.tel.value == ""){
				alert("전화번호를 입력하세요");
				w.tel.focus();
				return false;
			}
			
			if(w.roomCnt.value == ""){
				alert("객실개수를 입력하세요");
				w.roomCnt.focus();
				return false;
			}
			
			if(w.checkin.value == ""){
				alert("체크인 시간을 입력하세요");
				w.checkin.focus();
				return false;
			}
			
			if(w.checkout.value == ""){
				alert("체크아웃 시간을 입력하세요");
				w.checkout.focus();
				return false;
			}

			if(w.content.value == ""){
				alert("펜션소개를 입력하세요");
				w.content.focus();
				return false;
			}
			
			
			//파일 확장자 체크
			if(checkExt(w.photo)) { //document.writeform.attatchfile1/2
				return false;
			}	
			
			return true;
		}
		
		function checkExt(obj){
			var forbidName = ['exe','java','jsp','js','class','css', 'txt', 'pdf'];
			var fileName = obj.value;
			var index = fileName.lastIndexOf('.');
			var ext = fileName.substring(index+1);
			console.log(ext);
			
			for(var i=0; i<forbidName.length; i++){
				if(forbidName[i] == ext){
					alert(ext + '확장자는 파일 업로드 정책에 위배됩니다');
					document.writeForm.attachfile.focus();
					return true;
				}
			}
			return false;
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
						<li><a href="${pageContext.request.contextPath}/busi/home.do">대시보드</a></li>
						<li class="active"><a href="${pageContext.request.contextPath}/busi/pension/list.do">펜션정보 </a></li>
						<li><a href="${pageContext.request.contextPath}/busi/home.do">예약사이트 </a></li>
					</ul>
				</div>
				<!--/.nav-collapse -->
			</div>
		</div>
	</div>
	<div class="page-wrapper">
		<div class="container">
			<!--/span-->
			<div class="span12" id="content">
				<div class="row-fluid">
					<!-- block -->
					<div class="block">
						<div class="navbar navbar-inner block-header">
							<div class="muted pull-left">펜션등록</div>
						</div>
						<div class="block-content collapse in">
							<div class="span12">
								<form role="form"  class="form-horizontal" action="${pageContext.request.contextPath}/busi/pension/regHouse.do" method="post" enctype="multipart/form-data" onsubmit="return doWrite()" name="writeForm"> 
									<fieldset>
										<input type="hidden" name="userNo" value="${userVO.no }">
										<div class="control-group">
											<label class="control-label">*펜션이름</label>
											<div class="controls">
												<input class="input-xlarge focused" type="text" name="houseName">
											</div>
										</div>
										<div class="control-group">
											<label class="control-label">*주소</label>
											<div class="controls">
												<input class="input-xlarge focused" type="text" name="addr">
											</div>
										</div>
										<div class="control-group">
											<label class="control-label">*전화번호</label>
											<div class="controls">
												<input class="input-xlarge focused" type="text" name="tel">
											</div>
										</div>
										<div class="control-group">
											<label class="control-label">*객실개수</label>
											<div class="controls">
												<input class="input-xlarge focused" type="text" name="roomCnt">
											</div>
										</div>
										<div class="control-group">
											<label class="control-label">펜션옵션</label>
											<div class="controls">
												<label><input type="checkbox" name="bbq" value="Y">바베큐가능</label>
												<label><input type="checkbox" name="pool" value="Y">수영장보유</label>
												<label><input type="checkbox" name="singing" value="Y">노래장보유</label>
												<label><input type="checkbox" name="football" value="Y">족구장보유</label>
												<label><input type="checkbox" name="parking" value="Y">주차가능</label>
												<label><input type="checkbox" name="pickup" value="Y">픽업가능</label>
											</div>
										</div>
										<div class="control-group">
											<label class="control-label">홈페이지 주소</label>
											<div class="controls">
												<input class="input-xlarge focused" type="text" name="homepage">
											</div>
										</div>
										<div class="control-group">
											<label class="control-label">성수기설정</label>
											<div class="controls">
												<label><input type="text" class="input-xlarge datepicker" name="hotStart" placeholder="시작일"></label>
												<label><input type="text" class="input-xlarge datepicker" name="hotEnd" placeholder="종료일"></label>
											</div>
										</div>
                                        <div class="control-group">
											<label class="control-label">사진등록</label>
											<div class="controls">
	                                            <div class="uploader" id="uniform-fileInput">
		                                            <input class="input-file uniform_on" id="fileInput" type="file" name="photo">
		                                            <span class="filename" style="user-select: none;">No file selected</span>
		                                            <span class="action" style="user-select: none;">Choose File</span>
	                                            </div>
                                        	</div>
                                        </div>
                                        <div class="control-group">
											<label class="control-label">*체크인 시간</label>
											<div class="controls">
												<input class="input-xlarge focused" type="text" name="checkin">
											</div>
										</div>
										<div class="control-group">
											<label class="control-label">*체크아웃 시간</label>
											<div class="controls">
												<input class="input-xlarge focused" type="text" name="checkout">
											</div>
										</div>
										<div class="control-group">
                                          <label class="control-label" for="textarea2">*펜션소개</label>
                                          <div class="controls">
                                            <textarea class="input-xlarge textarea" name="content" placeholder="Enter text ..." style="width: 810px; height: 200px"></textarea>
                                          </div>
                                        </div>
										<div class="form-actions">
											<button type="submit" class="btn btn-primary">등록</button>
											<button type="reset" class="btn">취소</button>
										</div>
									</fieldset>
								</form>
							</div>
						</div>
					</div>
					<!-- /block -->
				</div>
			</div>
		</div>
	</div>
	<!--/.fluid-container-->
	
	<script src="${pageContext.request.contextPath}/resources/bootstrap/vendors/jquery.uniform.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/bootstrap/bootstrap/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/bootstrap/assets/form-validation.js"></script>
	<script src="${pageContext.request.contextPath}/resources/bootstrap/assets/scripts.js"></script>
	<script src="${pageContext.request.contextPath}/resources/bootstrap/vendors/wysiwyg/wysihtml5-0.3.0.js"></script>
    <script src="${pageContext.request.contextPath}/resources/bootstrap/vendors/wysiwyg/bootstrap-wysihtml5.js"></script>
	<script>
		$( ".datepicker" ).datepicker({
			dateFormat: "yy-mm-dd"
		});
		$(".uniform_on").uniform();
		$('.textarea').wysihtml5();
	</script>

</body>

</html>