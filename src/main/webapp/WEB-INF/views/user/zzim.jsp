<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>찜 목록 보기 페이지</title>

<link rel="stylesheet" 
   	  href="${ pageContext.request.contextPath }/resources/css/layout.css" />
<link rel="stylesheet" 
	  href="${ pageContext.request.contextPath }/resources/css/board.css" />
</head>
<body>
	<section>
	 <div align="center">
	 	<hr/>
	 	<h2>찜 목록 보기</h2>
	 	<hr/>
	 	<br/>
	 		<table width="100%">
	 		<c:forEach items="${ zzimList }" var="homeListVO">
		 		<tr>
		 			<th>찜펜션 사진</th>
		 			<td><img src="http://52.78.17.198:8080/Yolowa/upload/${ homeListVO.photo }"/></td>
		 		</tr>
		 		<tr>
		 			<th>찜펜션 이름</th>
		 			<td>${ homeListVO.houseName }</td>
		 		</tr>
		 		<tr>
		 			<th>찜펜션 주소</th>
		 			<td>${ homeListVO.addr }</td>
		 		</tr>
		 	</c:forEach>	
			</table>
			
	 </div>
	 </section> 
</body>
</html>