function go(url)
{
	window.location = url;
}

function newContractus()
{
	window.location = "saveContractus.do";
}

function deleteContractus(url)
{
	var isOK = confirm("Are you sure to delete?");
	if(isOK)
	{
		go(url);
	}
}
