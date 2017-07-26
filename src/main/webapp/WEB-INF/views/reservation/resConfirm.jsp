<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/home/bootstrap.min.css">
<script src="${pageContext.request.contextPath }/resources/js/menu/jquery-1.12.4.js"></script>
<link href="${pageContext.request.contextPath }/resources/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<script src="${pageContext.request.contextPath }/resources/bootstrap/bootstrap/js/bootstrap.min.js"></script>
<link href="${ pageContext.request.contextPath }/resources/bootstrap/bootstrap/css/bootstrap-responsive.css" rel="stylesheet" media="screen">
<link href="${ pageContext.request.contextPath }/resources/bootstrap/assets/styles.css" rel="stylesheet" media="screen">
<script>
	function goRes(){
		opener.parent.location='${pageContext.request.contextPath }/user/mypage.do#reservation';
		window.close();
	}
</script>
</head>
<body>
<script>
	alert('${msg}');
</script>
	<c:forEach items="${resInfo}" var="list" varStatus="status">
		<c:if test="${status.first }">
			<c:set var="houseName" value="${list}" />
		</c:if>
	</c:forEach>
	<div class="container">
		<div class="panel panel-success">
			<div class="panel-heading">
				<div class="row">
					<div class="col-sm-8">
						<h1>${ houseName }</h1>
					</div>
				</div>
			</div>
			<div class="panel-body">
				<table class="table text-center">
					<tr>
						<th class="text-center">객실명</th>
						<th class="text-center">체크인 날짜</th>
						<th class="text-center">체크아웃 날짜</th>
						<th class="text-center">인원</th>
						<th class="text-center">요금</th>
						<th class="text-center">문의사항</th>
					</tr>
					<c:forEach items="${ resList }" var="resVO" varStatus="index">
						<tr>
							<td>${resInfo[index.count]}</td>
							<td>${resVO.resStart}</td>
							<td>${resVO.resEnd}</td>
							<td>${resVO.personCnt}</td>
							<td>${resVO.totalPrice}</td>
							<td>${resVO.content}</td>
						</tr>
					</c:forEach>
				</table>
				<button class="btn pull-right btn-success" onclick="goRes()">예약정보확인</button>
			</div>
		</div>
	</div>
</body>
</html>