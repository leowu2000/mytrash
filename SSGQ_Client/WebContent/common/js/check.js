function checkNan(obj,name){
	if(obj.value!=""){
		if(isNaN(obj.value)){
			alert(name+"ֻ�������֣���������д");
			obj.value="";
			return false;
		}
	}
}
function checkNumber(obj,name){
	if(obj.value!=""){
		if(isNaN(obj.value)){
			alert(name+"ֻ������������������д");
			obj.value="";
			return false;
		}else{
			if(obj.value.indexOf('.')>0){
				alert(name+"ֻ������������������д");
				obj.value="";
				return false;
			}
		}
	}
}