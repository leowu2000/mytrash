<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.buiness.dao.*" %>
<%@ page import="com.buiness.form.*" %>
<%@ page import="com.util.page.*" %>
<%@ page import="com.util.*" %>
<%@ page import="java.util.*" %>
<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="/common/css/style.css" rel="stylesheet" type="text/css">
<script Language="JavaScript" src="/common/js/common.js"></script>
<script Language="JavaScript" src="/common/My97DatePicker/WdatePicker.js"></script>
</head>
<% 
	String path = request.getSession().getServletContext().getRealPath("/");
	String num = request.getParameter("num");
	String tbname = request.getParameter("tbname");
	if("TB_STDNC".trim().equals(tbname)){//险情
		
	}
	if("TB_FPACTI".trim().equals(tbname)){//行动
		
	}
	if("TB_SD".trim().equals(tbname)){//旱情
		
	}
	if("TB_QT".trim().equals(tbname)){//灾情
		
	}
	if("TB_FXJB".trim().equals(tbname)){//简报
		
	}
	
%> 
<body>
<%
	if("TB_PJRCN".trim().equals(tbname)){//运行
%>
<iframe id="main3" frameborder="0" scrolling="auto" marginwidth="0" marginheight="0" src="/project/gqyxView.jsp?RPJINCD=<%=num %>&fromwhere=upload" height="140" width="100%">
</iframe>
<%	
	}
	if("TB_STDNC".trim().equals(tbname)){//险情
%>
	<jsp:include page="/project/gqxqView.jsp?RPJINCD=<%=num %>&fromwheres=upload"></jsp:include>
<%			
	}
	if("TB_FPACTI".trim().equals(tbname)){//行动
%>
<%			
	}
	if("TB_SD".trim().equals(tbname)){//旱情
%>
<%			
	}
	if("TB_QT".trim().equals(tbname)){//灾情
%>
<%			
	}
	if("TB_FXJB".trim().equals(tbname)){//简报
%>
<%			
	}
%>
</body>
</html>
