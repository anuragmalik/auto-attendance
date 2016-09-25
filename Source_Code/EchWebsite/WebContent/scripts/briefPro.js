 
$(document).ready( function(){
    $("td.result").live('click',function(){
	
	 var nid = $(this).attr('name');
	 $("#name").val(nid);
	 var res=$(this).attr('id');
     
     $.ajax({
     url: "BriefProfile",
     type: "post",
     data: {uid:res},
     cache: false,
     success: function(data) {
    	 $("#disp").hide();
    	 $("#prodisp").html(data).slideDown();}
     });
});

$("#name").live('click',function(){
	$("#name").val(""); 
	$("#prodisp").slideUp();
	 $("#disp").slideDown();
});

});