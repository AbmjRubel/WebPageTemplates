<%@include file="taglib_includes_result.jsp" %>

<html>
<head>
    <script src="../js/result.js" type="text/javascript"></script>
	<title><spring:message code="App.Title"></spring:message> </title>
</head>
<body style="font-family: Arial; font-size:smaller;">

<table  bgcolor="lightblue" width="750" height="500" align="center" style="border-collapse: collapse;" border="1" bordercolor="#006699" >
	<tr>
		<td align="center"><h3>Edit Result Form</h3></td>
	</tr>
  <tr valign="top" align="center">
    <td align="center">
 		<form:form action="updateResult.do" method="post" commandName="editResult">
				<table width="500" style="border-collapse: collapse;" border="0" bordercolor="#006699" cellspacing="2" cellpadding="2">					
					<tr>
						<td width="100" align="right">Id</td>
						<td width="150">
						<form:input path="id" readonly="true"/></td>
						<td align="left">
						<form:errors path="id" cssStyle="color:red"></form:errors>  </td>
					</tr>
					<tr>
						<td width="100" align="right">Class</td>
						<td><form:input path="class_"/></td>
						<td align="left">
						<form:errors path="class_" cssStyle="color:red"></form:errors> 
						</td>
					</tr>
                                        <tr>
						<td width="100" align="right">Name</td>
						<td><form:input path="name"/></td>
						<td align="left">
						<form:errors path="name" cssStyle="color:red"></form:errors> 
						</td>
					</tr>
                                        <tr>
						<td width="100" align="right">Subject</td>
						<td><form:input path="subject"/></td>
						<td align="left">
						<form:errors path="subject" cssStyle="color:red"></form:errors> 
						</td>
					</tr>
                                        <tr>
						<td width="100" align="right">MCQ</td>
						<td><form:input path="mcq"/></td>
						<td align="left">
						<form:errors path="mcq" cssStyle="color:red"></form:errors> 
						</td>
					</tr>
                                        <tr>
						<td width="100" align="right">Descriptive</td>
						<td><form:input path="descriptive"/></td>
						<td align="left">
						<form:errors path="descriptive" cssStyle="color:red"></form:errors> 
						</td>
					</tr>
                                        <tr>
						<td width="100" align="right">Practical Marks</td>
						<td><form:input path="practicalmarks"/></td>
						<td align="left">
						<form:errors path="practicalmarks" cssStyle="color:red"></form:errors> 
						</td>
					</tr>
                                        <tr>
						<td width="100" align="right">Total Marks</td>
						<td><form:input path="total"/></td>
						<td align="left">
						<form:errors path="total" cssStyle="color:red"></form:errors> 
						</td>
					</tr>
                                        <tr>
						<td width="100" align="right">Exam Date</td>
						<td><form:input path="examdate"/></td>
						<td align="left">
						<form:errors path="examdate" cssStyle="color:red"></form:errors> 
						</td>
					</tr><tr>
						<td width="100" align="right">Result Date</td>
						<td><form:input path="publisheddate"/></td>
						<td align="left">
						<form:errors path="publisheddate" cssStyle="color:red"></form:errors> 
						</td>
					</tr>
                                        <tr>
						<td width="100" align="right">Result Status</td>
						<td><form:input path="result"/></td>
						<td align="left">
						<form:errors path="result" cssStyle="color:red"></form:errors> 
						</td>
					</tr>
                                                                 
					
					<tr valign="bottom">
						<td colspan="3" align="center">
						<input type="button"  value="Delete" onclick="javascript:deleteResult('deleteResult.do?id=${editResult.id}');">
						&nbsp;&nbsp;
						<input type="submit" name="" value="Save">						
						&nbsp;&nbsp;
						<input type="button"  value="Back" onclick="javascript:go('viewAllResult.do');">
						</td>
					</tr>
					
				</table>				
		</form:form>
    </td>    
  </tr>
</table>


</body>
</html>
