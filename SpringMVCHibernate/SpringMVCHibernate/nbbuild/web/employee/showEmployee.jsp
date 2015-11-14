<%@include file="taglib_includes_employee.jsp" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><spring:message code="App.Title"></spring:message> </title>
<script src="../js/employee.js" type="text/javascript"></script>
</head>
<body style="font-family: Arial; font-size:smaller;">
	<center>
	<form action="searchEmployee.do" method="post">		
			<table style="border-collapse: collapse;" border="0" bordercolor="#006699" width="500">
			<tr>
				<td>Enter Employee Name</td> 
				<td><input type="text" name="name"/>
					&nbsp;&nbsp;<input type="submit" value="Search"/>
					&nbsp;&nbsp;<input type="button" value="New Employee" onclick="javascript:goEmployee('saveEmployee.do');"/>
			</td></tr>
		</table>
	</form>
	
	<table style="border-collapse: collapse;" border="1" bordercolor="#006699" width="500">
		<tr bgcolor="lightblue">
			<th>Id</th>
			<th>Name</th>			
			<th>Address</th>	
			<th>Gender</th>
			<th>Date Of Birth</th>
                        <th>Designation</th>
                        <th>Email</th>
                        <th>Mobile</th>
                        <th>Join Date</th>
                        <th></th>
                        
                        
		</tr>
		<c:if test="${empty SEARCH_EMPLOYEE_RESULTS_KEY}">
		<tr>
			<td colspan="4">No Results found</td>
		</tr>
		</c:if>
		<c:if test="${! empty SEARCH_EMPLOYEE_RESULTS_KEY}">
			<c:forEach var="employee" items="${SEARCH_EMPLOYEE_RESULTS_KEY}">		
		    <tr>
				<td><c:out value="${employee.id}"></c:out></td>
				<td><c:out value="${employee.name}"></c:out></td>
				<td><c:out value="${employee.address}"></c:out> </td>
				<td><c:out value="${employee.gender}"></c:out></td>
                                <td><c:out value="${employee.dob}"></c:out></td>
                                <td><c:out value="${employee.designation}"></c:out></td>
                                <td><c:out value="${employee.email}"></c:out></td>
                                <td><c:out value="${employee.mobile}"></c:out></td>
                                <td><c:out value="${employee.joindate}"></c:out></td>                                
				<td>
					&nbsp;<a href="updateEmployee.do?id=${employee.id}">Edit</a>
					&nbsp;&nbsp;<a href="javascript:deleteEmployee('deleteEmployee.do?id=${employee.id}');">Delete</a>
				</td>
			</tr>
			</c:forEach>
		</c:if>				
	</table>	
	</center>
		
</body>
</html>