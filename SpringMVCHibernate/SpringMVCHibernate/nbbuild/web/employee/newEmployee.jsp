<%@include file="taglib_includes_employee.jsp" %>

<html>
<head>
    <script src="../js/employee.js" type="text/javascript"></script>
	<title><spring:message code="App.Title"></spring:message> </title>
</head>
<body style="font-family: Arial; font-size:smaller;">

<table  bgcolor="lightblue" width="750" height="500" align="center" style="border-collapse: collapse;" border="1" bordercolor="#006699" >
	<tr>
		<td align="center"><h3>New Employee Form</h3></td>
	</tr>
	<tr valign="top" align="center">
    <td align="center">
 		<form:form action="saveEmployee.do" method="post" commandName="newEmployee">
	    	
				<table width="500" style="border-collapse: collapse;" border="0" bordercolor="#006699" cellspacing="2" cellpadding="2">	
					<tr>
                                    <td width="100" align="right">Name :</td>
                                    <td><form:input path="name"/></td>
                                <td align="left">
                                    <form:errors path="name" cssStyle="color:red"></form:errors> 
                                    </td>
                                </tr>
                                <tr>
                                    <td width="100" align="right">Address :</td>
                                    <td><form:input path="address"/></td>
                                <td align="left">
                                    <form:errors path="address" cssStyle="color:red"></form:errors>  </td>
                                </tr>

                                <tr>
                                    <td width="100" align="right">Gender :</td>
                                    <td><form:select path="gender">
                                        <form:option value="M" label="Male"/>
                                        <form:option value="F" label="Female"/>
                                    </form:select>						
                                </td>
                                <td>
                                </td>						
                            </tr>
                            <tr>
                                <td width="100" align="right">Date Of Birth :</td>
                                <td><form:input path="dob" /></td>
                                <td align="left"><form:errors path="dob" cssStyle="color:red"></form:errors>  </td>
                                </tr>
                                <tr>
                                    <td width="100" align="right">Designation :</td>
                                    <td><form:input path="designation"/></td>
                                <td align="left">
                                    <form:errors path="designation" cssStyle="color:red"></form:errors>  </td>
                                </tr>
                                <tr>
                                    <td width="100" align="right">Email :</td>
                                    <td><form:input path="email"/></td>
                                <td align="left"><form:errors path="email" cssStyle="color:red"></form:errors>  </td>
                                </tr>
                                <tr>
                                    <td width="100" align="right">Mobile :</td>
                                    <td><form:input path="mobile"/></td>
                                <td align="left">
                                    <form:errors path="mobile" cssStyle="color:red"></form:errors>  </td>
                                </tr>
                                <tr>
                                    <td width="100" align="right">Join Date</td>
                                    <td><form:input path="joindate" /></td>
                                <td align="left"><form:errors path="joindate" cssStyle="color:red"></form:errors>  </td>
                                </tr>
					<tr>
						<td colspan="3" align="center">
						<input type="submit" name="" value="Save">
						&nbsp;&nbsp;
						<input type="reset" name="" value="Reset">
						&nbsp;&nbsp;
						<input type="button"  value="Back" onclick="javascript:goEmployee('viewAllEmployee.do');">
						</td>
					</tr>					
				</table>			
		</form:form>
    </td>    
  </tr>
</table>
</body>
</html>
