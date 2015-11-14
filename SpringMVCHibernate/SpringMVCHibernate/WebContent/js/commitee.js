function goCommitee(url)
{
	window.location = url;
}

function newCommitee()
{
	window.location = "saveCommitee.do";
}

function deleteCommitee(url)
{
	var isOK = confirm("Are you sure to delete?");
	if(isOK)
	{
		go(url);
	}
}
