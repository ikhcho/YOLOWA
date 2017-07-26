<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<<<<<<< HEAD
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%response.sendRedirect("/Yolowa/user/home.do"); %>
    
=======
>>>>>>> branch 'master' of https://github.com/ikhcho/YOLOWA.git
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<<<<<<< HEAD
	<a href="${ pageContext.request.contextPath }/detail/houseDetail.do?no=1">테스트</a>
	<a href="${ pageContext.request.contextPath }/admin/1/getCommentBlindCount.do">Comment Blind 테스트</a>
	<a href="${ pageContext.request.contextPath }/admin/joinPartner.do">Partner 테스트</a>
	
	<br>
	<form action="${ pageContext.request.contextPath }/admin/getApproveList.do" method="post">
		<input type="hidden" name="approveState" value="신청">
		<input type="submit" value="전송">
	</form>
	
	<%-- <select>
		<option value="1">1번</option>
		<option value="2" <c:if test="${ 1 == 1 }"> selected="selected" </c:if>>2번</option>	
		 	
		<option value="3">3번</option>
		<option value="4">4번</option>
		<option value="5">5번</option>
		<option value="6">6번</option>
		<option value="7">7번</option>
	</select> --%>
=======
	<a href="${ pageContext.request.contextPath }/board/list.do">후기게시판</a>
	<a href="${ pageContext.request.contextPath }/board/write.do">후기등록</a>
<%-- 	<a href="${ pageContext.request.contextPath }/board/qlist.do">문의게시판</a>
	<a href="${ pageContext.request.contextPath }/board/qwrite.do">문의등록</a> --%>
	
	<a href="${ pageContext.request.contextPath }/user/login.do">로그인</a>
	<a href="${ pageContext.request.contextPath }/user/mypageupdate.do">마이페이지</a>

>>>>>>> branch 'master' of https://github.com/ikhcho/YOLOWA.git
</body>
</html>
