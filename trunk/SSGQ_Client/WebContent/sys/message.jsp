<%@ page contentType="text/html;charset=GBK"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="/common/css/style.css" rel="stylesheet" type="text/css">
<title></title>
</head>
<script>
document.onreadystatechange = subSomething;//��ҳ�����״̬�ı��ʱ��ִ���������.
function subSomething()
{
if(document.readyState == "complete") //��ҳ�����״̬Ϊ��ȫ����ʱ����
	document.frm.submit(); //������Ĳ���
} 
</script>
<body onload="submit();">
<form name="frm" action="/upload.do" method="post">
<input type="hidden" name="actionType" value="upload"></input>
����׼���ϴ�����......
</form>
</body>
</html>
