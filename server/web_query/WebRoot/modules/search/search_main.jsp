<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<html>
<head>
<title>�ޱ����ĵ�</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<script src="../../script/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
<script language="javascript" src="../../script/optionclick.js">
</script>
<script language="javascript" src="../../script/common.js"></script>
<script language="javascript" src="../../script/lysxtop.js">
</script>
<link rel="stylesheet" href="../../css/main.css" type="text/css">
</head>

<body topmargin="3" >
<form name="fxxq" method="post" action="/search.do?action=main" target="result">
  <div id="query" > 
    <table width="98%" border="0" align="left" cellpadding="2" cellspacing="1" bgcolor="#336699">
      <!--DWLayoutTable-->
      <tr align="center"> 
        <td bgcolor="#336699"><font color="#FFFFFF"><strong>��Ϣ����</strong></font></td>
        <td align="left" bgcolor="#FFFFFF"> <select name="select_sortinfo" id=select_sortinfo size="1" >
            <option value="qbxx" selected>ȫ����Ϣ</option>
            <OPTION 
        value="yxzt">����״̬</OPTION>
            <OPTION value="xqxx">����</OPTION>
            <OPTION 
        value="fxjb">��Ѵ��</OPTION>
            <OPTION value="fxxd">��Ѵ�ж�</OPTION>
            <OPTION 
        value="zqbg">���鱨��</OPTION>
            <OPTION value="hqbg">���鱨��</OPTION>
          </select> 
          <!--input type="checkbox" name="checkbox_media" value="true"-->
        </td>
        <td bgcolor="#336699"><font color="#FFFFFF"><strong>�������</strong></font></td>
        <td align="left" bgcolor="#FFFFFF"> <select name="select_sort" size="1" >
            <option value="0" selected>ȫ����Ϣ</option>
            <option value="b" >ˮ��</option>
            <option value="d" >�̷�</option>
            <option value="e" >����</option>
            <option value="f" >���ͺ���</option>
            <option value="h" >����</option>
            <option value="k" >ˮբ</option>
            <option value="n" >�κӹ���</option>
            <option value="p" >���̽�����</option>
          </select> </td>
        <td rowspan="5" bgcolor="#FFFFFF"> <input id=submit_query name=submit_query type=submit value=��ѯ class="input1"> 
        </td>
      </tr>
      <tr > 
        <td bgcolor="#336699" align="center"><font color="#FFFFFF"><strong>��������</strong></font></td>
        <td colspan="3" bgcolor="#FFFFFF" align="left"> <div  name='xzqu_table'> 
            <script language="JavaScript" src="../../script/xzqh.js"></script>
          </div></td>
      </tr>
      <tr align="center"> 
        <td bgcolor="#336699"><font color="#FFFFFF"><strong>����ˮϵ</strong></font></td>
        <td colspan="3" bgcolor="#FFFFFF" align="left"> <script language="JavaScript" src="../../script/lysx.js"></script> 
        </td>
      </tr>
      <tr align="center"> 
        <td bgcolor="#336699"><font color="#FFFFFF"><strong>�ϱ�ʱ��</strong></font></td>
        <td colspan="3" align="left" bgcolor="#FFFFFF">
			��<input type="text" id="date_start" name="date_start" style="width:80;" onClick="WdatePicker({position:{top:0},readOnly:true})">��
			<input type="text" id="date_end" name="date_end" style="width:80;" onClick="WdatePicker({position:{top:0},readOnly:true})">
		</td>
      </tr>
      <tr align="center"> 
        <td bgcolor="#336699"><font color="#FFFFFF"><strong>�ؼ���</strong></font></td>
        <td colspan="3" align="left" bgcolor="#FFFFFF"> <input name="text_fill"  class="input2" > 
          <input type="checkbox" name="check_projectname" value="true">
          �������� 
          <input type="checkbox" name="check_unit" value="true">
          ���λ 
          <input type="checkbox" name="check_title" value="true">
          ��Ϣ����</td>
      </tr>
    </table>
  </div>
</form>


</body>
</html>
