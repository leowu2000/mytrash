<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.basesoft.util.*" %>
<%
	Map mapXq1 = (Map)request.getAttribute("mapXq1");
	String pageNum = request.getAttribute("page").toString();
	String id = request.getAttribute("id").toString();
	
	Map mapXqflxx = (Map)request.getAttribute("mapXqflxx");
	
	String xqfldm = mapXq1.get("xqfldm").toString();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>险情详细信息</title>
	<script language="javascript" src="../../script/openurl.js"></script>
	<script language="javascript" src="../../script/onmouseover.js"></script>
	<link rel="stylesheet" href="../../css/main.css" type="text/css">
  </head>
<body  leftmargin="10" topmargin="10" background="../../images/back.gif" onunload="window.opener.form1.button_detail.value='详细信息';" >
<br><br>
<table width='70%' border='0'  align='center' cellpadding='0' cellspacing='1' >
<tr><td width="50%">
<table width='100%' border='0'  align='center' cellpadding='0' cellspacing='1' bgcolor='#336699' >
  <tr align='center'>
	<td width='30%' height='25' class="banner">出险部位</td>
	<td width='70%' height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapXq1.get("daglo")%></font></td>        
  </tr>
  <tr align='center'>
	<td width='30%' height='25' class="banner">抢险方案</td>
	<td width='70%' height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable22'><%=mapXq1.get("rdepl")%></font></td>
  </tr>        
  <tr align='center'>
	<td height='25' class="banner">抢险资源配备</td>
	<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable23'><%=mapXq1.get("rderescn")%></font></td>
  </tr>
  <tr align='center'>        
	<td height='25' class="banner">群众投入</td>
	<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable24'><%=mapXq1.get("tpn") + "人" %></font></td>
  </tr>        
  <tr align='center'>
	<td height='25' class="banner">解放军投入</td>
	<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable25'><%=mapXq1.get("plapn") + "人" %></font></td>
  </tr>
  <tr align='center'>        
	<td height='25' class="banner">武警投入</td>
	<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable26'><%=mapXq1.get("plipn") + "人"%></font></td>
  </tr>        
  <tr align='center'>
	<td height='25' class="banner">进展及结果</td>
	<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable27'><%=mapXq1.get("rdecnrl")%></font></td>
  </tr>
  <tr align='center'>        
	<td height='25' class="banner">可能影响范围</td>
	<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable28'><%=mapXq1.get("dncpbnfz")%></font></td>
  </tr>        
  <tr align='center'>
	<td height='25' class="banner">险情原因分析</td>
	<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable29'><%=mapXq1.get("dnccuan")%></font></td>
  </tr>
  <tr align='center'>        
	<td height='25' class="banner">险情发展趋势</td>
	<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable30'><%=mapXq1.get("dncestdv")%></font></td>
  </tr>        
  <tr align='center'>
	<td height='25' class="banner">当前运行水位</td>
	<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable31'><%=mapXq1.get("rz") + "米" %></font></td>
  </tr>        
  <tr align='center'>
	<td height='25' class="banner">抢险时气象状况</td>
	<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable32'><%=mapXq1.get("wthcn")%></font></td>
  </tr>        
  <tr align='center'>
	<td height='25' class="banner">未来水文气象状况</td>
	<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable33'><%=mapXq1.get("fhywthcn")%></font></td>
  </tr>
  <tr align='center'>        
	<td height='25' class="banner">补充描述</td>
	<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable34'><%=mapXq1.get("dncaddsc")%></font></td>
  </tr>
