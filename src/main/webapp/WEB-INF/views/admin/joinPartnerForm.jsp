<%@page import="kr.co.bit.user.vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="${ pageContext.request.contextPath }/admin/joinPartner.do" method="post">
	<div>
		<table border="1">
			<tbody>
				<tr>
					<th>신청자 계정</th>
					<td>${ sessionScope.userVO.id }<input type="hidden" name="userNo" value="${ sessionScope.userVO.no }" readonly="readonly"></td>
				</tr>
				<tr>
					<th>사업자 번호</th>
					<td><input type="text" name="approveKey"></td>
				</tr>
			</tbody>
		</table>
	</div>
	<div>
		<input type="submit" value="신청">
	</div>
	<div>
		<a href=""><button>취소</button></a>
	</div>	
</form>
</body>
</html>