<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/resources/bootstrap/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
	<link href="${pageContext.request.contextPath}/resources/bootstrap/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
    <link href="${pageContext.request.contextPath}/resources/bootstrap/vendors/easypiechart/jquery.easy-pie-chart.css" rel="stylesheet" media="screen">
    <link href="${pageContext.request.contextPath}/resources/bootstrap/assets/styles.css" rel="stylesheet" media="screen">
    <link href="${pageContext.request.contextPath}/resources/bootstrap/assets/DT_bootstrap.css" rel="stylesheet" media="screen">
    <script src="${pageContext.request.contextPath}/resources/bootstrap/vendors/modernizr-2.6.2-respond-1.1.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/bootstrap/vendors/jquery-1.9.1.min.js"></script>


<script>
	function doAction(type) {
		
		switch(type) {
		case 'U' :
			location.href = "${pageContext.request.contextPath}/board/update.do?no=${board.no}";
			break;
		case 'D' : 
			if(confirm("게시물을 삭제하시겠습니까?"))
				location.href = "${pageContext.request.contextPath}/board/delete.do?no=${board.no}";
			break;
		case 'L' :
			location.href = "${pageContext.request.contextPath}/board/list.do?no=${board.house_no}";
			break;
		}
	}
</script>
</head>
<body style="padding-top:0px;">
	<section>
		<!-- block -->
		<div class="block">
			<div class="navbar navbar-inner block-header">
				<div class="muted">${ board.userName }</div>
			</div>
			<div class="block-content collapse in">
					<table cellpadding="0" cellspacing="0" border="0" class="table table-striped">
						<tbody>
						<tr>
							<th>작성일</th>
							<td>${ board.reg_date }</td>
						</tr>
						<tr>
							<th>점수</th>
							<td>${ board.score }</td>
						</tr>
						<tr>
							<th>내용</th>
							<td>${ board.content }"</td> 
						</tr>
						</tbody>
					</table>
			</div>
		</div>
		<div class="table-toolbar">
			<div class="btn-group pull-right">
				<c:if test="${userVO.no == board.user_no }">
					<button class="btn btn-info" onclick="doAction('U')">
						수정 <i class="icon-pencil icon-white"></i>
					</button>
					<button class="btn btn-danger" onclick="doAction('D')">
						삭제 <i class="icon-remove icon-white"></i>
					</button>
				</c:if>
				<button class="btn btn-success" onclick="doAction('L')">
					목록 <i class="icon-list-alt icon-white"></i>
				</button>
			</div>
		</div>
	</section>
</body>
</html>






