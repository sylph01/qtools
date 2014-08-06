$(document).ready(function(){
	$("#player1_freeselect").hide();
	$("#player2_freeselect").hide();
	$("#player3_freeselect").hide();
	$("#player4_freeselect").hide();
	
	$("#match_player1_type").change(changeType);
	$("#match_player2_type").change(changeType);
	$("#match_player3_type").change(changeType);
	$("#match_player4_type").change(changeType);
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
