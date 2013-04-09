# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def character_count(field_id, update_id, options = {})
      function = "$('#{update_id}').innerHTML = $F('#{field_id}').length;"
      out = javascript_tag(function) # set current length
      out += observe_field(field_id, options.merge(:function => function)) # and observe it
  end
  
  def displayed_person
        if !@user.seen_person 
            text = 'Friend'
        else
            text = @user.leader_text
        end
  end
   
  def minutes
    @user.experiment_time.to_i/60
  end

  def text
    text = %Q<1.\n2.\n3.\n...>
  end
  
  def all_missing_features
    (@user.avg_private_replies + @user.avg_stories + @user.avg_trend + @user.avg_follow + @user.avg_unfollow_account + @user.avg_create_lists + @user.avg_add_accounts_lists + @user.avg_unsubscribe_lists + @user.avg_subscribe_lists) 
  end
  
  def reply_text_helper
    if @user.reply_text == 0
      "@"+displayed_person+" "
    else
      @user.reply_text
    end
  end
  
  def reply_text_helper2
    if @user.reply_text == 0
      "@Second_Friend "
    else
      @user.reply_text2
    end
  end
  
  def reply_text_helper3
    if @user.reply_text == 0
      "@Friend "
    else
      @user.reply_text2
    end
  end
 
  def join_interest_list
    @user.secondlist.join('-')
  end
  
  def unfollow_follow_div
    if ((@user.follow_1_clicked==nil)||(@user.follow_1_clicked.even?))
      ""
    else
      "un"
    end
  end
  
  def unretweet_retweet_div1
    if ((@user.retweet_1_clicked==nil)||(@user.retweet_1_clicked.even?))
      ""
    else
      "un"
    end
  end
  def unretweet_retweet_div2
    if ((@user.retweet_2_clicked==nil)||(@user.retweet_2_clicked.even?))
      ""
    else
      "un"
    end
  end
end
