<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
	$(function() {
		$('#login').click(function() {
			$('#loginModal').modal();
		});
		$('#contact').click(function() {
			if('${userVO.id}' == ''){
				if(confirm('로그인을 해야 가맹신청이 가능합니다.\n로그인 하시겠습니까?')){
					$('#loginModal').modal();
				}
			}else if('${userVO.type}' == 'B'){
				alert('이미 등록한 사업자입니다.');
			}else if('${userVO.type}' == 'A'){
				alert('관리자는 등록할 수 없습니다.');
			}else{
				$('#contactModal').modal();
			}
		});
		var d = new Date();
		var year = d.getYear()+1900;
		var month = d.getMonth()+1;
		if(month<10){
			month = '0'+month;
		}
		var date = d.getDate();
		var today = year + "-" + month + "-" + date;
		d= new Date(year, month-1, date);
		$('.datepicker').val(today);
		
		$( ".datepicker" ).datepicker({
			dateFormat: "yy-mm-dd",
			minDate : d
		});
		
	});
</script>

<div id="flipkart-navbar" class="navbar navbar-fixed-top">
	<div class="container">
		<div class="row row1">
			<ul class="largenav pull-right">
				<c:choose>
				<c:when test="${userVO==null}">
					<li class="upper-links"><a role="button" class="links" id="login">로그인/회원가입</a></li>
				</c:when>
				<c:when test="${userVO!=null}">
					<li class="upper-links"><a role="button" class="links" href="${pageContext.request.contextPath }/user/logout.do">로그아웃</a></li>				
					
				</c:when>
				<c:when test="${userVO.type!='B'}">
					<li class="upper-links"><a role="button" class="links" href="${pageContext.request.contextPath }/busi/home.do">펜션관리</a></li>				
				</c:when>
				<c:when test="${userVO.type=='U'}">
					<li class="upper-links"><a role="button" class="links" id="contact">가맹신청</a></li>
				</c:when>
				</c:choose>
				<li class="upper-links"><a class="links" href="#">고객센터</a></li>
			</ul>
		</div>

		<div class="row">
			<div class="col-sm-3">
				<h1 style="margin: 0px;">
					<span class="largenav text-center">YOLOWA</span>
				</h1>
			</div>
			<div class="col-sm-9 col-xs-11">
				<div class="row">
					<div class="input-group input-group-lg">
						<input type="text" class="form-control"  placeholder="펜션검색" name="" aria-describedby="sizing-addon1">
						<span class="input-group-addon" id="sizing-addon1"><i class="glyphicon glyphicon-search"></i></span>
					</div>
				</div>
			</div>
		</div>
		<div class="row row1">
		<div class="col-sm-12">
			<table>
			<tr>
				<td><div class="col-sm-1"></div></td>
				<td><div class="col-sm-1"></div></td>
				<td><div class="col-sm-1"></div></td>
				<td><div class="col-sm-1"></div></td>
				<td><div class="col-sm-1"></div></td>
				<td>
					<h4 style="margin: 0px; color:#FFCF40">
						<span class="largenav text-center">투숙날짜</span>
					</h4>
				</td>
				<td><div class="col-sm-1"></div></td>
				<td>
					<div class="input-group input-group-lg">
						<input type="text" size="10"class="form-control datepicker">
					</div>
				</td>
				<td><div class="col-sm-1"></div></td>
				<td>
					<h4 style="margin: 0px; color:#FFCF40">
						<span class="largenav text-center">지역검색</span>
					</h4>
				</td>
				<td><div class="col-sm-1"></div></td>
				<td>
					<div class="input-group input-group-lg">
						<select class="form-control" name="" aria-describedby="sizing-addon1">
							<option>강원도
							<option>경기도
							<option>경상남도
							<option>경상북도
							<option>서울시
							<option>전라남도
							<option>전라북도
							<option>제주도
							<option>충청남도
							<option>충청북도
						</select>
					</div>
				</td>
				<td><div class="col-sm-1"></div></td>
				<td>
					<h4 style="margin: 0px; color:#FFCF40">
						<span class="largenav text-center">상세지역</span>
					</h4>
				</td>
				<td><div class="col-sm-1"></div></td>
				<td>
					<div class="input-group input-group-lg">
						<select class="form-control" name="" aria-describedby="sizing-addon1">
							<option>남양주시
						</select>
					</div>
				</td>
				<td>
					<div class="col-sm-1"></div>
				</td>
				<td>
					<button type="button" class="btn btn-warning btn-lg">
						<span>
							<h4 style="margin: 0px;">
								객실검색<i class="glyphicon glyphicon-search"></i>
							</h4>
						</span>
					</button>
				</td>
			</tr>
			</table>
			</div>
		</div>
	</div>
