var xmlHttp;
var url;
var name=1;


$(document).ready( function(){
	$('input:radio[name="what"]').change(
		    function(){
		        if ($(this).is(':checked') && $(this).val() == 'Name') {
		            name=1;
		        }
		        else
		        	{name=0;}
		    });
});

 function showState(str) {	 
	 if (typeof XMLHttpRequest != "undefined"){
     xmlHttp= new XMLHttpRequest();
      }
       else if (window.ActiveXObject){
   xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");
       }
if (xmlHttp==null){
alert ("Browser does not support XMLHTTP Request")
return
} 

if(document.getElementById("name").value.length<2)
{document.getElementById("disp").innerHTML="Enter Name/UID";}
else
{
url="ReplySearch";
url += "?data=" +str+"&what="+name;
xmlHttp.onreadystatechange = stateChange;
xmlHttp.open("POST", url, true);
xmlHttp.send();
}
}
 function stateChange(){   
 if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){ 
 document.getElementById("disp").innerHTML=xmlHttp.responseText;  
 }   
 }   
