<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ȸ�� ���� ����������</title>
<script>
function doList() {
	location.href = "${pageContext.request.contextPath}/user/home.do";
}
</script>

<link rel="stylesheet" 
   	  href="${ pageContext.request.contextPath }/resources/css/layout.css" />
<link rel="stylesheet" 
	  href="${ pageContext.request.contextPath }/resources/css/board.css" />
</head>
<body>
	<section>
	 <div align="center">
	 	<hr/>
	 	<h2>ȸ������ ����</h2>
	 	<hr/>
	 	<br/>
	 	<form action="mypageupdate.do" method="post">
			<input type="hidden" name="id" value="${ userVO.id }" />
	 		<table width="100%">
		 		<tr>
		 			<th width="25%">�̸�</th>
		 			<td>${ userVO.name }</td>
		 		</tr>
		 		<tr>
		 			<th>�������</th>
		 			<td>${ userVO.birthday }</td>
		 		</tr>
		 		<tr>
		 			<th>ȸ�� ���̵�</th>
		 			<td>${ userVO.id }</td>
		 		</tr>
		 		<tr>
		 			<th>��й�ȣ</th>
		 			<td>
		 				<input type="password" style="width:300px;" name= "password" value="${ userVO.password }" />
		 			</td>
		 		</tr>
		 		<tr>
		 			<th>��й�ȣ Ȯ��</th>
		 			<td>
		 				<input type="password" style="width:300px;" name= "passwordre" value="${ userVO.password }"/>
		 			</td>
		 		</tr>
		 		<tr>
		 			<th>�̸��� </th>
		 			<td>
		 				<input type="text" style="width:300px" name="email" value="${ userVO.email }" />
		 				
		 			</td>
		 		</tr>
		 		<tr>
					<th>�޴��� ��ȣ</th>
					<td>
		 				<input type="text" style="width:300px" name="tel" value="${ userVO.tel }">
		 			</td>	
				</tr>
		 		
		 		
		</table>
		<br/><br/>
		<input type="submit" value=" ����  " />
		<input type="button" value=" ����ȭ��  " onclick="doList()"/>
		</form>
	 </div>
	 </section>

</body>
</html>