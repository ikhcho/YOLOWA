<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="navbar navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container-fluid">
				<a class="btn btn-navbar" data-toggle="collapse"
					data-target=".nav-collapse"> <span class="icon-bar"></span> <span
					class="icon-bar"></span> <span class="icon-bar"></span>
				</a> <a class="brand"><strong>${userVO.name}</strong></a>
				<div class="nav-collapse collapse">
					<ul class="nav pull-right">
						<li class="dropdown"><a href="#" role="button"
							class="dropdown-toggle" data-toggle="dropdown"> <i
								class="icon-user"></i> Vincent Gabriel <i class="caret"></i>

						</a>
							<ul class="dropdown-menu">
								<li><a tabindex="-1" href="#">Profile</a></li>
								<li class="divider"></li>
								<li><a tabindex="-1" href="login.html">Logout</a></li>
							</ul></li>
					</ul>
					<ul class="nav">
						<li class="active"><a href="${pageContext.request.contextPath}/busi/home.do">대시보드</a></li>
						<li><a href="${pageContext.request.contextPath}/busi/pension/list.do">펜션정보 </a></li>
						<li><a href="${pageContext.request.contextPath}/busi/home.do">예약사이트 </a></li>
					</ul>
				</div>
				<!--/.nav-collapse -->
			</div>
		</div>
	</div>