<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>YOLOWA</title>
<!-- header -->
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="${pageContext.request.contextPath }/resources/js/menu/jquery-1.12.4.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/menu/jquery-ui.js"></script>
<script src="${pageContext.request.contextPath }/resources/bootstrap/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/reservation/houseReservation.js"></script>

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
		
		var houseNo = '${param.houseNo}';
		var resDate = '${param.selectDate}';
		$.ajax({
			url : '/Yolowa/menu/ableRoomList.do',
			type : 'post',
			data : {
				'houseNo' : houseNo,
				'resDate' : resDate
			},
			contentType : 'application/x-www-form-urlencoded; charset=utf-8',
			success : function(data){
				var obj = JSON.parse(data);
				for(var i=0; i< obj.length; i++){
					var a = '#a'+obj[i]['roomNo'];
					
					
					if(obj[i]['able'] == 0){
						$(a).text('예약가능');
					}else{
						$(a).text('예약불가');
						$(a).css('color','red');
						var c = '#c'+obj[i]['roomNo'];
						$(c).attr('disabled',"disabled");
					}
					
				}
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
		
		var form = document.reservationForm;
		var room = document.getElementById('roomNo');
		var dayNum = document.getElementById('day');
		var people = document.getElementById('personCnt');
		var price = document.getElementById('price');
		
		room.setAttribute("value", roomNo);
		dayNum.setAttribute("value", day);
		people.setAttribute("value", personCnt);
		price.setAttribute("value", totalPrice);
		if(roomNo.length == 0){
			alert("객실을 선택해 주세요.");
		}else{
			form.submit();
		}
	}
	
</script>
</head>
<body>
	<div class="container">
		<div class="panel panel-success">
			<div class="panel-heading">
				<div class="row">
					<div class="col-sm-8">
						<h1>${ houseVO.houseName }</h1>
					</div>
					<div class="col-sm-4 text-right">
						<br/><br/>
						<h5>성수기 : ${ houseVO.hotStart } ~ ${ houseVO.hotEnd }</h5>
					</div>
				</div>
			</div>
			<div class="panel-body">
					<div class="panel panel-default">
						<div class="panel-heading">
							<div class="row">
								<div class="col-sm-12">
									<div class="col-sm-10">
										<h4>객실선택</h4>
									</div>
									<div class="col-sm-2">
											<input type="text" size="20" class="form-control datepicker" />
										</div>
								</div>
							</div>
						</div>
						<div class="panel-body">
							<form name="reservationForm" method="post" action="${ pageContext.request.contextPath }/reservation/reservation.do" >
							<table class="table text-center">
								<tr>
									<th colspan="2" class="text-center">객실명</th>
									<th class="text-center">예약유무</th>
									<th class="text-center">기준/최대</th>
									<th class="text-center">박수</th>
									<th class="text-center">인원</th>
									<th class="text-center">요금안내</th>
									<th class="text-center">추가요금</th>
									<th class="text-center">금액</th>
								</tr>
								<c:forEach items="${ list }" var="roomInfo">
									<tr>
										
										<td><input type="checkbox" class="selectRoom" value="${roomInfo.no }" id="c${roomInfo.no }"/></td>
										<td>${ roomInfo.roomName }</td>
										<td id="a${roomInfo.no }"></td>
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
										<td><i><input type="text" readonly="readonly" value="0" class="price text-center" style="border:none"></i></td>
									</tr>
								</c:forEach>
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
							</table>
							</form>
						</div>
					</div>
			</div>
			<div class="panel-footer text-right">
					총 금액 : <b id="totalPrice">0</b>원
					<button class="btn btn-warning" onclick="doReservation()">예약하기</button>
			</div>
		</div>
	</div>
</body>
</html>