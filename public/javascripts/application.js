// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults


// Function to observe the reply window and change the number of characters left
Event.observe(window, 'load', function() {
     try{
        if($$('seite_twitter')!=null){   
  Event.observe('user_reply_text', 'keyup', function(event){
      var maxLen = 140;
      var left = maxLen - this.getValue().length;
      $('char-count').update(left);
        // Funktion to load button
        //var replytxt = maxLen- Form.Element.getValue('user_leader_text').length;
    if (left < 136) {
    Effect.Appear('reply_button_change')
    }
    else if (left > 136) {
    document.getElementById('reply_button_change').style.display='none';
    };
  });


// Function to observe the reply window and change the number of characters left

  Event.observe('user_reply_text2', 'keyup', function(event){
      var maxLen = 140;
      var left = maxLen - this.getValue().length;
      $('char-count2').update(left);
        // Funktion to load button
         if (left < 136) {
    Effect.Appear('reply_button_change2')
    }
    else if (left > 136) {
    document.getElementById('reply_button_change2').style.display='none';
    };
  });




// Function to observe the reply window and change the number of characters left
  Event.observe('user_tweet_text_n', 'keyup', function(event){
      var maxLen = 140;
      var left = maxLen - this.getValue().length;
      $('char-countt').update(left);
      // Funktion to load button
          if (left < 140) {
    Effect.Appear('tweet_button_change')
    }
    else if (left > 139) {
    document.getElementById('tweet_button_change').style.display='none';
    };
  });


// Function to observe the reply window and change the number of characters left


    try{
        if($('compose_tweet_field').style.display !='none'){
              Event.observe('user_tweet_text', 'keyup', function(event){
      var maxLen = 140;
      var left = maxLen - this.getValue().length;
      $('char-countc').update(left);
      // Funktion to load button
          if (left < 140) {
    Effect.Appear('tweet_button_change_compose')
    }
    else if (left > 139) {
    document.getElementById('tweet_button_change_compose').style.display='none';
    };
  });
    document.observe('click', function(e, el) {
            if ( ! e.target.descendantOf('compose_tweet_field')) {
                document.getElementById('compose_tweet_seite').style.display='none';
                document.getElementById('follower_compose_seite').style.display='none';
            }
           });
    };}
    catch(ex){}






//Search: Press Enter to submit

    Event.observe('user_search', 'keypress', function(event){
    if(event.keyCode == Event.KEY_RETURN) {
        // do something useful
        alert('Thank you very much for your search request. Unfortunately this simulation can not respond to your search request.');
        // stop processing the event
        Event.stop(event);
        document.getElementById('search').style.display='none';
    }
    });};
    }
    catch(ex){}
    });

//Mousetracking
window.onload = init;
var user_mouse = new Array();
var delta = 0;
var old_delta = 0;
var time_new = 0; 
var time_old = 0; 

function init() {
		if ($('seite_twitter').Event) {
	          $('seite_twitter').captureEvents(Event.MOUSEMOVE);
		}
	 	time_new = new Date().getTime();
   	time_old = new Date().getTime();
	 	$('seite_twitter').onmousemove = getCursorXY;
}

function getCursorXY(e) {
  time_new = new Date().getTime();
  delta = time_new - time_old
  
  var cursorX = (window.Event) ? e.pageX : event.clientX + (document.documentElement.scrollLeft ? document.documentElement.scrollLeft : document.body.scrollLeft);
  var cursorY = (window.Event) ? e.pageY : event.clientY + (document.documentElement.scrollTop ? document.documentElement.scrollTop : document.body.scrollTop);

  user_mouse.push(new Array(cursorX,cursorY,old_delta)); 
 	$('user_mousetracks').value = user_mouse.join(";");
 
  time_old = time_new
  old_delta = delta
}

function flipTable(element_name) 
    {        
        $("user_"+element_name+"_website_4").checked = true;
        $("user_"+element_name+"_sn_4").checked = true;
        $("user_"+element_name+"_mb_4").checked = true;
        $("user_"+element_name+"_rss_4").checked = true;
        $("user_"+element_name+"_newsletter_4").checked = true;
        $("user_"+element_name+"_4").checked = true;
        if ( $(element_name+"_online0").style.display != 'none' ){
            $(element_name+"_online0").style.display = 'none';
            $(element_name+"_online1").style.display = 'none';
            $(element_name+"_online2").style.display = 'none';
            $(element_name+"_online3").style.display = 'none';
            $(element_name+"_online4").style.display = 'none';
            $(element_name+"_online5").style.display = 'none';
            $(element_name+"_online_flip").update("Show");
        }
        else {
            $(element_name+"_online0").style.display = '';
            $(element_name+"_online1").style.display = '';
            $(element_name+"_online2").style.display = '';
            $(element_name+"_online3").style.display = '';
            $(element_name+"_online4").style.display = '';
            $(element_name+"_online5").style.display = '';
            $(element_name+"_online_flip").update("Set all values in section to 'not important' and hide");
        }
        return false;
    }
function flipTable2(element_name) 
    {        
        $("user_"+element_name+"_email_4").checked = true;
        $("user_"+element_name+"_sn_4").checked = true;
        $("user_"+element_name+"_mb_4").checked = true;
        $("user_"+element_name+"_forum_4").checked = true;
        $("user_"+element_name+"_chat_4").checked = true;
        $("user_"+element_name+"_phone_4").checked = true;
        $("user_"+element_name+"_4").checked = true;
        if ( $(element_name+"_online0").style.display != 'none' ){
            $(element_name+"_online0").style.display = 'none';
            $(element_name+"_online1").style.display = 'none';
            $(element_name+"_online2").style.display = 'none';
            $(element_name+"_online3").style.display = 'none';
            $(element_name+"_online4").style.display = 'none';
            $(element_name+"_online5").style.display = 'none';
            $(element_name+"_online6").style.display = 'none';
            $(element_name+"_scale").style.display = 'none';
            $(element_name+"_online_flip").update("Show");
        }
        else {
            $(element_name+"_online0").style.display = '';
            $(element_name+"_online1").style.display = '';
            $(element_name+"_online2").style.display = '';
            $(element_name+"_online3").style.display = '';
            $(element_name+"_online4").style.display = '';
            $(element_name+"_online5").style.display = '';
            $(element_name+"_online6").style.display = '';
            $(element_name+"_scale").style.display = '';
            $(element_name+"_online_flip").update("Set all values in section to 'not important' and hide");
        }
        return false;
    }

