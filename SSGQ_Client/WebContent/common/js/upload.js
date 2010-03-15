
var showmsbox =  function(msg1,msg2){
    Ext.MessageBox.show({
       title: '请等待',
       msg: msg1,
       progressText: msg2,
       width:300,
       progress:true,
       closable:false,
       animEl: 'mb6'
   });

   // this hideous block creates the bogus progress
   var f = function(v){
        return function(){
            if(v == 12){
                Ext.MessageBox.hide();
            }else{
                var i = v/11;
                Ext.MessageBox.updateProgress(i, Math.round(100*i)+'% completed');
            }
       };
   };
   for(var i = 1; i < 13; i++){
       setTimeout(f(i), i*500);
   }
};
function GetResult(){
	if(window.XMLHttpRequest){ //Mozilla
	    var xmlHttpReq=new XMLHttpRequest();
	  }else if(window.ActiveXObject){
	    var xmlHttpReq=new ActiveXObject("MSXML2.XMLHTTP.3.0");
	  }
	  xmlHttpReq.open("GET", "/UploadServlet?type=state", false);
	  xmlHttpReq.send(null);
	  var result = xmlHttpReq.responseText;
	  showmsbox(result,'复制数据');
}

function MyShow() 
{ 
	timer = window.setInterval("GetResult()",2000); 
	if(window.XMLHttpRequest){ //Mozilla
	    var xmlHttpReq=new XMLHttpRequest();
	  }else if(window.ActiveXObject){
	    var xmlHttpReq=new ActiveXObject("MSXML2.XMLHTTP.3.0");
	  }
	  xmlHttpReq.open("GET", "/UploadServlet?type=zip", false);
	  xmlHttpReq.send(null);
}