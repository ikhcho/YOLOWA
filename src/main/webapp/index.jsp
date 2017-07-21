<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a href="${ pageContext.request.contextPath }/board/list.do">후기게시판</a>
	<a href="${ pageContext.request.contextPath }/board/write.do">후기등록</a>
<%-- 	<a href="${ pageContext.request.contextPath }/board/qlist.do">문의게시판</a>
	<a href="${ pageContext.request.contextPath }/board/qwrite.do">문의등록</a> --%>
	
	<a href="${ pageContext.request.contextPath }/user/login.do">로그인</a>
	<a href="${ pageContext.request.contextPath }/user/mypageupdate.do">마이페이지</a>

</body>
</html>