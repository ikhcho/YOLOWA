<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>      
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="${pageContext.request.contextPath}/resources/bootstrap/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
	<link href="${pageContext.request.contextPath}/resources/bootstrap/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
    <link href="${pageContext.request.contextPath}/resources/bootstrap/assets/styles.css" rel="stylesheet" media="screen">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link href="${pageContext.request.contextPath}/resources/bootstrap/vendors/uniform.default.css" rel="stylesheet" media="screen">
    <link href="${pageContext.request.contextPath}/resources/bootstrap/vendors/wysiwyg/bootstrap-wysihtml5.css" rel="stylesheet" media="screen">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="${pageContext.request.contextPath}/resources/bootstrap/vendors/modernizr-2.6.2-respond-1.1.0.min.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/js/checkForm.js" ></script>
<script>
	function doList() {
		location.href = "${pageContext.request.contextPath}/board/list.do?no=${param.no}";
	}
	
	function doWrite() {
		var w = document.writeForm;
		
		if(isNull(w.score, '점수를 입력하세요'))
			return false;
		
		if(w.content.value == "") {
			alert('내용을 입력하세요');
			w.content.focus();
			return false;
		}
		return true;
	}
	
	function checkExt(obj) {
		var forbidName=['exe', 'java', 'jsp', 'js', 'class', 'css'];
		var fileName = obj.value;
		var ext = fileName.substring(fileName.lastIndexOf('.') + 1);
		
		for(var i = 0; i < forbidName.length; i++) {
			if(forbidName[i] == ext) {
				alert(ext + '확장자는 파일업로드 정책에 위배됩니다');
				return true;
			}
		}
		return false;
	}
</script>
 <link rel="stylesheet" 
   	  href="${ pageContext.request.contextPath }/resources/bootstrap/vendors/form.html" />
  <link rel="stylesheet" 
	  href="${ pageContext.request.contextPath }/resources/bootstrap" /> 
</head>
<body style="padding-top:0px;">
	<div class="block">

		<div class="navbar navbar-inner block-header">
			<div class="muted pull-left">이용후기 등록</div>
			<button class="btn pull-right" onclick="doList()">목록보기</button>
		</div>
		<form action="${pageContext.request.contextPath}/board/write.do" method="post">
			<fieldset>
				<div class="block-content collapse in">
					<input type="hidden" name="user_no" value="${ userVO.no }" />
					<input type="hidden" name="house_no" value="${ param.no }" />
					<div class="control-group">
						<label class="control-label">작성자
							<button type="submit" class="btn btn-primary pull-right">등록</button>
						</label>
						<div class="controls">
							<input class="input-xlarge" type="text" readonly="readonly"
								value="${ userVO.name }">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">점수</label>
						<div class="controls">
							<input class="input-xlarge" type="number" name="score" min="1" max="5" placeholder="1~5점까지 등록가능합니다"
								value="${ board.score }">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="textarea2">내용</label>
						<div class="controls">
							<textarea class="input-xlarge textarea" name="content"
								placeholder="${ board.content }"
								style="width: 810px; height: 200px"></textarea>
						</div>
					</div>
			</fieldset>
		</form>
	</div>

	</div>

	<script src="${pageContext.request.contextPath}/resources/bootstrap/vendors/jquery.uniform.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/bootstrap/bootstrap/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/bootstrap/assets/form-validation.js"></script>
	<script src="${pageContext.request.contextPath}/resources/bootstrap/assets/scripts.js"></script>
	<script src="${pageContext.request.contextPath}/resources/bootstrap/vendors/wysiwyg/wysihtml5-0.3.0.js"></script>
    <script src="${pageContext.request.contextPath}/resources/bootstrap/vendors/wysiwyg/bootstrap-wysihtml5.js"></script>
	<script>
		$(".uniform_on").uniform();
		$('.textarea').wysihtml5();
	</script>
</body>
</html>