</table>
</td>
<td width="50%" valign="top">
<table width='100%' border='0'  align='center' cellpadding='0' cellspacing='1' bgcolor='#336699' >
<%
	if("D001".equals(xqfldm)){
%>
  	  <tr align='center'>
		<td width='30%' height='25' class="banner">决口宽度</td>
		<td width='70%' height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapXqflxx.get("BUW")%></font></td>        
  	  </tr>
  	  <tr align='center'>
		<td height='25' class="banner">决口流速</td>
		<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapXqflxx.get("BUVL")%></font></td>        
  	  </tr>
  	  <tr align='center'>
		<td height='25' class="banner">决口水头差</td>
		<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapXqflxx.get("BUZDF")%></font></td>        
  	  </tr>
  	  <tr align='center'>
		<td height='25' class="banner">决口流量</td>
		<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapXqflxx.get("BUQ")%>立方米/秒</font></td>        
  	  </tr>
  	  <tr align='center'>
		<td height='25' class="banner">受灾人口</td>
		<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapXqflxx.get("DSSPN")%>人</font></td>        
  	  </tr>
  	  <tr align='center'>
		<td height='25' class="banner">受伤人口</td>
		<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapXqflxx.get("INPN")%>人</font></td>        
  	  </tr>
  	  <tr align='center'>
		<td height='25' class="banner">死亡人口</td>
		<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapXqflxx.get("DTHPN")%>人</font></td>        
  	  </tr>
  	  <tr align='center'>
		<td height='25' class="banner">倒塌房屋</td>
		<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapXqflxx.get("WRHS")%>间</font></td>        
  	  </tr>
  	  <tr align='center'>
		<td height='25' class="banner">农作物受害面积</td>
		<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapXqflxx.get("CRPDSSAR")%>公顷</font></td>        
  	  </tr>
  	  <tr align='center'>
		<td height='25' class="banner">毁坏耕地面积</td>
		<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapXqflxx.get("SCDMFMAR")%>公顷</font></td>        
  	  </tr>
  	  <tr align='center'>
		<td height='25' class="banner">直接经济损失</td>
		<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapXqflxx.get("DRCECLS")%>万元</font></td>        
  	  </tr>
  	  <tr align='center'>
		<td height='25' class="banner">决口处地质地形条件</td>
		<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapXqflxx.get("BURLDGL")%></font></td>        
  	  </tr>
<%
	}else if("D002".equals(xqfldm)){
%> 
	  <tr align='center'>
		<td width='30%' height='25' class="banner">漫溢长度</td>
		<td width='70%' height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapXqflxx.get("OVFLL")%>米</font></td>        
  	  </tr>
  	  <tr align='center'>
		<td height='25' class="banner">漫溢水位</td>
		<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapXqflxx.get("OVFLZ")%>米/秒</font></td>        
  	  </tr>
  	  <tr align='center'>
		<td height='25' class="banner">漫溢流量</td>
		<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapXqflxx.get("DSQ")%>立方米/秒</font></td>        
  	  </tr>
<%
	}else if("D003".equals(xqfldm)){
		String LKGTU = mapXqflxx.get("LKGTU")==null?"":mapXqflxx.get("LKGTU").toString();
		if("1".equals(LKGTU.trim())){
			LKGTU = "清";
		}else if("2".equals(LKGTU.trim())){
			LKGTU = "浑";
		}
%>  
	  <tr align='center'>
		<td width='30%' height='25' class="banner">距堤顶高程</td>
		<td width='70%' height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapXqflxx.get("TODFTDI")%>米</font></td>        
  	  </tr>
  	  <tr align='center'>
		<td height='25' class="banner">最大漏洞直径</td>
		<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapXqflxx.get("LKDMT")%>米</font></td>        
  	  </tr>
  	  <tr align='center'>
		<td height='25' class="banner">漏洞流量</td>
		<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapXqflxx.get("LKQ")%>升/秒</font></td>        
  	  </tr>
  	  <tr align='center'>
		<td height='25' class="banner">漏洞浑清</td>
		<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=LKGTU%></font></td>        
  	  </tr>
  	  <tr align='center'>
		<td height='25' class="banner">漏洞群面积</td>
		<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapXqflxx.get("LKSAR")%>平方米</font></td>        
  	  </tr>
  	  <tr align='center'>
		<td height='25' class="banner">漏洞水柱高</td>
		<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapXqflxx.get("LKWTLH")%>米</font></td>        
  	  </tr>
<%
	}else if("D004".equals(xqfldm)){
		String LKGTU = mapXqflxx.get("LKGTU")==null?"":mapXqflxx.get("LKGTU").toString();
		if("1".equals(LKGTU.trim())){
			LKGTU = "清";
		}else if("2".equals(LKGTU.trim())){
			LKGTU = "浑";
		}
%>
	  <tr align='center'>
		<td width='30%' height='25' class="banner">距堤脚距离</td>
		<td width='70%' height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapXqflxx.get("TODFTDI")%>米</font></td>        
  	  </tr>
	  <tr align='center'>
		<td height='25' class="banner">出水流量</td>
		<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapXqflxx.get("PPQ")%>升/秒</font></td>        
  	  </tr>
  	  <tr align='center'>
		<td height='25' class="banner">水柱高</td>
		<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapXqflxx.get("WTLH")%>米</font></td>        
  	  </tr>
  	  <tr align='center'>
		<td height='25' class="banner">出水浑清</td>
		<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=LKGTU%></font></td>        
  	  </tr>
	  <tr align='center'>
		<td height='25' class="banner">管涌群面积</td>
		<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapXqflxx.get("PPSAR")%>平方米</font></td>        
  	  </tr>
<%
	}else if("D005".equals(xqfldm)){
%>
	  <tr align='center'>
		<td width='30%' height='25' class="banner">陷坑深度</td>
		<td width='70%' height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapXqflxx.get("SBDSP")%>米</font></td>        
  	  </tr>
	  <tr align='center'>
		<td height='25' class="banner">陷坑面积</td>
		<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapXqflxx.get("SBAR")%>平方米</font></td>        
  	  </tr>
<%
	}else if("D006".equals(xqfldm)){
%>
	  <tr align='center'>
		<td width='30%' height='25' class="banner">滑坡体积</td>
		<td width='70%' height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapXqflxx.get("SLBU")%>立方米</font></td>        
  	  </tr>
	  <tr align='center'>
		<td height='25' class="banner">滑坡角度</td>
		<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapXqflxx.get("SLUPAG")%>度</font></td>        
  	  </tr>
<%
	}else if("D007".equals(xqfldm)){
%>
	  <tr align='center'>
		<td width='30%' height='25' class="banner">距堤脚距离</td>
		<td width='70%' height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapXqflxx.get("TODFTDI")%>米</font></td>        
  	  </tr>
	  <tr align='center'>
		<td height='25' class="banner">淘刷面积</td>
		<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapXqflxx.get("UNDAR")%>平方米</font></td>        
  	  </tr>
  	  <tr align='center'>
		<td height='25' class="banner">淘刷深度</td>
		<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapXqflxx.get("UNDD")%>米</font></td>        
  	  </tr>
  	  <tr align='center'>
		<td height='25' class="banner">淘刷长度</td>
		<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapXqflxx.get("UNDL")%>米</font></td>        
  	  </tr>
<%
	}else if("D008".equals(xqfldm)){
%>
	  <tr align='center'>
		<td width='30%' height='25' class="banner">裂缝方向</td>
		<td width='70%' height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapXqflxx.get("CRDR")%></font></td>        
  	  </tr>
	  <tr align='center'>
		<td height='25' class="banner">裂缝深度</td>
		<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapXqflxx.get("CRD")%>米</font></td>        
  	  </tr>
  	  <tr align='center'>
		<td height='25' class="banner">裂缝长度</td>
		<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapXqflxx.get("CRL")%>米</font></td>        
  	  </tr>
  	  <tr align='center'>
		<td height='25' class="banner">裂缝宽度</td>
		<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapXqflxx.get("CRW")%>米</font></td>        
  	  </tr>
<%
	}else if("D009".equals(xqfldm)){
%>
	  <tr align='center'>
		<td width='30%' height='25' class="banner">距堤脚距离</td>
		<td width='70%' height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapXqflxx.get("TODFTDI")%>米</font></td>        
  	  </tr>
	  <tr align='center'>
		<td height='25' class="banner">河岸高度</td>
		<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapXqflxx.get("RVH")%>米</font></td>        
  	  </tr>
  	  <tr align='center'>
		<td height='25' class="banner">崩塌长度</td>
		<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapXqflxx.get("CVL")%>米</font></td>        
  	  </tr>
  	  <tr align='center'>
		<td height='25' class="banner">河道流量</td>
		<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapXqflxx.get("WDQ")%>立方米/秒</font></td>        
  	  </tr>
  	  <tr align='center'>
		<td height='25' class="banner">崩塌体积</td>
		<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapXqflxx.get("CVBU")%>立方米</font></td>        
  	  </tr>
  	  <tr align='center'>
		<td height='25' class="banner">水流情况</td>
		<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapXqflxx.get("FLCNDSC")%></font></td>        
  	  </tr>
<%
	}else if("D010".equals(xqfldm)){
%>
	  <tr align='center'>
		<td width='30%' height='25' class="banner">渗水面积</td>
		<td width='70%' height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapXqflxx.get("SPAR")%>平方米</font></td>        
  	  </tr>
	  <tr align='center'>
		<td height='25' class="banner">渗水流量</td>
		<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapXqflxx.get("SPQ")%>升/秒</font></td>        
  	  </tr>
<%
	}else if("D011".equals(xqfldm)){
%>
	  <tr align='center'>
		<td width='30%' height='25' class="banner">河道流量</td>
		<td width='70%' height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapXqflxx.get("WDQ")%>立方米/秒</font></td>        
  	  </tr>
	  <tr align='center'>
		<td height='25' class="banner">浪高</td>
		<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapXqflxx.get("BLH")%>米</font></td>        
  	  </tr>
  	  <tr align='center'>
		<td height='25' class="banner">风力</td>
		<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapXqflxx.get("WNS")%>级</font></td>        
  	  </tr>
<%
	}else if("D012".equals(xqfldm)){
%>
	  <tr align='center'>
		<td width='30%' height='25' class="banner">滑动面角度</td>
		<td width='70%' height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapXqflxx.get("SLUPAG")%>度</font></td>        
  	  </tr>
	  <tr align='center'>
		<td height='25' class="banner">滑动位移</td>
		<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapXqflxx.get("SLUDSP")%>米</font></td>        
  	  </tr>
  	  <tr align='center'>
		<td height='25' class="banner">滑动类型</td>
		<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapXqflxx.get("SLUTP")%></font></td>        
  	  </tr>
  	  <tr align='center'>
		<td height='25' class="banner">滑动面地质情况</td>
		<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapXqflxx.get("SLUGLCN")%></font></td>        
  	  </tr>
<%
	}else if("D013".equals(xqfldm)){
%>
	  <tr align='center'>
		<td width='30%' height='25' class="banner">停电</td>
		<td width='70%' height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapXqflxx.get("POWCUT")%></font></td>        
  	  </tr>
	  <tr align='center'>
		<td height='25' class="banner">起闭机失灵</td>
		<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapXqflxx.get("HOMLF")%></font></td>        
  	  </tr>
  	  <tr align='center'>
		<td height='25' class="banner">闸门井变形</td>
		<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapXqflxx.get("GSDST")%></font></td>        
  	  </tr>
  	  <tr align='center'>
		<td height='25' class="banner">失灵时开启状况</td>
		<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapXqflxx.get("MLFCN")%></font></td>        
  	  </tr>
<%
	}else if("D014".equals(xqfldm)){
%>
	  <tr align='center'>
		<td width='30%' height='25' class="banner">失事时流量</td>
		<td width='70%' height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapXqflxx.get("WRQ")%>立方米/秒</font></td>        
  	  </tr>
	  <tr align='center'>
		<td height='25' class="banner">破坏形式</td>
		<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapXqflxx.get("WRDSC")%></font></td>        
  	  </tr>
<%
	}else if("D015".equals(xqfldm)){
%>	  
	  <tr align='center'>
		<td width='30%' height='25' class="banner">溃坝宽度</td>
		<td width='70%' height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapXqflxx.get("BRDMW")%>米</font></td>        
  	  </tr>
	  <tr align='center'>
		<td height='25' class="banner">溃坝时库容</td>
		<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapXqflxx.get("BRV")%>万立方米</font></td>        
  	  </tr>
  	  <tr align='center'>
		<td height='25' class="banner">溃坝流量</td>
		<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapXqflxx.get("BRDMQ")%>立方米/秒</font></td>        
  	  </tr>
  	  <tr align='center'>
		<td height='25' class="banner">库水位距坝鼎高差</td>
		<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapXqflxx.get("BRZDMCDI")%>米</font></td>        
  	  </tr>
  	  <tr align='center'>
		<td height='25' class="banner">受灾人口</td>
		<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapXqflxx.get("DSSPN")%>人</font></td>        
  	  </tr>
  	  <tr align='center'>
		<td height='25' class="banner">受伤人口</td>
		<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapXqflxx.get("INPN")%>人</font></td>        
  	  </tr>
  	  <tr align='center'>
		<td height='25' class="banner">死亡人口</td>
		<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapXqflxx.get("DTHPN")%>人</font></td>        
  	  </tr>
  	  <tr align='center'>
		<td height='25' class="banner">倒塌房屋</td>
		<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapXqflxx.get("WRHS")%>间</font></td>        
  	  </tr>
  	  <tr align='center'>
		<td height='25' class="banner">农作物受害面积</td>
		<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapXqflxx.get("CRPDSSAR")%>公顷</font></td>        
  	  </tr>
  	  <tr align='center'>
		<td height='25' class="banner">毁坏耕地面积</td>
		<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapXqflxx.get("SCDMFMAR")%>公顷</font></td>        
  	  </tr>
  	  <tr align='center'>
		<td height='25' class="banner">直接经济损失</td>
		<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapXqflxx.get("DRCECLS")%>万元</font></td>        
  	  </tr>
  	  <tr align='center'>
		<td height='25' class="banner">溃坝处地址地形条件</td>
		<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapXqflxx.get("BRDMLDGL")%></font></td>        
  	  </tr>
  	  <tr align='center'>
		<td height='25' class="banner">工程现状</td>
		<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapXqflxx.get("PJPS")%></font></td>        
  	  </tr>
<%
	}else if("D016".equals(xqfldm)){
%>
	  <tr align='center'>
		<td width='30%' height='25' class="banner">倾覆方向</td>
		<td width='70%' height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapXqflxx.get("OVTUDR")%>米</font></td>        
  	  </tr>
	  <tr align='center'>
		<td height='25' class="banner">倾覆角度</td>
		<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapXqflxx.get("OVTUAG")%>度</font></td>        
  	  </tr>
<%
	}else if("D017".equals(xqfldm)){
%>
	  <tr align='center'>
		<td width='30%' height='25' class="banner">最大拉应力</td>
		<td width='70%' height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapXqflxx.get("MXTNST")%>牛/平方毫米</font></td>        
  	  </tr>
	  <tr align='center'>
		<td height='25' class="banner">最大压应力</td>
		<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapXqflxx.get("MXCMST")%>牛/平方毫米</font></td>        
  	  </tr>
  	  <tr align='center'>
		<td height='25' class="banner">混凝土标号</td>
		<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapXqflxx.get("CONGR")%></font></td>        
  	  </tr>
  	  <tr align='center'>
		<td height='25' class="banner">允许应力值</td>
		<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapXqflxx.get("ASTR")%>牛/平方毫米</font></td>        
  	  </tr>
<%
	}else if("D018".equals(xqfldm)){
%>
	  <tr align='center'>
		<td width='30%' height='25' class="banner">坍塌面积</td>
		<td width='70%' height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapXqflxx.get("SLIAR")%>平方米</font></td>        
  	  </tr>
	  <tr align='center'>
		<td height='25' class="banner">坍塌方量</td>
		<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapXqflxx.get("SLIMS")%>立方米</font></td>        
  	  </tr>
<%
	}else if("D019".equals(xqfldm)){
%>
	  <tr align='center'>
		<td width='30%' height='25' class="banner">堵塞物名称</td>
		<td width='70%' height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapXqflxx.get("PLTNM")%></font></td>        
  	  </tr>
	  <tr align='center'>
		<td height='25' class="banner">堵塞物体积</td>
		<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapXqflxx.get("PLTBU")%>立方米</font></td>        
  	  </tr>
<%
	}else if("D020".equals(xqfldm)){
%>
	  <tr align='center'>
		<td width='30%' height='25' class="banner">基础不均匀沉降</td>
		<td width='70%' height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapXqflxx.get("GRNUSB")%>米</font></td>        
  	  </tr>
	  <tr align='center'>
		<td height='25' class="banner">基础渗漏描述</td>
		<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapXqflxx.get("GRNSPDSC")%></font></td>        
  	  </tr>
  	  <tr align='center'>
		<td height='25' class="banner">基础超载破坏</td>
		<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapXqflxx.get("GROVCHWR")%></font></td>        
  	  </tr>
<%
	}else if("D021".equals(xqfldm)){
%>
	  <tr align='center'>
		<td width='30%' height='25' class="banner">底板掀起</td>
		<td width='70%' height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapXqflxx.get("APWR")%></font></td>        
  	  </tr>
	  <tr align='center'>
		<td height='25' class="banner">止水破坏</td>
		<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapXqflxx.get("WSTWR")%></font></td>        
  	  </tr>
<%
	}else if("D022".equals(xqfldm)){
%>
	  <tr align='center'>
		<td width='30%' height='25' class="banner">排水孔堵塞</td>
		<td width='70%' height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapXqflxx.get("WPPLU")%></font></td>        
  	  </tr>
	  <tr align='center'>
		<td height='25' class="banner">排水设备失灵</td>
		<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapXqflxx.get("WPEQML")%></font></td>        
  	  </tr>
<%
	}else if("D023".equals(xqfldm)){
%>
	  <tr align='center'>
		<td width='30%' height='25' class="banner">破坏面积</td>
		<td width='70%' height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapXqflxx.get("WRAR")%>米</font></td>        
  	  </tr>
	  <tr align='center'>
		<td height='25' class="banner">破坏方量</td>
		<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapXqflxx.get("WRMS")%>立方米</font></td>        
  	  </tr>
  	  <tr align='center'>
		<td height='25' class="banner">对衬砌造成的影响</td>
		<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapXqflxx.get("LNINF")%></font></td>        
  	  </tr>
  	  <tr align='center'>
		<td height='25' class="banner">洞身地质情况</td>
		<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapXqflxx.get("HBGLCN")%></font></td>        
  	  </tr>
<%
	}else if("D024".equals(xqfldm)){
%>
	  <tr align='center'>
		<td width='30%' height='25' class="banner">破坏面积</td>
		<td width='70%' height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapXqflxx.get("WRAR")%>米</font></td>        
  	  </tr>
	  <tr align='center'>
		<td height='25' class="banner">破坏深度</td>
		<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapXqflxx.get("WRD")%>米</font></td>        
  	  </tr>
  	  <tr align='center'>
		<td height='25' class="banner">破坏长度</td>
		<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapXqflxx.get("WRL")%>米</font></td>        
  	  </tr>
  	  <tr align='center'>
		<td height='25' class="banner">破坏地质情况</td>
		<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapXqflxx.get("WRGLCN")%></font></td>        
  	  </tr>
<%
	}else if("D025".equals(xqfldm)){
%>
	  <tr align='center'>
		<td width='30%' height='25' class="banner">冲毁体积</td>
		<td width='70%' height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapXqflxx.get("SCDMBU")%>立方米</font></td>        
  	  </tr>
	  <tr align='center'>
		<td height='25' class="banner">冲毁长度</td>
		<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapXqflxx.get("SCDML")%>米</font></td>        
  	  </tr>
  	   <tr align='center'>
		<td height='25' class="banner">冲毁深度</td>
		<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapXqflxx.get("SCDMD")%>米</font></td>        
  	  </tr>
  	  <tr align='center'>
		<td height='25' class="banner">冲毁处地质情况</td>
		<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapXqflxx.get("SCDMGLCN")%></font></td>        
  	  </tr>
<%
	}else if("D026".equals(xqfldm)){
%>
	  <tr align='center'>
		<td width='30%' height='25' class="banner">受灾人口</td>
		<td width='70%' height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapXqflxx.get("DSSPN")%>人</font></td>        
  	  </tr>
	  <tr align='center'>
		<td height='25' class="banner">受灾面积</td>
		<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapXqflxx.get("DSSAREA")%>平方米</font></td>        
  	  </tr>
  	   <tr align='center'>
		<td height='25' class="banner">死亡人口</td>
		<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapXqflxx.get("DTHPN")%>人</font></td>        
  	  </tr>
  	  <tr align='center'>
		<td height='25' class="banner">倒塌房屋</td>
		<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapXqflxx.get("WRHS")%>间</font></td>        
  	  </tr>
  	  <tr align='center'>
		<td height='25' class="banner">经济损失</td>
		<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapXqflxx.get("DRCECLS")%>万元</font></td>        
  	  </tr>
  	  <tr align='center'>
		<td height='25' class="banner">日最大降雨量</td>
		<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapXqflxx.get("DAYDP")%>毫米</font></td>        
  	  </tr>
  	  <tr align='center'>
		<td height='25' class="banner">时段最大降雨</td>
		<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapXqflxx.get("TDP")%>毫米</font></td>        
  	  </tr>
  	  <tr align='center'>
		<td height='25' class="banner">灾害类型</td>
		<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapXqflxx.get("DSSTP")%></font></td>        
  	  </tr>
<%
	}
%>
  	</table>
</td>
</tr>
<tr align='center'>        
	<td align='center' colspan="2"><br><br><input type='button' name='button' value='关  闭' onclick='self.close();' class='input1'></td>
  </tr>
</table>


</body>
</html>
