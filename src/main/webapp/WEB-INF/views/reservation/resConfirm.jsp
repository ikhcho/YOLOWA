<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

</head>
<body>
<script>
	alert('${msg}');
</script>
<%-- <c:forEach items="${resList }" var="resVO">
	${resVO. }
private int no;
	private int houseNo;
	private int roomNo;
	private int userNo;
	private Date resStart;
	private Date resEnd;
	private int personCnt;
	private int totalPrice;
	private String content;
</c:forEach> --%>
${resList}
${resInfo}
</body>
</html>