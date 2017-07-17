<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div><img src="${ houseVO.photo }" alt="" ></div>
	<div><h2>${ houseVO.houseName }</h2></div>
	<div>상세주소 : ${ houseVO.addr }</div>
	<div>입실시간 : ${ houseVO.checkin }</div>
	<div>퇴실시간 : ${ houseVO.checkout }</div>
	<div>픽업여부 : ${ houseVO.pickup }</div>
	<div>예약문의 : ${ houseVO.tel }</div>
	<div>성수기구분 : ${ houseVO.hotStart } ~ ${ houseVO.hotEnd }</div>
	
	<a href="${ pageContext.request.contextPath }/user/houseReserve.do"><button>예약</button></a>
	
	<%-- <%= request.getAttribute("houseVO") %> --%>
	<jsp:include page="houseInformation.jsp" />
</body>
</html>