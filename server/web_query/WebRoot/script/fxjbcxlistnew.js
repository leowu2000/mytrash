//打开一个新窗口，输出符合条件的选择结果
function openWin(){


var i,totalSelected;
var myform=document.forms("selectform");
totalSelected=0;
var isArray=0;
for(i=0;i<myform.length;i++){
	   if(myform.elements[i].checked) totalSelected++;
	    isArray=1;
	}
if(!isArray){
	    alert("只有一个记录,不能进行筛选"); 
	    return(0);
	    }	
if (totalSelected==0) { 
	   alert("没有选择，请在复选框里选择需要的纪录");
	   return(0);
	  	}

var myBars='directories=no,location=no,menubr=no,status=yes';
  myBars+=',titlebar=no,toolbar=no';

var myOptions=',scrollbars=yes,width=600,height=480,resizeable=no" ';
var myFeatures=myBars+myOptions;
var newWin=open('',"", myFeatures);         

newWin.document.open();
var tempStr=
'<html>'+
'<head>'+
'<title>防汛简报查询结果</title>'+
'<meta http-equiv=\"Content-Type\" content=\"text/html; charset=gb2312\">'+
'<link rel=\"stylesheet\" href=\"../script/main.css\"><script language=\"javascript\">';
newWin.document.writeln(tempStr);	




newWin.document.writeln("var trArray=new Array("+totalSelected+");");
var selectID=0;

for(i=1;i<myform.length;) {
  if(myform.elements[i].checked) newWin.document.writeln('trArray['+(selectID++)+']=\"'+trArray[i-1]+'\";');
   i++;
  }


tempStr='<'+'/script><script src=\"../script/fxjbcxlistnew.js\">'+
'<'+'/script>'+
'<script language=\"javascript\" src=\"../script/openurl.js\">'+
'<'+'/script>'+
'</head>'+
'<body background=\"../image/bk.JPG\">';
newWin.document.writeln(tempStr);
tempStr='<form id=\"selectform\">'+
  '<table border=\"0\" cellspacing=\"1\" cellpadding=\"0\" width=\"100%\">'
newWin.document.writeln(tempStr);
tempStr='<tr bgcolor=\"#D6E0EA\"> '+
      '<td height=\"27\" colspan=\"7\"> '+
        '<div align=\"center\"><b><font color=\"#0000FF\" face=\"Verdana, Arial, Helvetica, sans-serif\" size=\"3\">查询结果（'+totalSelected+'） '+
          '<input type=\"button\" onClick=\"openWin();window.close();\" value=\"筛选结果\" class=\"white\" name=\"button\">'+
          '</font></b></div>'+
      '</td>';
newWin.document.writeln(tempStr);         
tempStr=  '</tr>'+
    '<tr bgcolor=\"#D6E0EA\"> '+
      '<td width=\"5%\" height=\"32\"> '+
        '<div align=\"center\"><font size=\"3\" ><b><font size=\"2\">筛选</font></b></font></div>'+
      '</td>';
newWin.document.writeln(tempStr);         
tempStr='<td width=\"12%\" height=\"32\"> '+
        '<div align=\"center\"><font size=\"3\" ><b><font size=\"2\">期数</font></b></font></div>'
      +'</td>';
newWin.document.writeln(tempStr);         

tempStr= '<td width=\"39%\" height=\"32\"> '+
        '<div align=\"center\"><font size=\"3\" color=\"#000066\"><b><font size=\"2\">上报时间</font></b></font></div>'+
      '</td>';
newWin.document.writeln(tempStr);         
tempStr='<td colspan=\"4\" height=\"32\" width=\"22%\"> '+
        '<div align=\"center\"><font color=\"#000066\"><b><font size=\"2\">填报单位</font></b></font></div>'+
      '</td>'+
    '</tr>';
newWin.document.writeln(tempStr);       
   
//循环列出选择结果

var bgColor=null;
var temp=null; 
temp=-1;
  
  
for(i=0;i<myform.length;i++) 
if(myform.elements[i].checked) {
	 temp=temp+1;
	 if ((temp % 2)==1)   bgColor="\'#D6E0EA\'";
       else bgColor="\'#B6C8D9\'";
		newWin.document.writeln("<tr bgcolor="+bgColor+">");
		newWin.document.writeln(trArray[i-1]);
		newWin.document.writeln("</tr>");
		}

newWin.document.writeln('</TABLE></form>'+
'</body></html>');
//close the stream to the document and bring the window to the front.
newWin.document.close();
newWin.focus();               
}

