
$(document).ready( function(){
	var res="";
    $("td.result").live('click',function(){
	
	 var nid = $(this).attr('name');
	 $("#name").val(nid);
	 res=$(this).attr('id');
     $("#hUid").val(res);
     $.ajax({
     url: "ProfileFetch",
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

$("td.delete").live('click',function(){
	if(confirm("Click on OK to DELETE this User with UID = "+res.trim()+". \nAll data associated with this user will be deleted, along with his request and queries. Are you Sure? "))
    { 
     $("#prodisp").hide();
	 $.ajax({
     url: "DeleteUser",
     type: "post",
     data: {uid:res},
     cache: false,
     success: function(data) {
    	 alert(data);
     }
     });
    } 
	
});

$("td.updPro").live('click',function(){
		$("#updForm").submit();
		
});

});