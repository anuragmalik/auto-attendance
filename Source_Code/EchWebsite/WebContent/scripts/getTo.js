var xmlHttp;
var url;
 function sendTo(str) {	 
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

if(document.getElementById("dest").value.length<2)
{document.getElementById("dispTo").innerHTML=" ";}
else
{
url="serveTo.jsp";
url += "?name=" +str;
xmlHttp.onreadystatechange = serveTo;
xmlHttp.open("GET", url, true);
xmlHttp.send();
}
}
 function serveTo(){   
 if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){ 
 document.getElementById("dispTo").innerHTML=xmlHttp.responseText;
 }   
 }   
