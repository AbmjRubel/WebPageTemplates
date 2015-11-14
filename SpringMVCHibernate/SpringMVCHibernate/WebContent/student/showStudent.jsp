<%@include file="taglib_includes_student.jsp" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><spring:message code="App.Title"></spring:message> </title>
<script src="../js/student.js" type="text/javascript"></script>
</head>
<body style="font-family: Arial; font-size:smaller;">
	<center>
	<form action="searchStudent.do" method="post">		
			<table style="border-collapse: collapse;" border="0" bordercolor="#006699" width="500">
			<tr>
				<td>Enter Student Name</td> 
				<td><input type="text" name="name"/>
					&nbsp;&nbsp;<input type="submit" value="Search"/>
					&nbsp;&nbsp;<input type="button" value="New Student" onclick="javascript:goStudent('saveStudent.do');"/>
			</td></tr>
		</table>
	</form>
	
	<table style="border-collapse: collapse;" border="1" bordercolor="#006699" width="500">
		<tr bgcolor="lightblue">
			<th>Id</th>
			<th>Name</th>                        
			<th>Gender</th>	
			<th>Mobile</th>
                        <th>Class</th>
                        <th>Email</th>
			<th></th>
		</tr>
		<c:if test="${empty SEARCH_STUDENT_RESULTS_KEY}">
		<tr>
			<td colspan="4">No Results found</td>
		</tr>
		</c:if>
		<c:if test="${! empty SEARCH_STUDENT_RESULTS_KEY}">
			<c:forEach var="student" items="${SEARCH_STUDENT_RESULTS_KEY}">		
		    <tr>
				<td><c:out value="${student.id}"></c:out></td>
				<td><c:out value="${student.name}"></c:out></td>
				<td><c:out value="${student.gender}"></c:out> </td>
				<td><c:out value="${student.mobile}"></c:out></td>
                                <td><c:out value="${student.class_}"></c:out></td>
                                <td><c:out value="${student.email}"></c:out></td>
				<td>
					&nbsp;<a href="updateStudent.do?id=${student.id}">Edit</a>
					&nbsp;&nbsp;<a href="javascript:deleteStudent('deleteStudent.do?id=${student.id}');">Delete</a>
				</td>
			</tr>
			</c:forEach>
		</c:if>				
	</table>	
	</center>
		
</body>
</html>