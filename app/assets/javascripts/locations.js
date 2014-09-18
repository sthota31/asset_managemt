// A $( document ).ready() block.
$( document ).ready(function() {

	if($("input[type='radio'].radio_button_class").is(':checked')) {
    var location_type = $("input[type='radio'].radio_button_class:checked").val();
     if(location_type == "cabin"){
       $("#employee_id").css("display", "block");
    }

}

$(".radio_button_class") 
    .change(function(){ 
        if( $(this).is(":checked") ){ 
            var location_type = $(this).val(); 
        if(location_type == "cabin"){
          
       $("#employee_id").css("display", "block");

    }else{
    	$("#employee_id").css("display", "none");
    }
        }
    });   


})