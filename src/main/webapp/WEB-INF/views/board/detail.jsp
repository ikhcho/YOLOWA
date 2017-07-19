<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
	function doAction(type) {
		
		switch(type) {
		case 'U' :
			location.href = "${pageContext.request.contextPath}/board/update.do?no=${board.no}";
			break;
		case 'D' : 
			if(confirm("${board.no}번 게시물을 삭제하시겠습니까?"))
				location.href = "${pageContext.request.contextPath}/board/delete.do?no=${board.no}";
			break;
		case 'L' :
			location.href = "${pageContext.request.contextPath}/board/list.do";
			break;
		}
	}
</script>
 <link rel="stylesheet" 
   	  href="${ pageContext.request.contextPath }/resources/css/layout.css" />
<link rel="stylesheet" 
	  href="${ pageContext.request.contextPath }/resources/css/board.css" /> 
</head>
<body>
	<%-- <header>
		<jsp:include page="/jsp/include/topMenu.jsp" />
	</header> --%>
	<section>
	<div align="center">
	<hr width="100%" />
	<h2>상세 페이지</h2>
	<hr width="100%" />
	<br/>
	
	<table width="100%" border="1">
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
			<th>content</th>
			<td><c:out value="${ board.content }" /> </td> 
		</tr>
		<tr>
			<th>score</th>
			<td>${ board.score }</td>
		</tr>
		<tr>
			<th>reg_date</th>
			<td>${ board.reg_date }</td>
		</tr>
		<%-- <tr>
			<th>첨부파일</th>
			<td>
				<c:forEach items="${ fileList }" var="file">
					<a href="/Mission-Web/upload/${ file.fileSaveName }">
					${ file.fileOriName }
					</a>
					(${ file.fileSize } bytes)<br/>
				</c:forEach>
			</td>
		</tr> --%>
	</table>
	<br/><br/>
	<input type="button" value="수정" onclick="doAction('U')" />&nbsp;&nbsp;
	<input type="button" value="삭제" onclick="doAction('D')" />&nbsp;&nbsp;
	<input type="button" value="목록" onclick="doAction('L')" />
	</div>
	</section>
	<%-- <footer>
		<%@ include file="/jsp/include/bottom.jsp" %>
	</footer> --%>
</body>
</html>






