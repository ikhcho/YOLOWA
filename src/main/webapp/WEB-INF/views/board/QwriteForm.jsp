<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>      
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="${ pageContext.request.contextPath }/resources/js/checkForm.js" ></script>
<script>
	function doList() {
		location.href = "${pageContext.request.contextPath}/board/qlist.do";
	}
	
	function doWrite() {
		var w = document.writeForm;
		
		/* if(isNull(w.score, '점수를 입력하세요'))
			return false; */
		
		if(w.question.value == "") {
			alert('문의내용을 입력하세요');
			w.question.focus();
			return false;
		}
		return true;
	}
	
	function checkExt(obj) {
		var forbidName=['exe', 'java', 'jsp', 'js', 'class', 'css'];
		var fileName = obj.value;
		var ext = fileName.substring(fileName.lastIndexOf('.') + 1);
		
		for(var i = 0; i < forbidName.length; i++) {
			if(forbidName[i] == ext) {
				alert(ext + '확장자는 파일업로드 정책에 위배됩니다');
				return true;
			}
		}
		return false;
	}
</script>
 <link rel="stylesheet" 
   	  href="${ pageContext.request.contextPath }/resources/bootstrap/vendors/form.html" />
  <link rel="stylesheet" 
	  href="${ pageContext.request.contextPath }/resources/bootstrap" /> 
</head>
<body>
	<div align="center">
	<hr width="80%"/>
	<h2>문의게시판 등록폼</h2>
	<hr width="80%"/>
	<br/>
	
	<form:form method="post" commandName="QboardVO" >
				<table width="80%" border="1">
					
					<tr>
						<th>house_no</th>
						<td>
							<form:input path="house_no" size="20" />
							<form:errors path="house_no" />
						</td>
					</tr>
					<tr>
						<th>user_no</th>
						<td>
							<form:input path="user_no" size="20"/>
							<form:errors path="user_no" />
						</td>
					</tr>
					<tr>
						<th>question</th>
						<td>
							<form:textarea rows="7" cols="50" path="question" />
							<form:errors path="question" />
						</td>
					</tr>
					
				</table>
				<input type="submit" value="전송" />
	</form:form>
	

	</div>
</body>
</html>

