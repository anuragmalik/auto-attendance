var mouse_is_inside = false;

$(document).ready(function() {
    $(".login_btn").click(function() {
        var loginBox = $(".login_box");
        if (loginBox.is(":visible"))
            loginBox.slideUp("slow");
        else
            loginBox.slideDown("slow");
        return false;
    });
    
    $(".login_box").hover(function(){ 
        mouse_is_inside=true; 
    }, function(){ 
        mouse_is_inside=false; 
    });

    $("body").click(function(){
        if(! mouse_is_inside) $(".login_box").slideUp("slow");
    });
});