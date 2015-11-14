function goStudent(url)
{
	window.location = url;
}

function newStudent()
{
	window.location = "saveStudent.do";
}

function deleteStudent(url)
{
	var isOK = confirm("Are you sure to delete?");
	if(isOK)
	{
		go(url);
	}
}
