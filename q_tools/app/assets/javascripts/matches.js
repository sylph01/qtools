$(document).ready(function(){
	$("#player1_freeselect").hide();
	$("#player2_freeselect").hide();
	$("#player3_freeselect").hide();
	$("#player4_freeselect").hide();
	
	$("#match_player1_type").change(function(){
		if($("#match_player1_type").val() == "自由"){
			// activate
			$("#player1_freeselect").show();
		} else {
			// deactivate
			$("#player1_freeselect").hide();
		}
	});
	
	$("#match_player2_type").change(function(){
		if($("#match_player2_type").val() == "自由"){
			// activate
			$("#player2_freeselect").show();
		} else {
			// deactivate
			$("#player2_freeselect").hide();
		}
	});
	
	$("#match_player3_type").change(function(){
		if($("#match_player3_type").val() == "自由"){
			// activate
			$("#player3_freeselect").show();
		} else {
			// deactivate
			$("#player3_freeselect").hide();
		}
	});
	
	$("#match_player4_type").change(function(){
		if($("#match_player4_type").val() == "自由"){
			// activate
			$("#player4_freeselect").show();
		} else {
			// deactivate
			$("#player4_freeselect").hide();
		}
	});
});

function rotateImage(isRotated){
	if(isRotated){
		$("#match_image")
			.css("-moz-transform","rotateZ(180deg)")
			.css("-webkit-transform","rotateZ(180deg)")
			.css("-o-transform","rotateZ(180deg)")
			.css("-ms-transform","rotateZ(180deg)");
		$("#image_rotate_link").attr("onclick","rotateImage(false);return false;");
	} else {
		$("#match_image")
			.css("-moz-transform","")
			.css("-webkit-transform","")
			.css("-o-transform","")
			.css("-ms-transform","");
		$("#image_rotate_link").attr("onclick","rotateImage(true);return false;");
	}
}
