<%@include file="taglib_includes.jsp" %>

<html>
<head>
    <script src="../js/contractus.js" type="text/javascript"></script>
	<title><spring:message code="App.Title"></spring:message> </title>
</head>
<body style="font-family: Arial; font-size:smaller;">

<table  bgcolor="lightblue" width="750" height="500" align="center" style="border-collapse: collapse;" border="1" bordercolor="#006699" >
	<tr>
		<td align="center"><h3>Edit Contractus Form</h3></td>
	</tr>
  <tr valign="top" align="center">
    <td align="center">
 		<form:form action="updateContractus.do" method="post" commandName="editContractus">
				<table width="500" style="border-collapse: collapse;" border="0" bordercolor="#006699" cellspacing="2" cellpadding="2">					
					<tr>
						<td width="100" align="right">Id</td>
						<td width="150">
						<form:input path="id" readonly="true"/></td>
						<td align="left">
						<form:errors path="id" cssStyle="color:red"></form:errors>  </td>
					</tr>
					<tr>
						<td width="100" align="right">Name</td>
						<td><form:input path="name"/></td>
						<td align="left">
						<form:errors path="name" cssStyle="color:red"></form:errors> 
						</td>
					</tr>
					
					<tr>
						<td width="100" align="right">Email</td>
						<td><form:input path="email"/></td>
						<td align="left"><form:errors path="email" cssStyle="color:red"></form:errors>  </td>
					</tr>
					<tr>
						<td width="100" align="right">Mobile</td>
						<td><form:input path="mobile"/></td>
						<td align="left">
						<form:errors path="mobile" cssStyle="color:red"></form:errors>  </td>
					</tr>
                                        <tr>
						<td width="100" align="right">Message</td>
						<td><form:input path="message"/></td>
						<td align="left">
						<form:errors path="message" cssStyle="color:red"></form:errors> 
						</td>
					</tr>
					<tr valign="bottom">
						<td colspan="3" align="center">
						<input type="button"  value="Delete" onclick="javascript:deleteContractus('deleteContractus.do?id=${Contractus.id}');">
						&nbsp;&nbsp;
						<input type="submit" name="" value="Save">						
						&nbsp;&nbsp;
						<input type="button"  value="Back" onclick="javascript:go('viewAllContractus.do');">
						</td>
					</tr>
					
				</table>				
		</form:form>
    </td>    
  </tr>
</table>


</body>
</html>
