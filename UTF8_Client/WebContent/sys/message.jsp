<%@ page contentType="text/html;charset=GBK"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="/common/css/style.css" rel="stylesheet" type="text/css">
<title></title>
</head>
<script>
document.onreadystatechange = subSomething;//当页面加载状态改变的时候执行这个方法.
function subSomething()
{
if(document.readyState == "complete") //当页面加载状态为完全结束时进入
	document.frm.submit(); //这是你的操作
} 
</script>
<body onload="submit();">
<form name="frm" action="/upload.do" method="post">
<input type="hidden" name="actionType" value="upload"></input>
正在准备上传数据......
</form>
</body>
</html>
