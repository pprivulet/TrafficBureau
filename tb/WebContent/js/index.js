/*菜单选项卡*/
function changeNav(num){
	document.getElementById("d"+num).style.display = "block";
	for(var index = 1;index <= 3; index++){
		if(index !=num){
			document.getElementById("d"+index).style.display = "none";
		}
	}
}

		//树结构
		
	$(document).ready(function(){
		$(".switch1").click(function(){
			$("#appear1").toggle();
		});
	});
	//树结构
	$(document).ready(function(){
		$(".switch").click(function(){
			$(".appear").toggle();
		});
	});
	
	
	

var t;
var num=0;
function picChange(){																						//计时器功能
	num++;
	if(num>2){
		num=1;
		$("#pic-2").hide();
}
	$("#pic-"+num).animate({opacity:'show'}, "slow");	
	$("#pic-"+(num-1)).hide();
	t=setTimeout("picChange()",1000)
}

