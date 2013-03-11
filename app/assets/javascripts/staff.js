//alert("shrikant");
/*
$(document).ready(function(){
	//$("#uname").css("border","3px solid blue");

	
	$("uname").mouseover(function(){

	$("#uname").css("border","3px solid red");			

	});

	$("#submit").click(function(){	
		$("#uname").val("shrikant");
			
	});
	
	//alert("shrikant");
});

*/


/*
here we created following effects as
	date

$(document).ready(function(){
	
	//$("p").css("border", "1px solid red");
	$("p [id = 'uname']").css("border", "1px solid red");

	$(function() {
		$( "#datepicker" ).datepicker();
	});

});
*/
/*
$(document).ready(function(){
	
	$(function() {
		$( "#tabs" ).tabs();
	});

});*/

/*  here we created following effects as 

		1)accordian
		2)draggable
		3)show

$(document).ready(function(){
$(function() {
		$( "#accordion" ).accordion();
	});

$(function() {
		$( "#draggable" ).draggable();
	});


$(function() {
		// run the currently selected effect
		function runEffect() {
			// get effect type from 
			var selectedEffect = $( "#effectTypes" ).val();

			// most effect types need no options passed by default
			var options = {};
			// some effects have required parameters
			if ( selectedEffect === "scale" ) {
				options = { percent: 100 };
			} else if ( selectedEffect === "size" ) {
				options = { to: { width: 280, height: 185 } };
			}

			// run the effect
			$( "#effect" ).show( selectedEffect, options, 500, callback );
		};

		//callback function to bring a hidden box back
		function callback() {
			setTimeout(function() {
				$( "#effect:visible" ).removeAttr( "style" ).fadeOut();
			}, 1000 );
		};

		// set effect from select menu value
		$( "#button" ).click(function() {
			runEffect();
			return false;
		});

		$( "#effect" ).hide();
	});


});

*/

//alert("shrikant");

$(document).ready(function(){

//alert("shrikant");
$(function() {
		$( "#accordion" ).accordion();
	});
/*
$(function() {
		$( "#dates" ).datepicker();
	});

$(function() {
		$( "#dates" ).datepicker({
			showOn: "button",
			buttonImage: "D:/Shrikant/Ruby Projects/simple_blog/app/assets/imagesAMP Calendar.gif",
			buttonImageOnly: true
		});
	});
*/
$(function(){
	var pickerOpts = {
		showOn: "button",
		//buttonImage: "Calendar.png",
		buttonText: "Show Date"
	};	
	$("#dates").datepicker(pickerOpts);
});


});

