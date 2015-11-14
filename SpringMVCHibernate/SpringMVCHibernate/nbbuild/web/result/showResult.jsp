<%@include file="taglib_includes_result.jsp" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><spring:message code="App.Title"></spring:message> </title>
<script src="../js/result.js" type="text/javascript"></script>
</head>
<body style="font-family: Arial; font-size:smaller;">
	<center>
	<form action="searchResult.do" method="post">		
			<table style="border-collapse: collapse;" border="0" bordercolor="#006699" width="500">
			<tr>
				<td>Enter Result Name</td> 
				<td><input type="text" name="name"/>
					&nbsp;&nbsp;<input type="submit" value="Search"/>
					&nbsp;&nbsp;<input type="button" value="New Result" onclick="javascript:go('saveResult.do');"/>
			</td></tr>
		</table>
	</form>
	
	<table style="border-collapse: collapse;" border="1" bordercolor="#006699" width="500">
		<tr bgcolor="lightblue">
			<th>Id</th>
                        <th>Class</th>
			<th>Name</th>			
			<th>Subject</th>	
			<th>MCQ</th>
			<th>Descriptive</th>
                        <th>Practical</th>
                        <th>Total</th>
                        <th>Result</th>
                        <th></th>
		</tr>
		<c:if test="${empty SEARCH_RESULT_RESULTS_KEY}">
		<tr>
			<td colspan="4">No Results found</td>
		</tr>
		</c:if>
		<c:if test="${! empty SEARCH_RESULT_RESULTS_KEY}">
			<c:forEach var="contact" items="${SEARCH_RESULT_RESULTS_KEY}">		
		    <tr>
				<td><c:out value="${result.id}"></c:out></td>
				<td><c:out value="${result.class_}"></c:out></td>
				<td><c:out value="${result.name}"></c:out> </td>
				<td><c:out value="${result.subject}"></c:out></td>
                                <td><c:out value="${result.mcq}"></c:out></td>
                                <td><c:out value="${result.descriptive}"></c:out></td>
                                <td><c:out value="${result.practicalmarks}"></c:out></td>
                                <td><c:out value="${result.total}"></c:out></td>
                                <td><c:out value="${result.result}"></c:out></td>
				<td>
					&nbsp;<a href="updateResult.do?id=${result.id}">Edit</a>
					&nbsp;&nbsp;<a href="javascript:deleteResult('deleteResult.do?id=${result.id}');">Delete</a>
				</td>
			</tr>
			</c:forEach>
		</c:if>				
	</table>	
	</center>
		
</body>
</html>