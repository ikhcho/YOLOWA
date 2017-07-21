<%@page import="kr.co.bit.user.vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%response.sendRedirect("/Yolowa/user/home.do"); %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
	<a href="${ pageContext.request.contextPath }/detail/houseDetail.do?no=1">테스트</a>
	<%
		UserVO userVO = new UserVO();
		userVO.setNo(1);
		userVO.setId("yolowa");
		session.setAttribute("userVO", userVO);
	%>
	<a href="${ pageContext.request.contextPath }/admin/1/getCommentBlindCount.do">Comment Blind 테스트</a>
	
	<a href="${ pageContext.request.contextPath }/admin/joinPartner.do">Partner 테스트</a>
	
	<br>
	<form action="${ pageContext.request.contextPath }/admin/getApproveList.do" method="post">
		<input type="hidden" name="approveState" value="신청">
		<input type="submit" value="전송">
	</form>
	
</body>
</html>
