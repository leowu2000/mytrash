
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
      //Ext.TaskMgr.start({
    	//  run:function(){
    	//  msgBox.updateText('会动的时间：'+new Date().format('Y-m-d g:i:s A'));
    	//  },
    	//  interval:1000
      //});
};

function GetResult(){
	Ext.MessageBox.msg="正在准备上传数据...";
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
			Ext.MessageBox.updateText('数据压缩完成，准备上传！');
	  	  },
	  	  interval:10
	    });
	  
	  setTimeout(function(){
		  connectResult();
	  }, 2000);
}
function connectResult(){
	Ext.TaskMgr.start({
  	  run:function(){
		Ext.MessageBox.updateText('连接远程服务器,发送数据...');
  	  },
  	  interval:10
	});
	if(window.XMLHttpRequest){ //Mozilla
	    var xmlHttpReq=new XMLHttpRequest();
	  }else if(window.ActiveXObject){
	    var xmlHttpReq=new ActiveXObject("MSXML2.XMLHTTP.3.0");
	  }
	  xmlHttpReq.open("GET", "/UploadServlet?type=connect", false);
	  xmlHttpReq.send(null);
	  var result = xmlHttpReq.responseText;
	  Ext.MessageBox.hide();
}
function MyShow() 
{ 
	if(confirm("将上传上传列表中的所有数据，请确认！")){
		  showmsbox("正在准备上传数据...","压缩...");
		 
	}
}
