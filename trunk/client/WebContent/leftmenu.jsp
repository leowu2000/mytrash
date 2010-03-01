<%@ page contentType="text/html;charset=GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 
<html xmlns="http://www.w3.org/1999/xhtml"> 
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=gb2312"> 
<title>Div+CSS+JS树型菜单，可刷新</title> 
<meta name="description" content="http://www.livepo.com"> 
<style type="text/css"> 
<!-- 
*{margin:0;padding:0;border:0;} 
body { 
    font-family: arial, 宋体, serif; 
    font-size:12px; 
} 
#nav { 
    width:180px; 
    line-height: 24px;  
    list-style-type: none; 
    text-align:left; 
    /*定义整个ul菜单的行高和背景色*/ 
} 

/*==================一级目录===================*/ 
#nav a { 
    width: 160px;  
    display: block; 
    padding-left:20px; 
    /*Width(一定要)，否则下面的Li会变形*/ 
} 

#nav li { 
    background:#B3D8DE; /*一级目录的背景色*/ 
    border-bottom:#FFF 1px solid; /*下面的一条白边*/ 
    float:left; 
    /*float：left,本不应该设置，但由于在Firefox不能正常显示 
    继承Nav的width,限制宽度，li自动向下延伸*/ 
} 

#nav li a:hover{ 
    background:#F45201;    /*一级目录onMouseOver显示的背景色*/ 
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

/*==================二级目录===================*/ 
#nav li ul { 
    list-style:none; 
    text-align:left; 
} 
#nav li ul li{     
    background: #EBEBEB; /*二级目录的背景色*/ 
} 

#nav li ul a{ 
         padding-left:20px; 
         width:160px; 
    /* padding-left二级目录中文字向右移动，但Width必须重新设置=(总宽度-padding-left)*/ 
} 

/*下面是二级目录的链接样式*/ 

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
    /* 二级onmouseover的字体颜色、背景色*/ 
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
<li><a href="#Menu=ChildMenu1"  onclick="DoMenu('ChildMenu1')"><b>数据维护</b></a> 
    <ul id="ChildMenu1" class="collapsed"> 
    <li><a href="/project/prgManage.jsp" target="mainFrame">工程管理</a></li> 
    <li><a href="/project/gqxqManage.jsp" target="mainFrame">工程险情</a></li> 
    <li><a href="/project/gqyxManage.jsp" target="mainFrame">工程运行状态</a></li> 
    </ul> 
</li> 
<li><a href="#Menu=ChildMenu2" onclick="DoMenu('ChildMenu2')"><b>报告管理</b></a> 
    <ul id="ChildMenu2" class="collapsed"> 
    <li><a href="/report/fxjbManage.jsp" target="mainFrame">防汛简报</a></li> 
    <li><a href="/report/TB_FPACTIManage.jsp" target="mainFrame">防汛行动</a></li> 
    <li><a href="/report/TB_SDManage.jsp" target="mainFrame">灾情报告</a></li> 
    <li><a href="/report/TB_QTManage.jsp" target="mainFrame">旱情信息</a></li> 
    </ul> 
</li> 
<li><a href="#Menu=ChildMenu3" onclick="DoMenu('ChildMenu3')"><b>数据上传</b></a> 
    <ul id="ChildMenu3" class="collapsed"> 
    <li><a href="/sys/uploadManage.jsp" target="mainFrame">数据上传</a></li> 
    </ul> 
</li> 
<li><a href="#Menu=ChildMenu4" onclick="DoMenu('ChildMenu4')"><b>系统维护</b></a> 
    <ul id="ChildMenu4" class="collapsed"> 
    <li><a href="#">备份数据库</a></li> 
    <li><a href="#">恢复数据库</a></li> 
    <li><a href="#">压缩数据库</a></li> 
    <li><a href="#">清空数据库</a></li> 
    <li><a href="#">查看日志</a></li>
    <li><a href="/sys/config.jsp" target="mainFrame">参数设置</a></li>
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
    if((LastLeftID!="")&&(emid!=LastLeftID))    //关闭上一个Menu 
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
         
        //取所有#后面的，菜单只需用到Menu 
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

GetMenuID();    //*这两个function的顺序要注意一下，不然在Firefox里GetMenuID()不起效果 
menuFix(); 
</script>
