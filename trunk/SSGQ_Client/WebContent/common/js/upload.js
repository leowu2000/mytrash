
var showmsbox =  function(msg1,msg2){
	var msgBox = Ext.MessageBox.show({
		 title: '�����ϴ�',
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
    	//  msgBox.updateText('�ᶯ��ʱ�䣺'+new Date().format('Y-m-d g:i:s A'));
    	//  },
    	//  interval:1000
      //});
};

function GetResult(){
	Ext.MessageBox.msg="����׼���ϴ�����...";
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
			Ext.MessageBox.updateText('����ѹ����ɣ�׼���ϴ���');
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
		Ext.MessageBox.updateText('����Զ�̷�����,��������...');
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
	if(confirm("���ϴ��ϴ��б��е��������ݣ���ȷ�ϣ�")){
		  showmsbox("����׼���ϴ�����...","ѹ��...");
		 
	}
}
