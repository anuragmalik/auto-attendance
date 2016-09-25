  $(function() {
		    $("tr.data").find("p").hide();
		    $("td.slider").click(function(event) {
		         $("tr.data").find("p").slideUp();
		        event.stopPropagation();
		        var $target = $(event.target);
		        if ( $target.closest("td").attr("colspan") > 1 ) {
		            $target.slideUp();
		        } else {
		            $target.closest("tr").next().find("p").slideToggle();
		        }                    
		    });
		    
		    $("td.acc").click(function(event) {
		    	var str=$(this).parent().children('td.rcode').text();
		       if(confirm("Are your sure about accepting this request " +str))
		       { $.ajax({
		        url: "serveAccept.jsp",
		        type: "post",
		        data: {rcode:str},
		        cache: false,
		        success: function(data) {
		        alert(data);
		        }
		        });
		       } 
		    });
		    
		    $("td.rej").click(function(event) {
		    	var str=$(this).parent().children('td.rcode').text();
		       if(confirm("Are your sure about Rejecting this request " +str))
		       { $.ajax({
		        url: "serveReject.jsp",
		        type: "post",
		        data: {rcode:str},
		        cache: false,
		        success: function(data) {
		        alert(data);

		        }
		        });
		       }
		    });
		    
		    });
		
   
     
