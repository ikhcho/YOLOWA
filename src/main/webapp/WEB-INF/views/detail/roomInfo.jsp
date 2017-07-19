<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- block -->
<div class="block">
	<div class="navbar navbar-inner block-header">
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
	<div class="block-content collapse in">
		<div id="rootwizard">
			<div class="tab-content">
				<c:forEach items="${ list }" var="roomInfo" varStatus="status">
					<!--  이미지 영역 -->
					<c:choose>
						<c:when test="${status.first }">
							<div class="tab-pane active" id="tab${ roomInfo.no }">
						</c:when>
						<c:otherwise>
							<div class="tab-pane" id="tab${ roomInfo.no }">
						</c:otherwise>
					</c:choose>
					<div class="block-content collapse in">
						<table class="table table-bordered dongjoo">
							<tr>
								<th rowspan="2">객실명</th>
								<th rowspan="2">객실 형태(스타일)</th>
								<th rowspan="2">크기</th>
								<th rowspan="2">인원<br />(기준/최대)
								</th>
								<th colspan="3">요금안내</th>
								<th rowspan="2">추가요금</th>
								<th rowspan="2">예약하기</th>
							</tr>
							<tr>
								<th>기간</th>
								<th>주중</th>
								<th>주말</th>
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
									href="${ pageContext.request.contextPath }/user/houseReserve.do"><button>예약하기</button></a></td>
							</tr>
							<tr>
								<td>성수기</td>
								<td>${ roomInfo.hWeekPrice }</td>
								<td>${ roomInfo.hWeekendPrice }</td>
							</tr>
						</table>
					</div>
					<div>
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


<script
	src="${ pageContext.request.contextPath }/resources/bootstrap/vendors/jquery-1.9.1.js"></script>
<script
	src="${ pageContext.request.contextPath }/resources/bootstrap/bootstrap/js/bootstrap.min.js"></script>
