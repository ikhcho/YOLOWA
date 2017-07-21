<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- header -->
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link href="${pageContext.request.contextPath }/resources/css/menu/header.css" rel="stylesheet">
<script src="${pageContext.request.contextPath }/resources/js/menu/jquery-1.12.4.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/menu/jquery-ui.js"></script>
<script src="${pageContext.request.contextPath }/resources/bootstrap/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/reservation/houseReservation.js"></script>

<%-- <link href="${pageContext.request.contextPath }/resources/css/home/style.css" rel="stylesheet"> --%>
<link href="${pageContext.request.contextPath }/resources/css/home/response.css" rel="stylesheet">
<link href="${ pageContext.request.contextPath }/resources/bootstrap/bootstrap/css/bootstrap-responsive.css" rel="stylesheet" media="screen">
<link href="${ pageContext.request.contextPath }/resources/bootstrap/assets/styles.css" rel="stylesheet" media="screen">
<script type="text/javascript">
	$(document).ready(function(){
		var d = new Date();
		var year = d.getYear()+1900;
		var month = d.getMonth()+1;
		if(month<10){
			month = '0'+month;
		}
		var date = d.getDate();
		var today = year + "-" + month + "-" + date;
		d= new Date(year, month-1, date);
		$('.datepicker').val('${param.selectDate}');
		
		$( ".datepicker" ).datepicker({
			dateFormat: "yy-mm-dd",
			minDate : d,
			onSelect: function(){
				var uri = "${pageContext.request.contextPath}/reservation/houseReservation.do?houseNo=${param.houseNo}&selectDate="+$(this).val();
				//console.log(uri);
				$(location).attr('href', uri);
			}
		});
	});
	
	function doReservation(method){
		
		var houseNo;
		var roomNo = new Array();
		var day = new Array();
		var personCnt = new Array();
		var totalPrice = new Array();

		$('.selectRoom').each(function(index){
			
			if($('.selectRoom').eq(index).is(":checked")){
				houseNo = $('#houseNo').val();
				roomNo.push($('.selectRoom').eq(index).val());
				day.push($('.day').eq(index).val());
				personCnt.push($('.peopleNumber').eq(index).val());
				totalPrice.push($('.price').eq(index).val());
				
			}
		});
		
		alert("houseNo : " + houseNo + "\n" + "roomNo : " + roomNo[0] + "\n");
		
		var form = document.reservationForm;
		var room = document.getElementById('roomNo');
		var dayNum = document.getElementById('day');
		var people = document.getElementById('personCnt');
		var price = document.getElementById('price');
		
		
		room.setAttribute("value", roomNo);
		dayNum.setAttribute("value", day);
		people.setAttribute("value", personCnt);
		price.setAttribute("value", totalPrice);
		form.submit();
	}
	
</script>
</head>
<body>
	<div>
		<h1>${ houseVO.houseName }</h1>
		<h2>날짜, 객실 선택</h2>
		<div>
			<input type="text" size="10" class="form-control datepicker" />
			<hr/>
			<div>성수기 : ${ houseVO.hotStart } ~ ${ houseVO.hotEnd }</div>
			<hr/>
		</div>
		<form name="reservationForm" method="post" action="${ pageContext.request.contextPath }/reservation/reservation.do" >
			<table border="1" width="100%">
				<tr>
					<th colspan="2">객실명</th>
					<th>예약유무</th>
					<th>기준/최대</th>
					<th>박수</th>
					<th>인원</th>
					<th>요금안내</th>
					<th>추가요금</th>
					<th>금액</th>
				</tr>
				<c:forEach items="${ list }" var="roomInfo">
					<tr>
						
						<td><input type="checkbox" class="selectRoom" value="${roomInfo.no }"/></td>
						<td>${ roomInfo.roomName }</td>
						<td></td>
						<td><i class="min">${ roomInfo.personMin }</i> / <i class="max">${ roomInfo.personMax }</i></td>
						<td>
							<select class="day">
								<c:forEach begin="1" end="3" var="i">
									<option>${ i }</option>
 									
								</c:forEach>
							</select>
									
						</td>
						<td>
							<select class="peopleNumber">
								<c:forEach begin="1" end="${ roomInfo.personMax }" var="i">
									<option>${ i }</option>
								</c:forEach>
							</select>
						</td>
						<td><i class="priceInfo">${ roomInfo.price }</i>원</td>
						<td><i class="overPrice">${ roomInfo.overPrice }</i>원</td>
						<td><i><input type="text" readonly="readonly" value="0" class="price"></i></td>
					</tr>
				</c:forEach>
			</table>
			<div>
				총 금액 : <b id="totalPrice">0</b>원
			</div>
			<div>
				<input type="button" value="예약하기" onclick="doReservation()"/>
			</div>
			<div>
				<input type="hidden" id="houseNo" name="houseNo" value="${param.houseNo }">
				<input type="hidden" id="startDate" value="${param.selectDate}" name="resStart">
				<input type="hidden" id="resEnd" value="${param.selectDate}" name="resEnd">
				<input type="hidden" id="userNo" name="userNo" value="${ userVO.no }">
				<input type="hidden" id="roomNo" name="roomNo">
				<input type="hidden" id="day" name="day">
				<input type="hidden" id="personCnt" name="personCnt">
				<input type="hidden" id="price" name="totalPrice">
			</div>
		</form>
	</div>
</body>
</html>