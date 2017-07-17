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
    <script src="${pageContext.request.contextPath}/resources/bootstrap/vendors/modernizr-2.6.2-respond-1.1.0.min.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/busi/header.jsp"/>
	<div class="page-wrapper">
		<div class="container">
			<!--/span-->
			<div class="col-sm-12" id="content">
				
			</div>
		</div>
	</div>
	<!--/.fluid-container-->
	
    <link href="${pageContext.request.contextPath}/resources/bootstrap/vendors/uniform.default.css" rel="stylesheet" media="screen">
    <link href="${pageContext.request.contextPath}/resources/bootstrap/vendors/chosen.min.css" rel="stylesheet" media="screen">
	<link href="${pageContext.request.contextPath}/resources/bootstrap/vendors/wysiwyg/bootstrap-wysihtml5.css" rel="stylesheet" media="screen">
	<script src="${pageContext.request.contextPath}/resources/bootstrap/vendors/jquery-1.9.1.js"></script>
    <script src="${pageContext.request.contextPath}/resources/bootstrap/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/bootstrap/vendors/jquery.uniform.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/bootstrap/vendors/chosen.jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/bootstrap/vendors/bootstrap-datepicker.js"></script>
	<script src="${pageContext.request.contextPath}/resources/bootstrap/vendors/wysiwyg/wysihtml5-0.3.0.js"></script>
    <script src="${pageContext.request.contextPath}/resources/bootstrap/vendors/wysiwyg/bootstrap-wysihtml5.js"></script>
	<script src="${pageContext.request.contextPath}/resources/bootstrap/vendors/wizard/jquery.bootstrap.wizard.min.js"></script>
	<script type="${pageContext.request.contextPath}/resources/bootstrap/text/javascript" src="vendors/jquery-validation/dist/jquery.validate.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/bootstrap/assets/form-validation.js"></script>
	<script src="${pageContext.request.contextPath}/resources/bootstrap/assets/scripts.js"></script>
    <script>

	jQuery(document).ready(function() {   
	   FormValidation.init();
	});
	

        $(function() {
            $(".datepicker").datepicker();
            $(".uniform_on").uniform();
            $(".chzn-select").chosen();
            $('.textarea').wysihtml5();

            $('#rootwizard').bootstrapWizard({onTabShow: function(tab, navigation, index) {
                var $total = navigation.find('li').length;
                var $current = index+1;
                var $percent = ($current/$total) * 100;
                $('#rootwizard').find('.bar').css({width:$percent+'%'});
                // If it's the last tab then hide the last button and show the finish instead
                if($current >= $total) {
                    $('#rootwizard').find('.pager .next').hide();
                    $('#rootwizard').find('.pager .finish').show();
                    $('#rootwizard').find('.pager .finish').removeClass('disabled');
                } else {
                    $('#rootwizard').find('.pager .next').show();
                    $('#rootwizard').find('.pager .finish').hide();
                }
            }});
            $('#rootwizard .finish').click(function() {
                alert('Finished!, Starting over!');
                $('#rootwizard').find("a[href*='tab1']").trigger('click');
            });
        });
        </script>
</body>

</html>