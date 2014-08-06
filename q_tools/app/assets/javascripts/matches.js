$(document).ready(function(){
	$("#player1_freeselect").hide();
	$("#player2_freeselect").hide();
	$("#player3_freeselect").hide();
	$("#player4_freeselect").hide();
	
	$("#match_player1_type").change(changeType).trigger("change");
	$("#match_player2_type").change(changeType).trigger("change");
	$("#match_player3_type").change(changeType).trigger("change");
	$("#match_player4_type").change(changeType).trigger("change");
});

function changeType() {
	var type = $(this);
	if (type.val() == "自由") {
		// activate
		type.next("span").show();
	} else {
		// deactivate
		type.next("span").hide();
	}
}

function rotateImage(isRotated){
	if(isRotated){
		$("#match_image").css({
			"-moz-transform": "rotateZ(180deg)",
			"-webkit-transform": "rotateZ(180deg)",
			"-o-transform": "rotateZ(180deg)",
			"-ms-transform": "rotateZ(180deg)"
		});
		$("#image_rotate_link").attr("onclick","rotateImage(false);return false;");
	} else {
		$("#match_image").css({
			"-moz-transform": "",
			"-webkit-transform": "",
			"-o-transform": "",
			"-ms-transform": ""
		});
		$("#image_rotate_link").attr("onclick","rotateImage(true);return false;");
	}
}
