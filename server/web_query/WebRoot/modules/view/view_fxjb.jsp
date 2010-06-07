<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.basesoft.util.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>图片查看</title>
    
	<script language="javascript" src="../../script/openurl.js"></script>
	<script language="javascript" src="../../script/onmouseover.js"></script>
	<script language="JavaScript" src="../script/layer10.js"></script>
	<link rel="stylesheet" href="../../css/main.css" type="text/css">
	<script language="javascript">
	//调整位置的函数
	function adjust(){
		document.all.Layer1.style.posTop=10;
		document.all.Layer1.style.posLeft=100;
		document.all.Layer2.style.posLeft=document.all.Layer1.style.posLeft;
		document.all.Layer2.style.posTop=document.all.Layer1.style.posTop+document.all.Layer1.offsetHeight+10;
		document.all.Layer3.style.posTop=document.all.Layer2.style.posTop+document.all.Layer2.offsetHeight+10;
		document.all.Layer3.style.posLeft=document.all.Layer1.style.posLeft;
		document.all.ss.value=document.all.Layer3.style.posTop/469;
	}

	//放大缩小的函数
	function change(str1,str2)
	{
		setTimeout("adjust();",1000);
		str1.width *= str2;
		str1.height *= str2;
		adjust();
       	}
       	function form_click(fxxdbh)
       	{
       		var temp_var1;
       		if (recno.value=="")
       			alert("对不起，您输入错误的编号");
       		else{
       			temp_var1="fxxddmtNew.jsp?fxxdbh="+fxxdbh+"&recno="+recno.value;
       			window.location.href=temp_var1;
       		}
       	}
		
		function zoom(str1)
	{
		setTimeout("adjust();",1000);
		str1.width =600;
		str1.height = 400;
		adjust();
       	}
       	function form_click(fxxdbh)
       	{
       		var temp_var1;
       		if (recno.value=="")
       			alert("对不起，您输入错误的编号");
       		else{
       			temp_var1="fxxddmtNew.jsp?fxxdbh="+fxxdbh+"&recno="+recno.value;
       			window.location.href=temp_var1;
       		}
       	}
</script>

</head>
<body background="../../images/back.gif">
<%	
	//标题
	String title = request.getParameter("title")==null?"":new String(request.getParameter("title").getBytes("ISO8859-1"),"UTF-8");
	//采集时间
	String dtcdt = request.getParameter("dtcdt")==null?"":request.getParameter("dtcdt").length()<10?"":request.getParameter("dtcdt").substring(0,10);
	//采集单位
	String tbdw = request.getParameter("tbdw")==null?"":new String(request.getParameter("tbdw").getBytes("ISO8859-1"),"UTF-8");
	//多媒体文件名
	String fileName = request.getParameter("fileName")==null?"":new String(request.getParameter("fileName").getBytes("ISO8859-1"),"UTF-8");
	//文件格式
	String wjgs = request.getParameter("WJGS");
	//详细内容
	String detail = request.getParameter("DETAIL")==null?"":new String(request.getParameter("DETAIL").getBytes("ISO8859-1"),"UTF-8");
	
	String media_id = request.getParameter("media_id");

%>
<div id="Layer3" style="position:absolute; left:20px; top:20px; width:600px; height:90px; z-index:1;; visibility: visible"> 
  <table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tbody>
      <tr> 
        <td colspan="2"><div name="text_detail" class="textarea3"><%=detail %></div> 
        </td>
      </tr>
    </tbody>
  </table>
  <table width="100%">
    <tr><td align="center"><input type="hidden" name="filename" value="<%=fileName%>">
	<input type="button" value="返  回" onclick="javascript:if(self.filename.value==''){self.close()}else{history.go(-1)}" class="input1" id="button1" name="button1"></td></tr>
    <tr><td height="20" align="center"></td></tr>
  </table>
  
</div>
	<div id="Layer2" style="position:absolute; left:18px; top:40px; width:600px; height:90px; z-index:1;; visibility: visible">
  	  <img id="img1" name="img1" src="/media.do?action=image&tablename=TB_FXJB_M&media_id=<%=media_id%>" width="100%" height="400"> 
	</div>
<div id="Layer1" style="position:absolute; left:18px; top:200px; width:600px; height:30px; z-index:1; visibility: visible"> 
	
  <table width="100%" cellspacing="0" cellpadding="0">
    <tr> 
      <td colspan="2" bgcolor="#FFFFFF" class="title"><div align="center"><font color="#003366" size="4"><%=title%></font></div></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td><div align="left"><font color="#003366"><%=tbdw%></font></div></td>
      <td><div align="right"><font color="#003366"><%=dtcdt%></font></div></td>
    </tr>
  </table>
</div>
<div id="Layer4" style="position:absolute; width:40px; height:200px; z-index:1; left: 46px; top: 55px; visibility: visible;"> 
  <table width="100%" border="0" cellpadding="0" cellspacing="1">
    <tr> 
      <td width="40" height="40" align="center" bgcolor="#FFFFFF" onClick="change(document.all.img1,1.1)"><u><img src="../../images/fd.gif" alt="放大" onClick="change(document.all.img1,1.1)" ><br>
        </u>放大 </td>
    </tr>
    <tr> 
      <td width="40" height="40" align="center" bgcolor="#FFFFFF" onClick="zoom(document.all.img1)"><u><img src="../../images/zoom.gif" alt="还原" width="26" height="26" onClick="zoom(document.all.img1)" ><br>
        </u>还原</td>
    </tr>
    <tr> 
      <td width="40" height="40" align="center" bgcolor="#FFFFFF" onClick="change(document.all.img1,0.9)"><u><img src="../../images/sx.gif" alt="缩小" onClick="change(document.all.img1,0.9)" ><br>
        </u>缩小</td>
    </tr>
    <tr> 
      <td width="40" height="40" align="center" bgcolor="#FFFFFF"><input name="ss" type="text" value="1" size="3" maxlength="3" class="input2" readonly style="width:40;"></td>
    </tr>
  </table>
</div>
<script language="javascript">
 
adjust();
setTimeout("adjust();",1000);
</script>
</body>
</html>
