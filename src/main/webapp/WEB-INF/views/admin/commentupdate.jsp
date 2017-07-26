<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
	function doList(){
		location.href = "${pageContext.request.contextPath}/admin/clist.do"
	}
</script>
<link rel="stylesheet" href="/Mission-Web/css/layout.css" />
<link rel="stylesheet" href="/Mission-Web/css/board.css" />
</head>
<body>
	<section>
	 <div align="center">
	 	<hr/>
	 	<h2>문의게시판 답변</h2>
	 	<hr/>
	 	<br/>
	 	<form action="qupdate.do" method="post">
			<input type="hidden" name="no" value="${ param.no }" />	 	
	 		<table width="100%">
		 		<tr>
		 			<th width="25%">no</th>
		 			<td>${ board.no }</td>
		 		</tr>
		 		<tr>
		 			<th>house_no</th>
		 			<td>${ board.house_no }</td>
		 		</tr>
		 		<tr>
		 			<th>user_no</th>
		 			<td>${ board.user_no }</td>
		 		</tr>
		 		<tr>
		 			<th>question</th>
		 			<td>${ board.question }</td>
		 		</tr>
		 		<tr>
		 			<th width="25%">answer</th>
		 			<td>
		 				<textarea rows="7" cols="50" name="question">${ board.answer }</textarea>
		 			</td>
		 		</tr>
		 		
		</table>
		<br/><br/>
		<input type="submit" value=" 답변  " />&nbsp;&nbsp; 
		<input type="button" value=" 목록  " onclick="doList()"/> 
		</form>
	 </div>
	 </section>

</body>
</html>