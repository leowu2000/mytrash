/*********************************************************************
*  功能概述：响应鼠标事件，显示文档信息
*  新建时间：未知
*  作者：    诒名
*  修改履历：整理方法display()和hide()，添加注释			2003/03/12	liubo
*
*
**********************************************************************
*/

function display(str1,str2,str3,str4,str5,str6,str7,str8,str9) 
{ 
	document.all.Layer10.style.display=""; 
	//lable1.innerHTML=str1; 
	lable2.innerHTML=str2; 
	lable3.innerHTML=str4; 
	lable4.innerHTML=str3; 
	//lable5.innerHTML=str5; 
	//lable6.innerHTML=str6; 
	//lable7.innerHTML=str7; 
	document.all.Layer10.style.posLeft=str8+document.body.scrollLeft; 
	document.all.Layer10.style.posTop=str9+document.body.scrollTop;
}
 
/*********************************************************************
*
*
*
*
*
*
**********************************************************************
*/
function hide() { 
	document.all.Layer10.style.display="none"; 
} 

//////////////
function display2(str21,str22,str23,str24,str25,str26,str27,str28,str29,str30,str31,str32,str33,str34,str35,str36) 
{ 
	document.all.Layer11.style.display=""; 
	lable21.innerHTML=str21; 
	lable22.innerHTML=str22; 
	lable23.innerHTML=str23;
	str24 = str24 + " 人"; 
	lable24.innerHTML=str24; 
	str25 = str25 + " 人"; 
	lable25.innerHTML=str25; 
	str26 = str26 + " 人"; 
	lable26.innerHTML=str26; 
	lable27.innerHTML=str27; 
	lable28.innerHTML=str28; 
	lable29.innerHTML=str29; 
	lable30.innerHTML=str30; 
	str31 = str31 + " 米"
	lable31.innerHTML=str31;
	lable32.innerHTML=str32; 
	lable33.innerHTML=str33; 
	lable34.innerHTML=str34; 
	//
	str35 = str35-120;
	str36 = str36+20;
	document.all.Layer11.style.posLeft=str35+document.body.scrollLeft; 
	document.all.Layer11.style.posTop=str36+document.body.scrollTop;
}
 
/*********************************************************************
*
*
*
*
*
*
**********************************************************************
*/
function hide2() { 
	document.all.Layer11.style.display="none"; 
} 