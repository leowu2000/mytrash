/**
 * 变换查询图标  显示查询面板
 */
function changeimg(){
  var mytd = document.getElementById('mytd');
  if(mytd==null){
  	mytd = parent.lineFrame.document.getElementById('mytd');
  }
  mytd.innerHTML = "<a href='#' onClick='backimg();'><img src='images/up.gif' border='0' width='51' height='15'></a>";
  parent.mainFrame.document.getElementById('queryFrame').style.display='';
}

/**
 * 变换查询图标  隐藏查询面板
 */
function backimg(){
  var mytd = document.getElementById('mytd');
  if(mytd==null){
  	mytd = parent.lineFrame.document.getElementById('mytd');
  }
  mytd.innerHTML = "<a href='#' onClick='changeimg();'><img src='images/down.gif' border='0' width='51' height='15'></a>";
  parent.mainFrame.document.getElementById('queryFrame').style.display='none';
}

/**
 * 定义iframe高度
 * @param int qHeight 查询面板高度
 */
function IFrameResize(qHeight){
	document.getElementById("queryFrame").height = qHeight;
	document.getElementById("result").height = document.body.offsetHeight - qHeight - 30;
}

//初始化为0，为折叠状态
//点击后变为1，为展开状态
var changedflage;
changedflage = 0;

function setpath(pathw){
	
	myimgobj = parent.lineFrame.pathTable.document.getElementById("myimg");

	//alert("hello" + myimgobj.src);
	myimgobj.src = "images/transparent.gif";
	return true;
	
}
/////////

function setheight(frameheight){
	
	frameheightobj = parent.parent.lineFrame.pathTable.document.getElementById("frameheight");
	//alert("hello" + pathobj);
	frameheightobj.value = frameheight;
	return true;
	
}

///////////////

function changeheight(){
	
	//parent.mainFrame.rowsset.rows='1,*'
	fameheightobj = parent.mainFrame.document.getElementById("rowsset");
	//myimg = document.getElementById("myimg");
	//alert(myimg)
	//frameheight = Window.document.getElementById("frameheight");
	//alert("hello" + pathobj);
	if (changedflage == 1){
		fameheightobj.rows = "0,*";
		myimg.src="images/down.gif";
		changedflage = 0;
	}else if(changedflage == 0){
		fameheightobj.rows = frameheight.value + ",*";
		myimg.src="images/up.gif";
		changedflage = 1;
	}
	return true;
	
}

/////////////
function setinit(frameheight){
	
	myimgobj = parent.lineFrame.pathTable.document.getElementById("myimg");

	//alert("hello" + myimgobj.src);
	myimgobj.src = "images/down.gif";
	frameheightobj = parent.lineFrame.pathTable.document.getElementById("frameheight");
	frameheightobj.value = frameheight;
	//alert("hello" + frameheightobj.value);
	return true;
	
}

/////////////
function setpath2(pathw){
	
	pathobj = parent.parent.parent.lineFrame.pathTable.document.getElementById("path");
	//alert("hello" + pathobj);
	pathobj.innerHTML = " " + pathw + "";
	return true;
	
}
//////////
function checkin(checkinput){
	
	var input;
	var checkinputobj;
	var checkChar;
	//alert("hello");
	checkinputobj = document.getElementById(checkinput);
	input = checkinputobj.value;
	for(var i = 0; i<input.length; i++){

        	checkChar = input.charAt(i);
        	if (checkChar == "'") {
        		alert("输入框中有非法字符 ' ！");
        		checkinputobj.select();
        		checkinputobj.focus();
        		return false;
        		//break;	
        	}
        }
        return true;
}

/////////

    function print_window()
      {div1.style.visibility="hidden";
       window.print()       
      }
    function onbeforeprint()
      {
      div1.style.visibility="hidden";
      window.alert("打印工作就绪，开始打印!");
      history.go(-1);
      }
    function onafterprint()
      {
      div1.style.visibility="visible";
     
      }
///////////////////////////////////////////////////////////
