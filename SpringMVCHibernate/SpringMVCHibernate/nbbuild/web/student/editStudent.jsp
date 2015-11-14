<%@include file="taglib_includes_student.jsp" %>

<html>
<head>
    <script src="../js/student.js" type="text/javascript"></script>
	<title><spring:message code="App.Title"></spring:message> </title>
</head>
<body style="font-family: Arial; font-size:smaller;">

<table  bgcolor="lightblue" width="750" height="500" align="center" style="border-collapse: collapse;" border="1" bordercolor="#006699" >
	<tr>
		<td align="center"><h3>Edit Student Form</h3></td>
	</tr>
  <tr valign="top" align="center">
    <td align="center">
 		<form:form action="updateStudent.do" method="post" commandName="editStudent">
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
						<td width="100" align="right">Father's Name</td>
						<td><form:input path="fathername"/></td>
						<td align="left">
						<form:errors path="fathername" cssStyle="color:red"></form:errors> 
						</td>
					</tr>
					<tr>
						<td width="100" align="right">Gender</td>
						<td>			
							<form:select path="gender">
					            <form:option value="M" label="Male"/>
					            <form:option value="F" label="Female"/>
					        </form:select>						
						</td>												
					</tr>
					<tr>
						<td width="100" align="right">Date Of Birth</td>
						<td><form:input path="dob" /></td>
                                        <td align="left"><form:errors path="dob" cssStyle="color:red"></form:errors>  </td>
					</tr>
					<tr>
						<td width="100" align="right">Religion</td>
						<td><form:input path="resigion"/></td>
						<td align="left">
						<form:errors path="resigion" cssStyle="color:red"></form:errors> 
						</td>
					</tr>
                                        <tr>
						<td width="100" align="right">Mobile</td>
						<td><form:input path="mobile"/></td>
						<td align="left">
						<form:errors path="mobile" cssStyle="color:red"></form:errors>  </td>
					</tr>
					<tr>
						<td width="100" align="right">Present Address</td>
						<td><form:input path="praddress"/></td>
						<td align="left">
						<form:errors path="praddress" cssStyle="color:red"></form:errors>  </td>
					</tr>
                                        <tr>
						<td width="100" align="right">Permanent Address</td>
						<td><form:input path="peraddress"/></td>
						<td align="left">
						<form:errors path="peraddress" cssStyle="color:red"></form:errors>  </td>
					</tr>
                                        <tr>
						<td width="100" align="right">Nationality</td>
						<td><form:input path="nationality"/></td>
						<td align="left">
						<form:errors path="nationality" cssStyle="color:red"></form:errors> 
						</td>
					</tr>
                                        <tr>
						<td width="100" align="right">Class</td>
						<td><form:input path="class_"/></td>
						<td align="left">
						<form:errors path="class_" cssStyle="color:red"></form:errors> 
						</td>
					</tr>
                                        <tr>
						<td width="100" align="right">Group</td>
						<td><form:input path="sgroup"/></td>
						<td align="left">
						<form:errors path="sgroup" cssStyle="color:red"></form:errors> 
						</td>
					</tr>
                                        <tr>
						<td width="100" align="right">Shift</td>
						<td><form:input path="shift"/></td>
						<td align="left">
						<form:errors path="shift" cssStyle="color:red"></form:errors> 
						</td>
					</tr>
                                        <tr>
						<td width="100" align="right">Roll</td>
						<td><form:input path="roll"/></td>
						<td align="left">
						<form:errors path="roll" cssStyle="color:red"></form:errors> 
						</td>
					</tr>
                                        <tr>
						<td width="100" align="right">Session</td>
						<td><form:input path="session"/></td>
						<td align="left">
						<form:errors path="session" cssStyle="color:red"></form:errors> 
						</td>
					</tr>
					<tr>
						<td width="100" align="right">Email</td>
						<td><form:input path="email"/></td>
						<td align="left"><form:errors path="email" cssStyle="color:red"></form:errors>  </td>
					</tr>
                                        <tr>
						<td width="100" align="right">Teacher Name</td>
						<td><form:input path="tname"/></td>
						<td align="left">
						<form:errors path="tname" cssStyle="color:red"></form:errors> 
						</td>
					</tr>
					
					<tr valign="bottom">
						<td colspan="3" align="center">
						<input type="button"  value="Delete" onclick="javascript:deleteStudent('deleteStudent.do?id=${editStudent.id}');">
						&nbsp;&nbsp;
						<input type="submit" name="" value="Save">						
						&nbsp;&nbsp;
						<input type="button"  value="Back" onclick="javascript:goStudent('viewAllStudent.do');">
						</td>
					</tr>
					
				</table>				
		</form:form>
    </td>    
  </tr>
</table>


</body>
</html>
