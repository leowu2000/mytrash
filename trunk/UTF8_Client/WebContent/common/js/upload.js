
var showmsbox =  function(msg1,msg2){
	var msgBox = Ext.MessageBox.show({
		 title: '数据上传',
         msg: msg1,
         progressText: msg2,
         width:300,
         modal:true,
         wait:true,
         waitConfig: {interval:200},
         icon:'ext-mb-download' //custom class in msg-box.html
         //animEl: 'mb7'
     });
      setTimeout(function(){
    	  GetResult();
      }, 8000);
};

function GetResult(){
	Ext.TaskMgr.start({
	  	  run:function(){
			Ext.MessageBox.updateText('正在压缩数据，请等待....');
	  	  },
	  	  interval:100
	    });
	if(window.XMLHttpRequest){ //Mozilla
	    var xmlHttpReq=new XMLHttpRequest();
	  }else if(window.ActiveXObject){
	    var xmlHttpReq=new ActiveXObject("MSXML2.XMLHTTP.3.0");
	  }
	  xmlHttpReq.open("GET", "/UploadServlet?type=zip", false);
	  xmlHttpReq.send(null);
	  var result = xmlHttpReq.responseText;
	  
		Ext.TaskMgr.start({
	  	  run:function(){
			Ext.MessageBox.updateText('数据压缩完成，准备上传....');
	  	  },
	  	  interval:100
	    });
		Ext.TaskMgr.start({
		  	  run:function(){
				Ext.MessageBox.updateText('正在连接远程服务器,请等待...');
		  	  },
		  	  interval:100
			});
	  setTimeout(function(){
		  uploadData();
	  }, 2000);
}
function uploadData(){
	if(window.XMLHttpRequest){ //Mozilla
	    var xmlHttpReq=new XMLHttpRequest();
	  }else if(window.ActiveXObject){
	    var xmlHttpReq=new ActiveXObject("MSXML2.XMLHTTP.3.0");
	  }
	  xmlHttpReq.open("GET", "/UploadServlet?type=connect", false);
	  xmlHttpReq.send(null);
	  var result = xmlHttpReq.responseText;
	  Ext.MessageBox.hide();
	  //alert(result);
	  if(result=="0"){
		  alert('远程服务器连接失败，请确认配置参数，并保证网络连通。');
	  }else{
		  alert('数据已经成功上传至服务器!');
	  }  
}
function MyShow() 
{ 
	if(confirm("将上传上传列表中的所有数据，请确认！")){
		  showmsbox("正在准备上传数据...","压缩...");
		 
	}
}
