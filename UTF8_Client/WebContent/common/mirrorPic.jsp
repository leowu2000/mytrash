<%@ page contentType="text/html;charset=UTF-8"%>
<%
	String filepath=request.getParameter("filepath");
	filepath = java.net.URLDecoder.decode(filepath , "UTF-8");
	String newpath = filepath.replaceAll("\\\\","\\\\\\\\");
%>
<html>
<head>
<style type="text/css">
<!--

#newPreview
{
	position:relative;
	filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=sSize);
	width :100%; 
	height:100%; 
	borde:6px double #ccc;
}

-->
</style>
<title></title>
<script language="javascript">
//<BODY onload="viewThePic('')"> 
//function viewThePic(url){
//	newPreview.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = url; 
//}
</script>
</head>
<BODY> 
<!-- <div id="newPreview"></div>-->
<img src="<%=newpath %>"></img>
</BODY> 
</html>	
