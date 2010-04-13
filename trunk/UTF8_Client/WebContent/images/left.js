 $(document).ready(function(){
	switchTo('2');	
    $("#menu .nav1 a ").bind("click", function(){ switchTo("1");});
    $("#menu .nav2 a ").bind("click", function(){ switchTo("2");});
    $("#menu .nav3 a ").bind("click", function(){ switchTo("3");}); 
    $("#menu .nav4 a ").bind("click", function(){ switchTo("4");}); 
    $("#menu .nav5 a ").bind("click", function(){ switchTo("5");}); 
    $("#menu .nav6 a ").bind("click", function(){ switchTo("6");}); 
    $("#menu .nav7 a ").bind("click", function(){ switchTo("7");}); 
    $("#menu .nav8 a ").bind("click", function(){ switchTo("8");}); 
    $("#menu .nav9 a ").bind("click", function(){ switchTo("9");}); 
  });
 		
var curSect = "";

function switchTo(which){
	//jQuery.easing.def = "easeInOutSine";
	if (which == curSect) { return; }  //don't switch if we are on the selected tab
	var navli="#menu-nav .nav"+which;
	var nava="#menu-nav .nav"+which+" a";
	var navspan="#menu-nav .nav"+which+" span";
	$("#menu-nav span").animate({opacity: '.75'}, { "duration": 200 } );	
	$("#menu-nav a").css("cursor", "pointer");		
	$(nava).css("cursor", "default");			
	$("#menu-nav .current").animate({top: (which-1)*36+"px"  }, { "duration": 200 } );
	$(navspan).animate({opacity: '1.0'}, { "duration": 200 } );
	curSect = which;
}
