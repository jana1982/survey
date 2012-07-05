// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults


// Function to observe the reply window and change the number of characters left
Event.observe(window, 'load', function() {
  Event.observe('user_reply_text', 'keyup', function(event){
      var maxLen = 140;
      var left = maxLen - this.getValue().length;
      $('char-count').update(left);
  });
});

// Function to observe the reply window and change the number of characters left
Event.observe(window, 'load', function() {
  Event.observe('user_reply_text2', 'keyup', function(event){
      var maxLen = 140;
      var left = maxLen - this.getValue().length;
      $('char-count2').update(left);
  });
});
// Function to observe the reply_at window and change the number of characters left
Event.observe(window, 'load', function() {
  Event.observe('user_reply_text_at', 'keyup', function(event){
      var maxLen = 140;
      var left = maxLen - this.getValue().length;
      $('char-counta').update(left);
  });
});

// Funktion to load button
Event.observe(window, 'load', function() {
  Event.observe('user_reply_text', 'keyup', function(event){
      var maxLen = 140;
      var left = maxLen - this.getValue().length;
      //var replytxt = maxLen- Form.Element.getValue('user_leader_text').length;
    if (left < 136) {
    Effect.Appear('reply_button_change')
    }
    else if (left > 136) {
    document.getElementById('reply_button_change').style.display='none';
    };
    });
});

Event.observe(window, 'load', function() {
  Event.observe('user_reply_text2', 'keyup', function(event){
      var maxLen = 140;
      var left = maxLen - this.getValue().length;
      //var replytxt = maxLen- Form.Element.getValue('user_leader_text').length;
    if (left < 136) {
    Effect.Appear('reply_button_change2')
    }
    else if (left > 136) {
    document.getElementById('reply_button_change2').style.display='none';
    };
    });
});
////Funktion to load button_at
//Event.observe(window, 'load', function() {
//  Event.observe('user_reply_text_at', 'keyup', function(event){
//      var maxLen = 140;
//      var left = maxLen - this.getValue().length;
//      var replytxt = maxLen- Form.Element.getValue('user_leader_text').length;
//    if (left < 136) {
//    Effect.Appear('reply_button_change_at')
//    }
//    else if (left > 136) {
//    document.getElementById('reply_button_change_at').style.display='none';
//    };
//    });
//});

// Function to observe the reply window and change the number of characters left
Event.observe(window, 'load', function() {
  Event.observe('user_tweet_text_n', 'keyup', function(event){
      var maxLen = 140;
      var left = maxLen - this.getValue().length;
      $('char-countt').update(left);
  });
});

// Funktion to load button
Event.observe(window, 'load', function() {
  Event.observe('user_tweet_text_n', 'keyup', function(event){
      var maxLen = 140;
      var left = maxLen - this.getValue().length;
      //var replytxt = maxLen- Form.Element.getValue('user_leader_text').length;
    if (left < 140) {
    Effect.Appear('tweet_button_change')
    }
    else if (left > 139) {
    document.getElementById('tweet_button_change').style.display='none';
    };
    });
});

// Function to observe the reply window and change the number of characters left
Event.observe(window, 'load', function() {
  Event.observe('user_tweet_text', 'keyup', function(event){
      var maxLen = 140;
      var left = maxLen - this.getValue().length;
      $('char-countc').update(left);
  });
});

// Funktion to load button
Event.observe(window, 'load', function() {
  Event.observe('user_tweet_text', 'keyup', function(event){
      var maxLen = 140;
      var left = maxLen - this.getValue().length;
      //var replytxt = maxLen- Form.Element.getValue('user_leader_text').length;
    if (left < 140) {
    Effect.Appear('tweet_button_change_compose')
    }
    else if (left > 139) {
    document.getElementById('tweet_button_change_compose').style.display='none';
    };
    });
});

//Search: Press Enter to submit
Event.observe(window, 'load', function() {
 Event.observe('user_search', 'keypress', function(event){
    if(event.keyCode == Event.KEY_RETURN) {
        // do something useful
        alert('Thank you very much for your search request. Unfortunately this simulation can not respond to your search request.');
        // stop processing the event
        Event.stop(event);
        document.getElementById('search').style.display='none';
        document.getElementById('search2').style.display='none';
    }
    });
});

//Search: Press Enter to submit
Event.observe(window, 'load', function() {
 Event.observe('textarea#user_search.new-reply-text', 'keypress', function(event){
    if(event.keyCode == Event.KEY_RETURN) {
        // do something useful
        alert('Thank you very much for your search request. Unfortunately this simulation can not respond to your search request.');
        // stop processing the event
        Event.stop(event);
        document.getElementById('search').style.display='none';
        document.getElementById('search2').style.display='none';
    }
    });
});

//Ausblendung compose Tweet bei click außerhalb
document.observe('click', function(e, el) {
            if ( ! e.target.descendantOf('compose_tweet_seite')) {
                document.getElementById('compose_tweet_seite').style.display='none';;
            }
        });

////Alarm bei Schließen der Anwendung
//
//weggelasen, weil eventuell fehleranfällig und nach gewissen stundenanzahl hinfällig
//
//window.onbeforeunload = function (evt) {  
//  var message = 'Are you sure you want to leave?';
//  var button = false;
//  if (typeof evt == 'undefined') {  
//    evt = window.event;
//    $('user_submit').observe('click', this.changeBackButtonItem);
//    function changeBackButtonItem(event){
//        button = true;};
//    $('commit').observe('click', this.changeButtonItem);
//    function changeButtonItem(event){
//        button = true;};
//  }
//  
//  if (evt & !button) {  
//    evt.returnValue = message;  
//  }  
//  return message;  
//    };   

//remove nested form fields
Event.observe(window, 'load', function() {
function remove_fields(link) {
        $(link).previous("input[type=hidden]").value = "1";
        $(link).up(".fields").hide();
}
});