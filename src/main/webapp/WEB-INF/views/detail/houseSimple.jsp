<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<head>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/home/bootstrap.min.css">
</head>
<body>
	<div class="single-project">
		<div class="row">
			<div class="col-sm-6">
				<a href="${pageContext.request.contextPath }/detail/houseDetail.do?no=${houseVO.no}"><img style="width : 100%" src="/Yolowa/upload/${houseVO.photo }"></a>
			</div>
			<div class="col-sm-6 project-information text-left">
				<ul>
							<li><a href="${pageContext.request.contextPath }/detail/houseDetail.do?no=${houseVO.no}"><h4>${houseVO.houseName }</h4></a></li>
							<li><span class="dark-text">주소: </span>${houseVO.addr }</li>
							<li><span class="dark-text">전화번호: </span>${houseVO.tel }</li>
							<li><span class="dark-text">홈페이지: </span><a href="${houseVO.homepage }">${houseVO.homepage}</a></li>
				</ul>
				<div class="project-description">
					<table class="table table-striped">
						<thead>
							<tr>
								<th><p>객실명</p></th>
								<th><p>인원(기준/최대)</p></th>
								<th><p>기간</p></th>
								<th><p>주중요금</p></th>
								<th><p>주말요금</p></th>
							</tr>
						</thead>
						<tbody id="house_${house.no}">
							<c:forEach items="${ list }" var="roomVO">
							<tr>
							<td rowspan="2">${roomVO.roomName}</td>
							<td rowspan="2" class="text-center">${roomVO.personMin} / ${roomVO.personMax}</td>
							<td>비수기</td>
							<td>${roomVO.nWeekPrice}</td>
							<td>${roomVO.nWeekendPrice}</td>
							</tr>
							<tr>
							<td>성수기</td>
							<td>${roomVO.hWeekPrice}</td>
							<td>${roomVO.hWeekendPrice}</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>