</div>

<c:if test="${userVO!=null}">
	<div class="profile col-sm-2">
		<div class="profile-content">
			<!-- SIDEBAR USERPIC -->
			<div class="profile-userpic">
				<img src="${pageContext.request.contextPath}/resources/images/github-logo.png" class="img-responsive" alt="">
			</div>
			<!-- END SIDEBAR USERPIC -->
			<!-- SIDEBAR USER TITLE -->
			<div class="profile-usertitle">
				<div class="profile-usertitle-name">${userVO.name }</div>
				<div class="profile-usertitle-job">${userVO.id }</div>
			</div>
			<!-- END SIDEBAR USER TITLE -->
			<!-- SIDEBAR BUTTONS -->
			<!-- <div class="profile-userbuttons">
				<button type="button" class="btn btn-success btn-sm">Follow</button>
				<button type="button" class="btn btn-danger btn-sm">Message</button>
			</div> -->
			<!-- END SIDEBAR BUTTONS -->
			<!-- SIDEBAR MENU -->
			<div class="profile-usermenu">
				<ul class="nav">
					<li><a href="#"><i class="glyphicon glyphicon-user"></i>마이페이지</a></li>
					<li><a href="#"><i class="glyphicon glyphicon-calendar"></i>예약확인</a></li>
					<li><a href="#"><i class="glyphicon glyphicon-paperclip"></i>찜목록보기</a></li>
					<li><a href="#"> <i class="glyphicon glyphicon-flag"></i>고객센터</a></li>
				</ul>
			</div>
			<!-- END MENU -->
		</div>
	</div>
</c:if>

<!-- Modal -->
<div class="modal fade" id="loginModal">
  <div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<!-- 닫기(x) 버튼 -->
				<button type="button" class="close" data-dismiss="modal">x</button>
				<!-- header title -->
				<div class="row">
					<div class="col-md-12">
						<div class="col-xs-6">
							<a id="loginBtn" role="button"
								class="btn btn-lg btn-info btn-block">로그인</a>
						</div>
						<div class="col-xs-6">
							<a id="signupBtn" role="button"
								class="btn btn-lg btn-info btn-block">회원가입</a>
						</div>
					</div>
				</div>
			</div>
			<!-- body -->
			<div class="modal-body">
				<div class="row">
					<div class="col-md-12">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h3 class="panel-title">로그인</h3>
							</div>
							<div class="panel-body">
								<form action="/Yolowa/user/login.do" method="post" name="lform">
									<div class="col-xs-12">
										<fieldset class="col-xs-12">
											<div class="form-group">
												<input class="form-control" placeholder="ID" id="id"
													name="id" type="text" autofocus>
											</div>
											<div class="form-group">
												<input class="form-control" placeholder="Password"
													name="password" id="password" type="password">
											</div>
										</fieldset>
									</div>
									<!-- Change this to a button or input when using this as a form -->
									<div class="col-xs-6 col-xs-offset-3">
										<a id="submit" role="button" class="btn btn-lg btn-success btn-block">로그인하기</a>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- Footer -->
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="contactModal">
  <div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<!-- 닫기(x) 버튼 -->
				<button type="button" class="close" data-dismiss="modal">x</button>
				<div class="row"></div>
				<!-- header title -->
			</div>
			<!-- body -->
			<div class="modal-body">
				<div class="row">
					<div class="col-md-12">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h3 class="panel-title">가맹신청</h3>
							</div>
							<div class="panel-body">
								<form action="/Yolowa/busi/contact.do" method="post">
									<div class="col-xs-12">
											<div class="row">
												<div class="form-group col-xs-9">
													<input class="form-control" placeholder="사업자 등록 번호" style="height:45px"
														name="approvekey" type="text" autofocus>
												</div>
												<div class="col-xs-3">
													<input type="submit" value="신청하기" class="btn btn-lg btn-success btn-block">
												</div>
											</div>
									</div>
									<!-- Change this to a button or input when using this as a form -->
									
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- Footer -->
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>