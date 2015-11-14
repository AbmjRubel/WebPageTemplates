<%@include file="taglib_includes_commitee.jsp" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><spring:message code="App.Title"></spring:message> </title>
<script src="../js/commitee.js" type="text/javascript"></script>
</head>
<body style="font-family: Arial; font-size:smaller;">
	<center>
	<form action="searchCommitee.do" method="post">		
			<table style="border-collapse: collapse;" border="0" bordercolor="#006699" width="500">
			<tr>
				<td>Enter Commitee Name</td> 
				<td><input type="text" name="name"/>
					&nbsp;&nbsp;<input type="submit" value="Search"/>
					&nbsp;&nbsp;<input type="button" value="New Commitee" onclick="javascript:goCommitee('saveCommitee.do');"/>
			</td></tr>
		</table>
	</form>
	
	<table style="border-collapse: collapse;" border="1" bordercolor="#006699" width="500">
		<tr bgcolor="lightblue">
			<th>Id</th>
			<th>Name</th>			
			<th>Address</th>	
			<th>gender</th>
			<th>Date Of Birth</th>
                        <th>email</th>
                        <th>mobile</th>
                        <th>designation</th>
                        <th>Photo</th>
                        <th></th>
		</tr>
		<c:if test="${empty SEARCH_COMMITEE_RESULTS_KEY}">
		<tr>
			<td colspan="4">No Results found</td>
		</tr>
		</c:if>
		<c:if test="${! empty SEARCH_COMMITEE_RESULTS_KEY}">
			<c:forEach var="commitee" items="${SEARCH_COMMITEE_RESULTS_KEY}">		
		    <tr>
				<td><c:out value="${commitee.id}"></c:out></td>
				<td><c:out value="${commitee.name}"></c:out></td>
				<td><c:out value="${commitee.address}"></c:out> </td>
				<td><c:out value="${commitee.gender}"></c:out></td>
                                <td><c:out value="${commitee.dob}"></c:out></td>
                                <td><c:out value="${commitee.email}"></c:out></td>
                                <td><c:out value="${commitee.mobile}"></c:out></td>
                                <td><c:out value="${commitee.designation}"></c:out></td>
				<td>
					&nbsp;<a href="updateCommitee.do?id=${commitee.id}">Edit</a>
					&nbsp;&nbsp;<a href="javascript:deleteCommitee('deleteCommitee.do?id=${commitee.id}');">Delete</a>
				</td>
			</tr>
			</c:forEach>
		</c:if>				
	</table>	
	</center>
		
</body>
</html>