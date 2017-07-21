<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- block -->
<div class="panel panel-info">
	<div class="navbar navbar-inner panel-heading">
		<ul class="nav nav-pills">
			<c:forEach items="${ list }" var="roomName" varStatus="status">
				<c:choose>
					<c:when test="${status.first }">
						<li class="active"><a href="#tab${ roomName.no }"
							data-toggle="tab">${ roomName.roomName }</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="#tab${ roomName.no }" data-toggle="tab">${ roomName.roomName }</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</ul>
	</div>
	<div class="panel-body collapse in">
		<div id="rootwizard">
			<div class="tab-content">
				<c:forEach items="${ list }" var="roomInfo" varStatus="status">
					<script>
						$(function(){
							var roomNo = '${ roomInfo.no }';
							$.ajax({
								url : '/Yolowa/busi/pension/roomPhotoList.do',
								type : 'post',
								data : {
									'no' : roomNo
								},
								contentType : 'application/x-www-form-urlencoded; charset=utf-8',
								success : function(data){
									var obj = JSON.parse(data);
									var selector = "#tab"+roomNo;
									for(var i=0; i<obj.length; i++){
										var text = '<img width="100px" height="100px" src="/Yolowa/upload/'+obj[i].photo+'">';
										$(selector).prepend(text);
									}
									console.log(obj);
								}
							});
						});
					</script>
					<c:choose>
						<c:when test="${status.first }">
							<div class="tab-pane active" id="tab${ roomInfo.no }">
						</c:when>
						<c:otherwise>
							<div class="tab-pane" id="tab${ roomInfo.no }">
						</c:otherwise>
					</c:choose>
					<div class="block-content collapse in">
						<table class="table table-bordered text-center">
							<tr>
								<th rowspan="2" class="text-center"><br/>객실명</th>
								<th rowspan="2" class="text-center"><br/>객실 형태(스타일)</th>
								<th rowspan="2" class="text-center"><br/>크기</th>
								<th rowspan="2" class="text-center">인원<br />(기준/최대)
								</th>
								<th colspan="3" class="text-center">요금안내</th>
								<th rowspan="2" class="text-center"><br/>추가요금</th>
								<th rowspan="2" class="text-center"><br/>예약하기</th>
							</tr>
							<tr>
								<th class="text-center">기간</th>
								<th class="text-center">주중</th>
								<th class="text-center">주말</th>
							</tr>
							<tr>
								<td rowspan="2">${ roomInfo.roomName }</td>
								<td rowspan="2">${ roomInfo.style }</td>
								<td rowspan="2">${ roomInfo.roomSize }</td>
								<td rowspan="2">${ roomInfo.personMin }/${ roomInfo.personMax }</td>
								<td>비수기</td>
								<td>${ roomInfo.nWeekPrice }</td>
								<td>${ roomInfo.nWeekendPrice }</td>
								<td rowspan="2">${ roomInfo.overPrice }</td>
								<td rowspan="2"><a
									href="${ pageContext.request.contextPath }/reservation/houseReservation.do?houseNo=1&selectDate=2017-07-28"><button>예약하기</button></a></td>
							</tr>
							<tr>
								<td>성수기</td>
								<td>${ roomInfo.hWeekPrice }</td>
								<td>${ roomInfo.hWeekendPrice }</td>
							</tr>
						</table>
					</div>
					<div class="text-left">
						<!-- 구비시설 및 객실설명 -->
						${ roomInfo.content }
					</div>
			</div>
			</c:forEach>

		</div>
	</div>
</div>

<!-- /block -->
</div>

