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
	function goWriteForm() {
		location.href = "${ pageContext.request.contextPath }/board/write.do?no=${param.no}";
	}
	
	function doAction(boardNo) {
		location.href = "${ pageContext.request.contextPath }/board/" + boardNo + "/detail.do";
		
	}
	
</script>
</head>
<body style="padding-top:0px;">
	<section>
		<!-- block -->
		<div class="block">
			<div class="navbar navbar-inner block-header">
				<div class="muted">후기게시판</div>
			</div>
			<div class="block-content collapse in">
				<c:if test="${userVO != null }">
					<div class="table-toolbar">
						<div class="btn-group pull-right">
							<button class="btn btn-success" onclick="goWriteForm()">
								등록 <i class="icon-plus icon-white"></i>
							</button>

						</div>
					</div>
				</c:if>
				<br />
				<table cellpadding="0" cellspacing="0" border="0"
					class="table table-striped table-bordered" id="example2">
					<thead>
						<tr>
							<th>게시글번호</th>
							<th>작성자</th>
							<th style="max-width: 700px">후기</th>
							<th>점수</th>
							<th>작성일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${ list }" var="board" varStatus="loop">
							<c:if test="${ board.blind_state == 'N'}">
								<tr>
									<td>${loop.index+1 }</td>
									<td>${board.userName}</td>
									<td><a href="javascript:doAction('${board.no}')"> ${ board.content }"
									</a></td>
									<td>${ board.score }</td>
									<td>${ board.reg_date }</td>
								</tr>
							</c:if>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</section>
</body>
</html>
