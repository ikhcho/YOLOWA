<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
	function goWriteForm() {
	
		location.href = "writeForm.do";
	}
	
	function doAction(boardNo) {
		
		location.href = "${ pageContext.request.contextPath }/board/" + boardNo + "/detail.do";
		
		/* <c:choose>
			<c:when test="${ not empty userVO}">
				location.href = "detail.do?type=list&no=" + boardNo;
			</c:when>
			<c:otherwise>
				if(confirm('로그인 후 사용할 수 있습니다\n로그인페이지로 이동하시겠습니다'))
					location.href = "/Mission-Web/jsp/login/login.jsp";
			</c:otherwise>
		</c:choose> */
	}
	
</script>
<link rel="stylesheet" 
   	  href="${ pageContext.request.contextPath }/resources/css/layout.css" />
<link rel="stylesheet" 
	  href="${ pageContext.request.contextPath }/resources/css/board.css" />
</head>
<body>
 	<%-- <header>
 		<c:import url="/include/topMenu.do" />
 		 <jsp:include page="/include/topMenu.do" /> 
		 <jsp:include page="/WEB-INF/jsp/include/topMenu.jsp" /> 
	</header> --%>
	<section>
	<div align="center">
	<br/>
	<hr width="100%"/>
		<h2>후기게시판 목록</h2>
	<hr width="100%"/>
	<br/>
	
	<table border="1" width="100%" class="list">
		<tr>
			<th width="7%">no</th>
			<th>house_no</th>
			<th>user_no</th>
			<th>content</th>
			<th>score</th>
			<th>blind_state</th>
			<th width="20%">reg_date</th>
		</tr>
		<c:forEach items="${ list }" var="board" varStatus="loop">
			<tr <c:if test="${ loop.count mod 2 eq 0 }">class="even"</c:if> >
				<td>${ board.no }</td>
				<td>${ board.house_no }</td>
				<td>${ board.user_no }</td>
				<td>
					<a href="javascript:doAction('${board.no}')">
 						<c:out value="${ board.content }" /> 
					</a>
				</td>
				<td>${ board.score }</td>
				<td>${ board.blind_state }</td>
				<td>${ board.reg_date }</td>
			</tr>
		</c:forEach>
	</table>
	<br/><br/>
	<c:if test="${ not empty userVO }">
		<input type="button" value="후기등록" onclick="goWriteForm()"/>
	</c:if>
	</div>
	</section>
<%--  	<footer>
 		<jsp:include page="/include/footer.do"/>
 		<c:import url="/include/footer.do"></c:import>
 		<c:import url="/WEB-INF/jsp/include/bottom.jsp" />
 		<jsp:include page="/WEB-INF/jsp/include/bottom.jsp" />
		<%@ include file="/WEB-INF/jsp/include/bottom.jsp" %>
	</footer> --%> 
</body>
</html>
