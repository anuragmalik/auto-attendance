function ManageTabPanelDisplay() {

var idlist = new Array('tab0focus','tab1focus','tab2focus','tab3focus','tab0ready','tab1ready','tab2ready','tab3ready','content0','content1','content2','content3');

if(arguments.length < 1) { return; }

for(var i = 0; i < idlist.length; i++) {
   var block = false;
   for(var ii = 0; ii < arguments.length; ii++) {
      if(idlist[i] == arguments[ii]) {
         block = true;
         break;
         }
      }
   if(block) { document.getElementById(idlist[i]).style.display = "block"; }
   else { document.getElementById(idlist[i]).style.display = "none"; }
   }
}


