var popup = null;

function openUrl(cxUrl,width,height,top){
	
var gt = unescape('%3e'); 
//var popup = null; 
//alert(cxUrl);
 var datetime=(new Date()).getTime();	   
 var left=0;
 if(top==null) {top=0;
 		left=0;
 	}
if(width==800 && height==550){
 	top=left=0;
 	width=screen.availWidth;
 	height=screen.availHeight;
 	} 	
 
 var myBars='directories=no,location=no,menubr=no,status=yes';
     myBars+=',titlebar=no,toolbar=no';
 var myOptions=' ,scrollbars=yes,width='+width+',height='+height+',resizeable=no ';
//     myOptions+=' ,top=' +top+' ,left='+left;
     myOptions+=' ,top=0,left='+left;
 var myFeatures=myBars+myOptions;
popup = window.open('',datetime, myFeatures);         
if (popup != null) { 
  if (popup.opener == null) { 
		popup.opener = self; 
	} 
   popup.location.href = cxUrl;
} 
 
 


}


function closeUrl(cxUrl){

	//cxUrl = document.location.href + "/" + cxUrl
	//alert(cxUrl);	
	//if  (popup.location.href == cxUrl) {
	popup.close();
	
		
	//	}
	
}

function setinfo(){
	alert(document.button_detail.value);
	document.button_detail.value="hello";
	
}