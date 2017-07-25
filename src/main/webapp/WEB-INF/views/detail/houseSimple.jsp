<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script>
	//예약버튼 uri 설정
	function btnReservation(){
		var d = new Date();
		var year = d.getYear()+1900;
		var month = d.getMonth()+1;
		if(month<10){
			month = '0'+month;
		}
		var date = d.getDate();
		var today = year + "-" + month + "-" + date;
		if('${userVO.id}' == ""){
			alert("로그인이 필요합니다.");
		} else {
			var popWidth  = '1000'; // 파업사이즈 너비
			var popHeight = '700'; // 팝업사이즈 높이
			var winWidth  = document.body.clientWidth;  // 현재창의 너비
			var winHeight = document.body.clientHeight; // 현재창의 높이
			var winX      = window.screenX || window.screenLeft || 0;// 현재창의 x좌표
			var winY      = window.screenY || window.screenTop || 0; // 현재창의 y좌표
			w = winX + (winWidth - popWidth) / 2;
			h = winY + (winHeight - popHeight) / 2;
			window.open("${ pageContext.request.contextPath }/reservation/houseReservation.do?houseNo=${ houseVO.no }&selectDate="
					+ today, "예약하기", "width="+popWidth + " height="+popHeight +" top=100 left="+w);
		}
	}
</script>
<head> 
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/home/bootstrap.min.css">
</head>
<body>
	<div class="single-project" style="background:white">
		<div class="row">
			<br/>
			<div class="col-sm-6">
				<a href="${pageContext.request.contextPath }/detail/houseDetail.do?no=${houseVO.no}"><img style="width : 100%" src="/Yolowa/upload/${houseVO.photo }"></a>
				<span class="dark-text">${houseVO.addr } (tel)${houseVO.tel } <a href="${houseVO.homepage }">${houseVO.homepage}</a></span>
			</div>
			<div class="col-sm-6 project-information">
				<ul>
					<li style="height:50px">
					<h4 class="col-sm-6 text-left">
						<a href="${pageContext.request.contextPath }/detail/houseDetail.do?no=${houseVO.no}">
						${houseVO.houseName }
						</a>
					</h4>
					<h5 class="col-sm-6 text-right"><span class="dark-text" style="font-size:11px">성수기구분 : ${ houseVO.hotStart } ~ ${ houseVO.hotEnd }</span></h5>
					</li>
				</ul>
				<div class="project-description">
					<table class="table">
						<thead style="font-size:14px">
							<tr>
								<th>객실명</th>
								<th>인원(기준/최대)</th>
								<th>기간</th>
								<th>주중요금</th>
								<th>주말요금</th>
							</tr>
						</thead>
						<tbody id="house_${house.no}" style="font-size:12px">
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
					<div class="pull-right">
						<button class="btn btn-warning" onclick="btnReservation()">지금예약</button>&nbsp;
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>