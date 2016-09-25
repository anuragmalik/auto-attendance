
$(document).ready(function(){
	var requ=1;
    var trd;
    var subj;
	var subt;
	var trdt="";
    var tcode;
    $("#trade").change(function() {
    	  subj=$('option:selected', this).attr('id').trim();
    	  trd=$('option:selected', this).attr('value').trim();
    	});
    

	$("#testTrade").live('change',function() {
  	  subt=$('option:selected', this).attr('id').trim();
  	  trdt=$('option:selected', this).attr('value').trim();
  	});
	
	$("#resultCode").live('change',function() {
	  	  tcode=$('option:selected', this).attr('value').trim();
	  	});
    
    $('input:radio[name="shareWhat"]').change(
		      function(){
		      	if ($(this).is(':checked') && $(this).val() == 'link') {requ=1;}
		          else{requ=2;}
		      });
    
	$("#sData").live('click',function(){
		var top=$("#topic").attr('value').trim();
		var link=$("#link").attr('value').trim();
		var puid=$("#tuid").attr('value').trim();
		
		if(confirm("Share- "+requ+"\n Topic - "+top+" at link -\n"+link+"\n to trade "+trd+" related to subject "+subj+"\nConfirm ?")){
		$.ajax({
	        url: "ShareData",
	        type: "post",
	        data: {type:requ,tuid:puid,topic:top,link:link,trade:trd,sub:subj},
	        cache: false,
	        success: function(data) {
	        $("div.resShare").html(data);
	        }
	        });
		}
	});

	$("#testb").live('click',function(){
		var ttop=$("#testt").attr('value').trim();
		var tdate=$("#testDate").attr('value').trim();
		var tdesc=$("#testd").attr('value').trim();
		var puid=$("#tuid").attr('value').trim();
		
		if(confirm("Create test on Topic "+ttop+" for class "+trdt +" and subject "+subt+ " on date "+tdate)){
		$.ajax({
	        url: "CreateTest",
	        type: "post",
	        data: {topic:ttop,desc:tdesc,date:tdate,trade:trdt,subj:subt,prof:puid},
	        cache: false,
	        success: function(data) {
	        $("div.tRes").html(data);
	        }
	        });
		}
	});
	
	$("#resb").live('click',function(){
		var link=$("#resl").attr('value').trim();
		
		if(confirm("Submit results for test -"+tcode+"?")){
		$.ajax({
	        url: "StoreResult",
	        type: "post",
	        data: {tcode:tcode,link:link},
	        cache: false,
	        success: function(data) {
	        $("div.resmsg").html(data);
	        }
	        });
		}
	});
});