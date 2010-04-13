function checkNan(obj,name){
	if(obj.value!=""){
		if(isNaN(obj.value)){
			alert(name+"只接受数字，请重新填写");
			obj.value="";
			return false;
		}
	}
}
function checkNumber(obj,name){
	if(obj.value!=""){
		if(isNaN(obj.value)){
			alert(name+"只接受整数，请重新填写");
			obj.value="";
			return false;
		}else{
			if(obj.value.indexOf('.')>0){
				alert(name+"只接受整数，请重新填写");
				obj.value="";
				return false;
			}
		}
	}
}