<%@ page contentType="text/html;charset=GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 
<html xmlns="http://www.w3.org/1999/xhtml"> 
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=gb2312"> 
<title>Div+CSS+JS���Ͳ˵�����ˢ��</title> 
<meta name="description" content="http://www.livepo.com"> 
<style type="text/css"> 
<!-- 
*{margin:0;padding:0;border:0;} 
body { 
    font-family: arial, ����, serif; 
    font-size:12px; 
} 
#nav { 
    width:180px; 
    line-height: 24px;  
    list-style-type: none; 
    text-align:left; 
    /*��������ul�˵����иߺͱ���ɫ*/ 
} 

/*==================һ��Ŀ¼===================*/ 
#nav a { 
    width: 160px;  
    display: block; 
    padding-left:20px; 
    /*Width(һ��Ҫ)�����������Li�����*/ 
} 

#nav li { 
    background:#B3D8DE; /*һ��Ŀ¼�ı���ɫ*/ 
    border-bottom:#FFF 1px solid; /*�����һ���ױ�*/ 
    float:left; 
    /*float��left,����Ӧ�����ã���������Firefox����������ʾ 
    �̳�Nav��width,���ƿ��ȣ�li�Զ���������*/ 
} 

#nav li a:hover{ 
    background:#F45201;    /*һ��Ŀ¼onMouseOver��ʾ�ı���ɫ*/ 
} 

#nav a:link  { 
    color:#666; text-decoration:none; 
} 
#nav a:visited  { 
    color:#666;text-decoration:none; 
} 
#nav a:hover  { 
    color:#FFF;text-decoration:none;font-weight:bold; 
} 

/*==================����Ŀ¼===================*/ 
#nav li ul { 
    list-style:none; 
    text-align:left; 
} 
#nav li ul li{     
    background: #EBEBEB; /*����Ŀ¼�ı���ɫ*/ 
} 

#nav li ul a{ 
         padding-left:20px; 
         width:160px; 
    /* padding-left����Ŀ¼�����������ƶ�����Width������������=(�ܿ���-padding-left)*/ 
} 

/*�����Ƕ���Ŀ¼��������ʽ*/ 

#nav li ul a:link  { 
    color:#666; text-decoration:none; 
} 
#nav li ul a:visited  { 
    color:#666;text-decoration:none; 
} 
#nav li ul a:hover { 
    color:#F3F3F3; 
    text-decoration:none; 
    font-weight:normal; 
    background:#F45201; 
    /* ����onmouseover��������ɫ������ɫ*/ 
} 

/*==============================*/ 
#nav li:hover ul { 
    left: auto; 
} 
#nav li.sfhover ul { 
    left: auto; 
} 
#content { 
    clear: left;  
} 
#nav ul.collapsed { 
    display: none; 
} 
--> 

#PARENT{ 
    width:300px; 
    padding-left:0px; 
} 

</style> 
</head> 


<body  background="/images/0729left_bg.jpg"> 
<div id="PARENT"> 
<ul id="nav"> 
<li><a href="#Menu=ChildMenu1"  onclick="DoMenu('ChildMenu1')"><b>����ά��</b></a> 
    <ul id="ChildMenu1" class="collapsed"> 
    <li><a href="/project/prgManage.jsp" target="mainFrame">���̹���</a></li> 
    <li><a href="/project/gqxqManage.jsp" target="mainFrame">��������</a></li> 
    <li><a href="/project/gqyxManage.jsp" target="mainFrame">��������״̬</a></li> 
    </ul> 
</li> 
<li><a href="#Menu=ChildMenu2" onclick="DoMenu('ChildMenu2')"><b>�������</b></a> 
    <ul id="ChildMenu2" class="collapsed"> 
    <li><a href="/report/fxjbManage.jsp" target="mainFrame">��Ѵ��</a></li> 
    <li><a href="/report/TB_FPACTIManage.jsp" target="mainFrame">��Ѵ�ж�</a></li> 
    <li><a href="/report/TB_SDManage.jsp" target="mainFrame">���鱨��</a></li> 
    <li><a href="/report/TB_QTManage.jsp" target="mainFrame">������Ϣ</a></li> 
    </ul> 
