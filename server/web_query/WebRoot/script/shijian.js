var htmlstring;
var curdate=new Date();
var year,month,day,str1;
var i;
var stryear,strmonth,strday;
year=curdate.getYear();
year1=year-1;
year2=year-2;
month=curdate.getMonth();
month=month+1;
day=curdate.getDate();
day=day;
htmlstring="从"+"<select name='select_year_s' id='select_year_s' onChange='displayMonth(select_year_s)'>";
stryear=""
stryear=stryear+"<option value="+year+" selected>"+year+"</option>";
stryear=stryear+"<option value="+year1+">"+year1+"</option>";
stryear=stryear+"<option value="+year2+">"+year2+"</option>";
stryear=stryear+"</select>"
stryear=stryear+"年";
htmlstring=htmlstring+stryear;
htmlstring=htmlstring+"<select name='select_mon_s' id='select_mon_s' onChange='displayDay(select_mon_s)'>";
strmonth=""
for (i=1;i<10;i++)
{
	if (i==month)
	  str1="<option value=0"+i+" selected>0"+i+"</option>"
	else
	  str1="<option value=0"+i+">0"+i+"</option>";
	strmonth=strmonth+str1;
}
for (i=10;i<13;i++)
{
	if (i==month)
	  str1="<option value="+i+" selected>0"+i+"</option>"
	else
	  str1="<option value="+i+">"+i+"</option>";
	strmonth=strmonth+str1;
}
strmonth=strmonth+"</select>月";
htmlstring=htmlstring+strmonth;
htmlstring=htmlstring+"<select name='select_day_s' id='select_day_s'>";
for (i=1;i<10;i++)
	htmlstring=htmlstring+"<option value=0"+i+">0"+i+"</option>";
if (month==4 ||month==6 ||month==9 ||month==11){
	for (i=10;i<31;i++)
	  htmlstring=htmlstring+"<option value="+i+">"+i+"</option>";
}else if(month==2){
	if (year == 2004 ||year == 2008 ||year == 2000){
		for (i=10;i<30;i++)
		  htmlstring=htmlstring+"<option value="+i+">"+i+"</option>";
		
	}else{
		for (i=10;i<29;i++)
		  htmlstring=htmlstring+"<option value="+i+">"+i+"</option>";
	
	}
}else{
	for (i=10;i<32;i++)
	  htmlstring=htmlstring+"<option value="+i+">"+i+"</option>";

}
htmlstring=htmlstring+"</select>日";
htmlstring=htmlstring+"到"+"<select name='select_year_e' id='select_year_e' onChange='displayMonth(select_year_e)'>";
htmlstring=htmlstring+stryear;
htmlstring=htmlstring+"<select name='select_mon_e' id='select_mon_e'  onChange='displayDay(select_mon_e)'>";
htmlstring=htmlstring+strmonth;
htmlstring=htmlstring+"<select name='select_day_e' id='select_day_e'>";
str1="";
for (i=1;i<10;i++)
{
	if (i==day)
	  str1="<option value=0"+i+" selected>0"+i+"</option>"
	else
	  str1="<option value=0"+i+">0"+i+"</option>";
	htmlstring=htmlstring+str1;
}
str1="";
if (month==4 ||month==6 ||month==9 ||month==11){
	for (i=10;i<31;i++)
	{
		if (i==day)
		  str1="<option value="+i+" selected>"+i+"</option>"
		else
		  str1="<option value="+i+">"+i+"</option>";
		htmlstring=htmlstring+str1;
	}
}else if(month==2){
	if (year == 2004 ||year == 2008 ||year == 2000){
		for (i=10;i<30;i++)
		{
			if (i==day)
			  str1="<option value="+i+" selected>"+i+"</option>"
			else
			  str1="<option value="+i+">"+i+"</option>";
			htmlstring=htmlstring+str1;
		}
	}else{
		for (i=10;i<29;i++)
		{
			if (i==day)
			  str1="<option value="+i+" selected>"+i+"</option>"
			else
			  str1="<option value="+i+">"+i+"</option>";
			htmlstring=htmlstring+str1;
		}	
	}
}else{
	for (i=10;i<32;i++)
	{
		if (i==day)
		  str1="<option value="+i+" selected>"+i+"</option>"
		else
		  str1="<option value="+i+">"+i+"</option>";
		htmlstring=htmlstring+str1;
	}
}
htmlstring=htmlstring+"</select>日";
document.write(htmlstring);


///显示月份
function displayMonth(year_type) 
{
//
}

///显示日期
function displayDay(month_type) 
{
//	var objselect_mon_e=document.getElementById("select_mon_e");
//	objselect_mon_e.innerHtml = "<option value=1 selected>1000</option>";
//	alert("hello");	
}