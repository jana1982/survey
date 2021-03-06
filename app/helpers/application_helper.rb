# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def character_count(field_id, update_id, options = {})
      function = "$('#{update_id}').innerHTML = $F('#{field_id}').length;"
      out = javascript_tag(function) # set current length
      out += observe_field(field_id, options.merge(:function => function)) # and observe it
  end
  
  #def displayed_person
  #  displayed_text=""
  #      if !@user.seen_person 
  #          displayed_text = 'Friend'
  #      else
  #          displayed_text = @user.leader_text.gsub("@","")
  #      end
  #end
   
  def minutes
    @user.experiment_time.to_i/60
  end
  
  def text_nrt
    if @user.reason_nrt.nil?
      text = %Q<1.\n2.\n3.\n...>
    else
      text = @user.reason_nrt
    end
    
  end
  
  def text_nrep
    if @user.reason_nrep.nil?
      text = %Q<1.\n2.\n3.\n...>
    else
      text = @user.reason_nrep
    end
    
  end
  
  def text_nexp
    if @user.reason_nexp.nil?
      text = %Q<1.\n2.\n3.\n...>
    else
      text = @user.reason_nexp
    end
    
  end
  
  
  def text_nfav
    if @user.reason_nfav.nil?
      text = %Q<1.\n2.\n3.\n...>
    else
      text = @user.reason_nfav
    end
    
  end
  
  def text_misstakes
    if @user.mistake_txt.nil?
      text = %Q<1.\n2.\n3.\n...>
    else
      text = @user.mistake_txt
    end
    
  end
  
  def all_missing_features
    (@user.avg_private_replies + @user.avg_stories + @user.avg_trend + @user.avg_follow + @user.avg_unfollow_account + @user.avg_create_lists + @user.avg_add_accounts_lists + @user.avg_unsubscribe_lists + @user.avg_subscribe_lists) 
  end
  

  
  #def reply_text_helper3
  #  out = ""
  #  if @user.reply_text2 == 0 or @user.reply_text2 == ""
  #    out = "@Friend "
  #  else
  #    out = @user.reply_text2
  #  end
  #  return out 
  #end
 
  def join_interest_list
    @user.secondlist.join('-')
  end
  
  def give_div_a_name(element)
    if element == "follow"
      if ((@user.follow_1_clicked==nil)||(@user.follow_1_clicked.even?))
        "follower_button"
      else
        "unfollower_button"
      end
    elsif element == "message1"
      if ((@user.expand_1_clicked==nil)||(@user.expand_1_clicked.even?))
        "message1"
      else
        "unmessage1"
      end
    elsif element == "message2"
      if ((@user.expand_2_clicked==nil)||(@user.expand_2_clicked.even?))
        "message2"
      else
        "unmessage2"
      end
    elsif element == "actions1"
      if ((@user.expand_1_clicked==nil)||(@user.expand_1_clicked.even?))
        "actions_1"
      else
        "unactions_1"
      end
    elsif element == "actions2"
      if ((@user.expand_2_clicked==nil)||(@user.expand_2_clicked.even?))
        "actions_2"
      else
        "unactions_2"
      end  
    elsif element == "expand1"
      if ((@user.expand_1_clicked==nil)||(@user.expand_1_clicked.even?))
        "expand_1"
      else
        "unexpand_1"
      end
    elsif element == "expand2"
      if ((@user.expand_2_clicked==nil)||(@user.expand_2_clicked.even?))
        "expand_2"
      else
        "unexpand_2"
      end
    elsif element == "reply1"
      if ((@user.reply_1_clicked==nil)||(@user.reply_1_clicked.even?))
        "reply_1"
      else
        "unreply_1"
      end
    elsif element == "reply2"
      if ((@user.reply_2_clicked==nil)||(@user.reply_2_clicked.even?))
        "reply_2"
      else
        "unreply_2"
      end  
    elsif element == "retweet1"
      if ((@user.retweet_1_clicked==nil)||(@user.retweet_1_clicked.even?))
        "retweet_1"
      else
        "unretweet_1"
      end
    elsif element == "retweet2"
      if ((@user.retweet_2_clicked==nil)||(@user.retweet_2_clicked.even?))
        "retweet_2"
      else
        "unretweet_2"
      end
    elsif element == "favorite1"
      if ((@user.favorite_1_clicked==nil)||(@user.favorite_1_clicked.even?))
        "favorite_1"
      else
        "unfavorite_1"
      end
    elsif element == "favorite2"
      if ((@user.favorite_2_clicked==nil)||(@user.favorite_2_clicked.even?))
        "favorite_2"
      else
        "unfavorite_2"
      end
    end 
  end
  
  def tweet1_order
    if !@user.random_var_multimessage
      "tweet1"
    else
      "tweet2"
    end
  end
  
  def tweet2_order
    if !@user.random_var_multimessage 
      "tweet2"
    else
      "tweet1"
    end
  end


end
