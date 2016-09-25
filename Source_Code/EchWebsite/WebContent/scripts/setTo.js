 
$(document).ready( function(){
    
	$("#msg").hide();
	$("#dispTo").show();
	
	$("td.msg").live('click',function(){
	 var nidt = $(this).attr('name');
	 var uid=$(this).attr('id');
	 $("#dest").val(nidt);
	 $("#destid").val(uid);
	 $("#msg").slideDown();
	 $("#dispTo").slideUp();
	 });
       
        $("#dest").click(function(){
            $("#dest").val("");
            $("#dispTo").show();
            $("#msg").slideUp();
            });
   
});