</li> 
<li><a href="#Menu=ChildMenu3" onclick="DoMenu('ChildMenu3')"><b>�����ϴ�</b></a> 
    <ul id="ChildMenu3" class="collapsed"> 
    <li><a href="#">�����ϴ�</a></li> 
    </ul> 
</li> 
<li><a href="#Menu=ChildMenu4" onclick="DoMenu('ChildMenu4')"><b>ϵͳά��</b></a> 
    <ul id="ChildMenu4" class="collapsed"> 
    <li><a href="#">�������ݿ�</a></li> 
    <li><a href="#">�ָ����ݿ�</a></li> 
    <li><a href="#">ѹ�����ݿ�</a></li> 
    <li><a href="#">������ݿ�</a></li> 
    <li><a href="#">�鿴��־</a></li>
    <li><a href="#">��������</a></li>
    </ul> 
</li> 
</ul> 
</div> 

</body> 
</html> 
<script type=text/javascript> 
var LastLeftID = ""; 

function menuFix() { 
    var obj = document.getElementById("nav").getElementsByTagName("li"); 
     
    for (var i=0; i<obj.length; i++) { 
        obj[i].onmouseover=function() { 
            this.className+=(this.className.length>0? " ": "") + "sfhover"; 
        } 
        obj[i].onMouseDown=function() { 
            this.className+=(this.className.length>0? " ": "") + "sfhover"; 
        } 
        obj[i].onMouseUp=function() { 
            this.className+=(this.className.length>0? " ": "") + "sfhover"; 
        } 
        obj[i].onmouseout=function() { 
            this.className=this.className.replace(new RegExp("( ?|^)sfhover\\b"), ""); 
        } 
    } 
} 

function DoMenu(emid) 
{ 
    var obj = document.getElementById(emid);     
    obj.className = (obj.className.toLowerCase() == "expanded"?"collapsed":"expanded"); 
    if((LastLeftID!="")&&(emid!=LastLeftID))    //�ر���һ��Menu 
    { 
        document.getElementById(LastLeftID).className = "collapsed"; 
    } 
    LastLeftID = emid; 
} 

function GetMenuID() 
{ 

    var MenuID=""; 
    var _paramStr = new String(window.location.href); 

    var _sharpPos = _paramStr.indexOf("#"); 
     
    if (_sharpPos >= 0 && _sharpPos < _paramStr.length - 1) 
    { 
        _paramStr = _paramStr.substring(_sharpPos + 1, _paramStr.length); 
    } 
    else 
    { 
        _paramStr = ""; 
    } 
     
    if (_paramStr.length > 0) 
    { 
        var _paramArr = _paramStr.split("&"); 
        if (_paramArr.length>0) 
        { 
            var _paramKeyVal = _paramArr[0].split("="); 
            if (_paramKeyVal.length>0) 
            { 
                MenuID = _paramKeyVal[1]; 
            } 
        } 
        /* 
        if (_paramArr.length>0) 
        { 
            var _arr = new Array(_paramArr.length); 
        } 
         
        //ȡ����#����ģ��˵�ֻ���õ�Menu 
        //for (var i = 0; i < _paramArr.length; i++) 
        { 
            var _paramKeyVal = _paramArr[i].split('='); 
             
            if (_paramKeyVal.length>0) 
            { 
                _arr[_paramKeyVal[0]] = _paramKeyVal[1]; 
            }         
        } 
        */ 
    } 
     
    if(MenuID!="") 
    { 
        DoMenu(MenuID) 
    } 
} 

GetMenuID();    //*������function��˳��Ҫע��һ�£���Ȼ��Firefox��GetMenuID()����Ч�� 
menuFix(); 
</script>