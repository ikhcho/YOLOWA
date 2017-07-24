<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
	<table border="1">
		<tr>
			<th>유저번호 userNo</th>
			<th>승인 상태 approveState</th>
			<th>사업자번호 approveKey</th>
		</tr>
		<c:forEach items="${ approve }" var="approveVO">
		<tr>
			<td>${ approveVO.userNo }</td>
			<td>${ approveVO.approveState }</td>
			<td>${ approveVO.approveKey }</td>
		</tr>
		</c:forEach>
	</table>
</div>
<div>
	<form action="${pageContext.request.contextPath}/admin/getApprove.do" method="post">
		<!-- <select name="userNo">
			<option value="1">1</option>
			<option value="41">41</option>			
		</select> -->
		
		<input type="radio" name="approveState" value="승인">
		<input type="radio" name="approveState" value="신청">
		
		<input type="submit" value="전송">
	</form>
</div>
</body>
</html>