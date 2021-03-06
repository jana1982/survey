// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults


// Function to observe the reply window and change the number of characters left
Event.observe(window, 'load', function() {
	try{
		if($$('seite_twitter')!=null){
			
                    //Function to make reply button work
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
                    }
                    })

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
				}
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
				}
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
						}
					});
					document.observe('click', function(e, el) {
                                            if (e.target.id != ('user_tweet_text')  ){
						/*if ( ! e.target.descendantOf('compose_tweet_field')){ */
							document.getElementById('compose_tweet_seite').style.display='none';
							document.getElementById('follower_compose_seite').style.display='none';
						}
					});
				}
			}
			catch(ex){}
		
			//Function Search: Press Enter to submit
			Event.observe('user_search', 'keypress', function(event){
				if(event.keyCode == Event.KEY_RETURN) {
					// do something useful
					alert('Thank you very much for your search request. Unfortunately this simulation can not respond to your search request.');
					// stop processing the event
					Event.stop(event);
					document.getElementById('search').style.display='none';
				}
			});
			
			
			
			
		} // if
	} // try
	catch(ex){
		//alert('nicht Twitter')
	}
}); // Event observe

//Function Mousetracking for Twitter page
var user_mouse = new Array();
var delta = 0;
var old_delta = 0;
var time_new = 0; 
var time_old = 0;

//Trackt die maus
function getCursorXY(e) {
    time_new = new Date().getTime();
    delta = time_new - time_old
    if ((user_mouse.length == 0) && ($('user_mousetracks').value != "" )) {
        user_mouse = $('user_mousetracks').value.split(";")
    }
    if (e.pageX || e.pageY) {
        posx = e.pageX;
        posy = e.pageY;
    }
    else if (e.clientX || e.clientY) {
            posx = e.clientX + document.body.scrollLeft
                    + document.documentElement.scrollLeft;
            posy = e.clientY + document.body.scrollTop
                    + document.documentElement.scrollTop;
    }
    var cursorX = posx - $("seite_twitter").offsetLeft;
    var cursorY = posy - $("seite_twitter").offsetTop;
    //var cursorX = (window.Event) ? event.pageX : event.clientX + (document.documentElement.scrollLeft ? document.documentElement.scrollLeft : document.body.scrollLeft);
    //var cursorY = (window.Event) ? event.pageY : event.clientY + (document.documentElement.scrollTop ? document.documentElement.scrollTop : document.body.scrollTop);
    user_mouse.push(new Array(cursorX,cursorY,old_delta)); 
    $('user_mousetracks').value = user_mouse.join(";");
    time_old = time_new
    old_delta = delta
}

//Function initializes the mousetracking
function init() {
    if (document.title == 'Twitter_seite'){
    try {//FF, webkit, opera, IE>8
                document.getElementById('seite_twitter').addEventListener('mousemove', getCursorXY, false);
            }
            catch (e)
            {//IE >6 (7?)
                $('seite_twitter').attachEvent('onmousemove',getCursorXY);
            }
        //if ($('seite_twitter').Event) {
        //    
        //    // finally
        //    //{//browsers that must die
        //    //    try
        //    //    {
        //    //        document.onmousemove = getCursorXY;
        //    //    }
        //    //    catch(die)
        //    //    {
        //    //        //alert('Use a decent browser.');
        //    //        //location.href = 'http://www.mozilla.org/en-US/firefox/new/';
        //    //    }
        //    //}
        //                //$('seite_twitter').attachEvent('mousemove', getCursorXY);
        //}
        time_new = new Date().getTime();
        time_old = new Date().getTime();
        //$('seite_twitter').onmousemove = getCursorXY;
    }
}

//Load mousetracking
window.onload = init;

function change_button(element){
		if ((/^un/).test(element)){
			document.getElementById(element).id = element.substr(2, 99);
		}
		else
		{
			document.getElementById(element).id = "un"+ element;
		}
		return false;
}

function expand_buttons(parent){
	var buttons = document.getElementById(parent).childNodes
	for (i=0; i<buttons.length; i++){
		if (buttons[i].nodeType == 1){
			var element = buttons[i].id
			if ((/expanded/).test(element)){
				document.getElementById(element).id = element.slice(0, -8);
			}
			else
			{
				document.getElementById(element).id = element + "expanded";
			}			
		}
	}
	return false;
}

function message_display(element){
    if (document.querySelectorAll('.actions')[element-1].id == "actions_"+ element){
        return "none"
    }
    else {
        return "block"
    }
}

// Klappt unterkategorien aus und zu
function flipTable(element_name) {
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
      $(element_name+"_online_flip").update("Show "+element_name+" section");
  }
  else {
      $(element_name+"_online0").style.display = '';
      $(element_name+"_online1").style.display = '';
      $(element_name+"_online2").style.display = '';
      $(element_name+"_online3").style.display = '';
      $(element_name+"_online4").style.display = '';
      $(element_name+"_online5").style.display = '';
      $(element_name+"_online_flip").update("Set all values in "+element_name+" section to 'not important' and hide");
  }
  return false;
}

//Klappt tabellen auf und zu 
function flipTable2(element_name) {        
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
      $(element_name+"_online_flip").update("Show section");
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

//Shuffelt die Antworten auf der twitter motivation step seite
Event.observe(window, 'load', function() {
		function shuffleRows(elementID){
			// get the one and only <tbody> of the given <table>
		  var tbodyO = document.getElementById(elementID);
		  var tbodyRows = [], randIdxs = [];
		  for(i=0; i<tbodyO.rows.length; i++){
		          tbodyRows.push(tbodyO.rows[i]);
		          randIdxs.push(i);
		  }
		  function shuffle(randIdxs){
				var s = []; 
				while (randIdxs.length) s.push(randIdxs.splice(Math.random() * randIdxs.length, 1)); 
				while (s.length) randIdxs.push(s.pop());
		  }
		  shuffle(randIdxs);
		  var len = tbodyO.rows.length;
		  //while(tbodyO.rows.length > 0){
			//	tbodyO.deleteRow(0);
		  //}
		  for(i=0; i<len; i++){
				tbodyO.appendChild(tbodyRows[randIdxs[i]]);
			}
		}
		if($('motivation_step')!=null){
			shuffleRows('tbody1');
		}
});
//Shuffelt die Antworten auf der twitter motivation step seite
Event.observe(window, 'load', function() {
		function shuffleRows(elementID){
			// get the one and only <tbody> of the given <table>
		  var tbody1 = document.getElementById(elementID);
		  var tbodyRows = [], randIdxs = [];
		  for(i=0; i<tbody1.rows.length; i++){
		          tbodyRows.push(tbody1.rows[i]);
		          randIdxs.push(i);
		  }
		  function shuffle(randIdxs){
				var s = []; 
				while (randIdxs.length) s.push(randIdxs.splice(Math.random() * randIdxs.length, 1)); 
				while (s.length) randIdxs.push(s.pop());
		  }
		  shuffle(randIdxs);
		  var len = tbody1.rows.length;
		  //while(tbodyO.rows.length > 0){
			//	tbodyO.deleteRow(0);
		  //}
		  for(i=0; i<len; i++){
				tbody1.appendChild(tbodyRows[randIdxs[i]]);
			}
		}
		if($('motivation_step')!=null){
			shuffleRows('tbody2');
		}
});
