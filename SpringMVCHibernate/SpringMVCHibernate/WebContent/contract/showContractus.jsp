<%@include file="taglib_includes.jsp" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><spring:message code="App.Title"></spring:message> </title>
<script src="../js/contractus.js" type="text/javascript"></script>
</head>
<body style="font-family: Arial; font-size:smaller;">
	<center>
	<form action="searchContractus.do" method="post">		
			<table style="border-collapse: collapse;" border="0" bordercolor="#006699" width="500">
			<tr>
				<td>Enter Contractus Name</td> 
				<td><input type="text" name="name"/>
					&nbsp;&nbsp;<input type="submit" value="Search"/>
					&nbsp;&nbsp;<input type="button" value="New Contractus" onclick="javascript:go('saveContractus.do');"/>
			</td></tr>
		</table>
	</form>
	
	<table style="border-collapse: collapse;" border="1" bordercolor="#006699" width="500">
		<tr bgcolor="lightblue">
			<th>Id</th>
			<th>Name</th>			
			<th>email</th>
                        <th>mobile</th>
                        <th>Message</th>
                        <th></th>
                        
		</tr>
		<c:if test="${empty SEARCH_CONTRACTUS_RESULTS_KEY}">
		<tr>
			<td colspan="4">No Results found</td>
		</tr>
		</c:if>
		<c:if test="${! empty SEARCH_CONTRACTUS_RESULTS_KEY}">
			<c:forEach var="contractus" items="${SEARCH_CONTRACTUS_RESULTS_KEY}">		
		    <tr>
				<td><c:out value="${contractus.id}"></c:out></td>
				<td><c:out value="${contractus.name}"></c:out></td>
				<td><c:out value="${contractus.email}"></c:out> </td>
				<td><c:out value="${contractus.mobile}"></c:out></td>
                                <td><c:out value="${contractus.message}"></c:out></td>
                                
				<td>
					&nbsp;<a href="updateContractus.do?id=${contractus.id}">Edit</a>
					&nbsp;&nbsp;<a href="javascript:deleteContractus('deleteContractus.do?id=${contractus.id}');">Delete</a>
				</td>
			</tr>
			</c:forEach>
		</c:if>				
	</table>	
	</center>
		
</body>
</html>