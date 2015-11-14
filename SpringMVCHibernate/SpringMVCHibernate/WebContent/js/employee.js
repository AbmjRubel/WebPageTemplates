function goEmployee(url)
{
	window.location = url;
}

function newEmployee()
{
	window.location = "saveEmployee.do";
}

function deleteEmployee(url)
{
	var isOK = confirm("Are you sure to delete?");
	if(isOK)
	{
		go(url);
	}
}
