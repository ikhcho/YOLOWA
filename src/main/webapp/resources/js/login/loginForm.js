/**
 * form과 관련한 함수 집합
 */
$(function(){
	$(document).on("click","#loginBtn",function(){
		if($('#submit').text() =='가입하기'){
			$('.modal-body .panel-title').text('로그인');
			$('fieldset').attr('class', 'col-xs-12');
			$('#checkList').remove();
			$('fieldset .form-group:last').remove();
			$('fieldset .form-group:last').remove();
			$('fieldset .form-group:last').remove();
			$('fieldset .form-group:last').remove();
			$('fieldset .form-group:last').remove();
			$('#submit').text('로그인하기');
		}
	});
	
	$(document).on("click","#signupBtn",function(){
		if($('#submit').text() =='로그인하기'){
			$('.modal-body .panel-title').text('회원가입');
			$('fieldset').attr('class','col-xs-9');
			$('fieldset').after('<div id="checkList" class="col-xs-3"></div>');
			$('#checkList').append('<div class="form-group"><a id="idCheck" role="button" class="btn btn-default btn-block">Check</a></div">');
			$('#checkList').append('<div class="form-group text-center" id="passwordAble"></div>');
			$('fieldset').append('<div class="form-group"><input class="form-control" placeholder="Password Confirm" id="passwordConfirm" type="password"/><div>');
			$('fieldset').append('<div class="form-group"><input class="form-control" placeholder="Name" id="name" type="text"/></div>');
			$('fieldset').append('<div class="form-group"><input class="form-control" placeholder="Tel 010-****-****" id="tel" type="text"/><div>');
			$('fieldset').append('<div class="form-group"><input class="form-control" placeholder="Email" id="email" type="email"/><div>');
			$('fieldset').append('<div class="form-group"><input class="form-control" placeholder="Birthday YYYY-MM-DD" id="birthday" type="text"/></div>');
			$('#submit').text('가입하기');
		}
	});
	
	$(document).on("click","#submit",function(){
		if($(this).text() =='로그인하기'){
			var form = document.lform;
			if(isNull(form.id, '아이디를 입력하세요')) {
			}else if(isNull(form.password, '패스워드를 입력하세요')) {
			}else{
				$.ajax({
					url : '/Yolowa/user/loginAjax.do',
					type : 'post',
					data : {
						'id' : $('#id').val(),
						'password' : $('#password').val()
					},
					contentType : 'application/x-www-form-urlencoded; charset=utf-8',
					success : function(data){
						var obj = JSON.parse(data);
						if(obj['success'] == "T"){
							form.submit();
						}
						alert(obj['msg']);
					}
				});
			}
		}else if($(this).text() =='가입하기'){
			var form = document.lform;
			
			if(isNull(form.id, '아이디를 입력하세요')) {
			}else if(isNull(form.password, '패스워드를 입력하세요')) {
			}else if(isNull(form.passwordConfirm, '패스워드를 한번 더 입력하세요')) {
			}else if(isNull(form.name, '이름을 입력하세요')){
			}else if(isNull(form.tel, '전화번호를 입력하세요')){
			}else if(isNull(form.email, '이메일을 입력하세요')){
			}else if(isNull(form.birthday, '생년월일을 입력하세요')){
			}else if($('#passwordAble').text()=='불일치'){
				alert("비밀번호가 일치하지 않습니다");
			}else if($('#idCheck').text()=='OK'){
				$.ajax({
					url : '/Yolowa/user/register.do',
					type : 'post',
					data : {
						'id' : $('#id').val(),
						'password' : $('#password').val(),
						'name' :  $('#name').val(),
						'tel' :  $('#tel').val(),
						'email' :  $('#email').val(),
						'birthday' :  $('#birthday').val(),
					},
					contentType : 'application/x-www-form-urlencoded',
					success : function(data){
						alert(JSON.parse(data)['msg']);
						$('#id').val("");
						$('#password').val("");
						$('#passwordConfirm').val("");
						$('#email').val("");
						$('#name').val("");
					}
				});
			}else if($('#idCheck').text()!='OK'){
				alert("아이디 중복을 확인해주세요");
			}
		}
	});

	$(document).on("click","#idCheck",function(){
		if($('#id').val()!=""){
			$.ajax({
				url : '/Yolowa/user/idCheck.do',
				type : 'post',
				data : {
					'id' : $('#id').val()
				},
				contentType : 'application/x-www-form-urlencoded; charset=utf-8',
				success : function(data){
					alert(JSON.parse(data)['msg']);
					if(JSON.parse(data)['success']=='Y'){
						$('#idCheck').attr('class','btn btn-success btn-block');
						$('#idCheck').text("OK");
					}
				}
			});
		}else{
			alert("아이디를 입력해 주세요");
		}
	});
	
	$('#id').keydown(function() {
		if($('#idCheck').text() == 'OK'){
			$('#idCheck').attr('class','btn btn-default btn-block');
			$('#idCheck').text("Click");
		}
	});
	$('#password').keyup(function() {
		if($('#passwordConfirm').val() != ""){
			if($('#password').val() == $('#passwordConfirm').val()){
				$('#passwordAble').text("일치").css({
					'color' : 'green',
					'font-size' : '16px'
					});
			}else{
				$('#passwordAble').text("불일치").css({
					'color':'red',
					'font-size' : '16px'
					});
			}
		}
		$('#passwordConfirm').keyup(function() {
			if($('#password').val() != ""){
				if($('#password').val() == $('#passwordConfirm').val()){
					$('#passwordAble').text("일치").css({
						'color' : 'green',
						'font-size' : '16px'
						});
				}else{
					$('#passwordAble').text("불일치").css({
						'color':'red',
						'font-size' : '16px'
						});
				}
			}
		});
	});
	

	function isNull(obj, msg) {
		if(obj.value == "") {
			alert(msg);
			obj.focus();
			return true;
		}
	}
});

