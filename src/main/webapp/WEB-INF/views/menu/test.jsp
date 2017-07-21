<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath }/resources/js/menu/jquery-1.12.4.js"></script>
<script>
	
	$(function(){
		var houseNo = '${param.no}';
		var resDate = '${param.date}';
		$.ajax({
			url : '/Yolowa/menu/test.do',
			type : 'post',
			data : {
				'houseNo' : houseNo,
				'resDate' : resDate
			},
			contentType : 'application/x-www-form-urlencoded; charset=utf-8',
			success : function(data){
				var obj = JSON.parse(data);
				for(var i=0; i< obj.length; i++){
					var c = '#c'+obj[i]['roomNo'];
					
					if(obj[i]['able'] == 0){
						$(c).text('예약가능');
					}else{
						$(c).text('예약불가');
					}
				}
			}
		});
		$('#test').click(function(){
			var roomNo = 62;
			$.ajax({
				url : '/Yolowa/menu/testOne.do',
				type : 'post',
				data : {
					'resDate' : resDate,
					'roomNo' : roomNo,
					'day' : '5'
				},
				contentType : 'application/x-www-form-urlencoded; charset=utf-8',
				success : function(data){
					alert(data);
				}
			});
		});
	})
	
	
</script>
</head>

<body>
	<button id="test">
	</button>
	<i id="c61"></i>
	<i id="c62"></i>
	<i id="c63"></i>
	<i id="c64"></i>
</body>
</html>