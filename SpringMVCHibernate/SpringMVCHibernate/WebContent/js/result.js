function goResult(url)
{
	window.location = url;
}

function newResult()
{
	window.location = "saveResult.do";
}

function deleteResult(url)
{
	var isOK = confirm("Are you sure to delete?");
	if(isOK)
	{
		go(url);
	}
}
