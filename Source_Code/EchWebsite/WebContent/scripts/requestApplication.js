	
    $(document).ready(function() {
    
    var requ=1;
    var sendtourl="GenRequest";
    
    $('input:radio[name="sWhat"]').change(
      function(){
      	if ($(this).is(':checked') && $(this).val() == 'Req') {requ=1;}
          else{requ=2;}
      });
    	
     $('#iButton').click(function() {
    
     var dest = $("#dest").val();
     var msg=$("#msgs").val();
     var sub=$("#subject").val(); 
      
     if(requ==1)
         sendtourl="GenRequest";
         else
        sendtourl="EmailServer";	
     
     $.ajax({
     url: sendtourl,	
     type: "post",
     data: {to:dest,sub:sub,msg:msg},
     cache: false,
     success: function(data) {
     $("#dest").val('');
     $("#subject").val('');
	 $("#msgs").val('');
     $("#returnMsg").html(data).slideDown();

     }
     });
     
     });
		
	 
    $('#accordion li').click(function() {
     $("#dest").val('');
     $("#subject").val('');
	 $("#msgs").val('');
	 $("#returnMsg").html("");
     });
     
     
});
   
