
function checkall(){
	
	var input;
	var checkinputobj;
	var checkChar;
	//alert("hello");
	text_titleobj = document.getElementById("text_title");
	text_fillobj = document.getElementById("text_fill");
	
	input1 = text_titleobj.value;
	input2 = text_fillobj.value;
	
	for(var i = 0; i<input1.length; i++){
        	checkChar = input1.charAt(i);
        	if (checkChar == "'") {
        		alert("输入框中有非法字符 ' ！");
        		text_titleobj.select();
        		text_titleobj.focus();
        		return false;
        		//break;	
        	}
        }
	for(var i = 0; i<input2.length; i++){
        	checkChar = input2.charAt(i);
        	if (checkChar == "'") {
        		alert("输入框中有非法字符 ' ！");
        		text_fillobj.select();
        		text_fillobj.focus();
        		return false;
        		//break;	
        	}
        }
        return true;	
}