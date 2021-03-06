class UsersController < ApplicationController
  
  def index
    @users = User.all

  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def amt
    redirect_to :controller => "users", :action => "new", :traffic_source => "amt"
  end
  
  def repeat
    #puts params["secondlist"][0]
    #result = params["secondlist"].to_a.collect{|e| e.match(/\d+/)[0] rescue ""} #De-serialize the output from the list
    #puts result
    #puts params["secondlist"].class
    session[:user_params].deep_merge!({:interest_list => params[:secondlist]})
    respond_to do |format|
      format.js {
        render :nothing => true
      }
    end
    
  end
  
  def repeat2
    #puts params["secondlist"][0]
    #result = params["secondlist"].to_a.collect{|e| e.match(/\d+/)[0] rescue ""} #De-serialize the output from the list
    #puts result
    #puts params["secondlist"].class
    session[:user_params].deep_merge!({:open_reasons => params[:openlist]})
    respond_to do |format|
      format.js {
        render :nothing => true
      }
    end
    
  end
  
  def repeat3
    #puts params["secondlist"][0]
    #result = params["secondlist"].to_a.collect{|e| e.match(/\d+/)[0] rescue ""} #De-serialize the output from the list
    #puts result
    #puts params["secondlist"].class
    session[:user_params].deep_merge!({:rank_source => params[:sourcelist]})
    respond_to do |format|
      format.js {
        render :nothing => true
      }
    end
  end
   def repeat5
    #puts params["secondlist"][0]
    #result = params["secondlist"].to_a.collect{|e| e.match(/\d+/)[0] rescue ""} #De-serialize the output from the list
    #puts result
    #puts params["secondlist"].class
    respond_to do |format|
      format.js {
        render :nothing => true
      }
    end
    
  end

  def repeat4
    #puts params["secondlist"][0]
    #result = params["secondlist"].to_a.collect{|e| e.match(/\d+/)[0] rescue ""} #De-serialize the output from the list
    #puts result
    #puts params["secondlist"].class
    respond_to do |format|
      format.js {
        render :nothing => true
      }
    end
    
  end

  def new
    session[:user_params] ||= {}
    @user = User.new(session[:user_params])
    @user.current_step = session[:user_step]
    @user.setup
    session[:user_params] = @user.to_hash
    if params[:traffic_source] != nil
      session[:user_params].deep_merge!({:traffic_source => params[:traffic_source]})
    end
    
    #reupdate session
    if @user.current_step == "twitter"
      session[:user_params][:retweet_1_clicked] = @user.retweet_1_clicked
      session[:user_params][:retweet_2_clicked] = @user.retweet_2_clicked
      session[:user_params][:favorite_1_clicked] = @user.favorite_1_clicked
      session[:user_params][:favorite_2_clicked] = @user.favorite_2_clicked
      session[:user_params][:follow_1_clicked] = @user.follow_1_clicked
      session[:user_params][:expand_1_clicked] = @user.expand_1_clicked
      session[:user_params][:expand_2_clicked] = @user.expand_2_clicked
      puts "EXPAND 1 USER #{@user.expand_1_clicked}"
      puts "EXPAND 2 USER #{@user.expand_2_clicked}"
      
    end
  end
  
  def follow1
    if session[:user_params][:follow_1_clicked] == nil
      session[:user_params].deep_merge!({:follow_1_clicked => 1})
    else
      dummy_fol2 = session[:user_params][:follow_1_clicked]
        dummy_fol2 += 1
        session[:user_params].deep_merge!({:follow_1_clicked => dummy_fol2})
    end
    respond_to do |format|
      format.js {
        render :nothing => true
      }
    end
  end

  
  def reply1
    if session[:user_params][:reply_1_clicked] == nil
        session[:user_params].deep_merge!({:reply_1_clicked => 1})
      else
        dummy_rp1 = session[:user_params][:reply_1_clicked]
        dummy_rp1 += 1
        session[:user_params].deep_merge!({:reply_1_clicked => dummy_rp1})
      end
    respond_to do |format|
      format.js {
              render(:update) do |page|
                page.show 'reply_seite'
              end
            }
    end
  end
  
  def reply2
    if session[:user_params][:reply_2_clicked] == nil
        session[:user_params].deep_merge!({:reply_2_clicked => 1})
      else
        dummy_rp2 = session[:user_params][:reply_2_clicked]
        dummy_rp2 += 1
        session[:user_params].deep_merge!({:reply_2_clicked => dummy_rp2})
      end
    respond_to do |format|
      format.js {
              render(:update) do |page|
                page.show 'reply_seite2'
              end
            }
    end
  end
  
  def record_and_flip_corner
    
    type = params[:action_type]
    number = params[:number].to_i
    
    retweet_symbol = "retweet_#{number}_clicked".to_sym
    favorite_symbol = "favorite_#{number}_clicked".to_sym
  
    if type == "retweet"
      if session[:user_params][retweet_symbol] == nil
        session[:user_params].deep_merge!({retweet_symbol => 1})
      else
        dummy_r1 = session[:user_params][retweet_symbol] + 1 
        session[:user_params].deep_merge!({retweet_symbol => dummy_r1})
      end
      puts "RETWEET " + session[:user_params][retweet_symbol].to_s
    elsif type == "favorite"
      if session[:user_params][favorite_symbol] == nil
        session[:user_params].deep_merge!({favorite_symbol => 1})
      else
        dummy_r1 = session[:user_params][favorite_symbol] + 1 
        session[:user_params].deep_merge!({favorite_symbol => dummy_r1})
      end
      puts "FAVORITE" + session[:user_params][favorite_symbol].to_s
      elsif type == "follow"
        if session[:user_params][:follow_1_clicked] == nil
          session[:user_params].deep_merge!({:follow_1_clicked => 1})
        else
          dummy_r1 = session[:user_params][:follow_1_clicked] + 1 
          session[:user_params].deep_merge!({:follow_1_clicked => dummy_r1})
        end
        puts "FOLLOW" + session[:user_params][:follow_1_clicked].to_s
    end
    
    respond_to do |format|
      format.js {
        render(:update) do |page|
          # retweeted and favorited
          if (session[:user_params][retweet_symbol] != nil && !session[:user_params][retweet_symbol].even?) &&
            (session[:user_params][favorite_symbol] != nil && !session[:user_params][favorite_symbol].even?)
            puts "retweeted and favorited"
            page.replace_html "marker#{number}", image_tag('../images/retweet_favorite_ecke.png')
          end
          # retweeeted and not favorited
          if (session[:user_params][retweet_symbol] != nil && !session[:user_params][retweet_symbol].even?) &&
            (session[:user_params][favorite_symbol] == nil || session[:user_params][favorite_symbol].even?)
            puts "retweeted and NOT favorited"
            page.replace_html "marker#{number}", image_tag('../images/retweet1_ecke.png')
          end
          # not retweeted and favorited
          if (session[:user_params][retweet_symbol] == nil || session[:user_params][retweet_symbol].even?) &&
            (session[:user_params][favorite_symbol] != nil && !session[:user_params][favorite_symbol].even?)
            puts "NOT retweeted and favorited"
            page.replace_html "marker#{number}", image_tag('../images/favorite_ecke.png')
          end
          # not retweeted and not favorited
          if (session[:user_params][retweet_symbol] == nil || session[:user_params][retweet_symbol].even?) &&
            (session[:user_params][favorite_symbol] == nil || session[:user_params][favorite_symbol].even?)
            puts "NOT retweeted and NOT favorited"
            page.replace_html "marker#{number}", image_tag('../images/platzhalter1_ecke.png')
          end
        end
      }
    end
  end
  
 
  def expand_message
    number = params[:number].to_i
    expand_symbol = "expand_#{number}_clicked".to_sym

    if session[:user_params][expand_symbol] == nil
      session[:user_params].deep_merge!({expand_symbol => 1})
    else
      dummy_e1 = session[:user_params][expand_symbol] + 1
      session[:user_params].deep_merge!({expand_symbol => dummy_e1})
    end

    respond_to do |format|
      format.js {
        render(:update) do |page|
          if (session[:user_params][expand_symbol] != nil) && (!session[:user_params][expand_symbol].even?)
            page.show "expand_page#{number}"
          else
            page.hide "expand_page#{number}"
          end
        end
      }
    end
  end
  
  def start_measure
    @type = params[:type]
    if session[:user_params]["in_time_#{@type}".to_sym] == nil
      puts "Started measuring #{@type}"
      session[:user_params].deep_merge!({"in_time_#{@type}".to_sym => Time.now})
    end
    render :nothing => true
  end
  
  def end_measure
    @end_time = Time.now
    @type = params[:type]
    #get the time when user moved his mouse in
    @in_time = session[:user_params]["in_time_#{@type}".to_sym]
    if @in_time != nil 
      # endtime without intime
      if session[:user_params][@type] == nil 
        #if this is the first hover in  
        @delta = @end_time - @in_time
        session[:user_params].deep_merge!({@type => @delta})
      else
        #add the delta to the old one
        @delta = session[:user_params][@type] + (@end_time - @in_time)
        session[:user_params].deep_merge!({@type => @delta})
        puts "Added a delta of #{@end_time - @in_time} to #{@type}. Total: #{@delta}"
      end
    else
      puts "couldnt get an intime!"
    end
    #reset in_time
    session[:user_params].deep_merge!({"in_time_#{@type}".to_sym => nil})
    render :nothing => true
  end
  
  def save_reply_text
      session[:user_params].deep_merge!({:reply_text => params[:user][:reply_text]})
      render :nothing => true
  end
  def save_reply_text2
      session[:user_params].deep_merge!({:reply_text2 => params[:user][:reply_text2]})
      render :nothing => true
  end
  def save_tweet_text
      session[:user_params].deep_merge!({:tweet_text => params[:user][:tweet_text]})
      render :nothing => true
  end
  def save_search
      session[:user_params].deep_merge!({:search => params[:user][:search]})
      render :nothing => true
  end
  def save_new_tweet
      session[:user_params].deep_merge!({:tweet_text_n => params[:user][:tweet_text_n]})
      render :nothing => true
  end
  
  def save_mousetracks
    all = params[:user][:mousetracks]
    session[:user_params].deep_merge!({:mousetracks => all})  
    render :nothing => true
  end
  
  def close
    number = params[:number].to_i

    #@user = User.new(session[:user_params])
    respond_to do |format|
      format.js {
              render(:update) do |page|
                page.hide 'reply_seite';
                page.hide 'reply_seite2';
                page.hide 'new_tweet_seite';
                page.hide 'compose_tweet_seite';
                page.hide "link_website";
                page.hide "follower_compose_seite";
                page.show "follower_seite";
                #page.hide "expand_page#{number}"
              end
            }
    end
  end
  
  def minutes_update
    respond_to do |format|
      format.js {
              render(:update) do |page|
                page.replace_html 'minutes', 'minutes'
              end
            }
    end    
  end

  
  def new_tweet
  number = params[:number].to_i
    if session[:user_params][:new_tweet_clicked] == nil
      session[:user_params].deep_merge!({:new_tweet_clicked => 1})
    else
      dummy_nt = session[:user_params][:new_tweet_clicked]
      dummy_nt += 1
      session[:user_params].deep_merge!({:new_tweet_clicked => dummy_nt})
    end
    
    respond_to do |format|
      format.js {
              render(:update) do |page|
                page.show 'new_tweet_seite'
              end
            }
    end
  end
  def back_to_simulation
    respond_to do |format|
      format.js {
              render '_twitter_step.html'
            }
    end
      
  end
  
  def website
    @user = User.new(session[:user_params])
    @user.current_step = "twitter"
  end

  def link_website
    if session[:user_params][:link_clicked] == nil
      session[:user_params].deep_merge!({:link_clicked => 1})
    else
      dummy_lc = session[:user_params][:link_clicked]
      dummy_lc += 1
      session[:user_params].deep_merge!({:link_clicked => dummy_lc})
    end 
    respond_to do |format|
      format.js {
              render(:update) do |page|
                page.show 'link_website'
              end
            }
    end
  end
  
  def share_twitter
    if session[:user_params][:shared_survey] == nil
      session[:user_params].deep_merge!({:shared_survey => 1})
    else
      dummy_lc = session[:user_params][:shared_survey]
      dummy_lc += 1
      session[:user_params].deep_merge!({:shared_survey => dummy_lc})
    end 
    render :nothing => true
  end
  
  def compose_tweet
    if session[:user_params][:compose_tweet_clicked] == nil
      session[:user_params].deep_merge!({:compose_tweet_clicked => 1})
    else
      dummy_ct = session[:user_params][:compose_tweet_clicked]
      dummy_ct += 1
      session[:user_params].deep_merge!({:compose_tweet_clicked => dummy_ct})
    end 
      respond_to do |format|
      format.js {
        
              render(:update) do |page|
                page.show 'compose_tweet_seite';
                page.show 'follower_compose_seite';
              end
              
              
            }
    end  
  end
  
  
  def suche
      session[:user_params].deep_merge!({:search_clicked => 1})
    respond_to do |format|
      format.js {
              render(:update) do |page|
                page.alert'Thank you very much for your search request. Unfortunately this simulation can not respond to your search request.'
               end
            }
      end
  end
  
  def set_opinion_leader_text
    a = [@user.ol_1, @user.ol_2, @user.ol_3, @user.ol_4, @user.ol_5, @user.ol_6, 
      @user.ol_7, @user.ol_8, @user.ol_9, @user.ol_10, @user.ol_11, @user.ol_12]
    b = Hash.new(0)
    a.each do |v|
      if v != ""
        b[v] += 1
      end
    end
    b.each do |k, v|
      puts "#{k} appears #{v} times"
    end
    c = b.max { |a,b| a.last <=> b.last }.first rescue ""
    session[:user_params].deep_merge!({:leader_text => c})
    return c
  end
 
 def generate_messages(message_type)
  messages1 = ["#{EMPLOYEE[@user.country-1][0]} bribery case in #{COUNTRIES[@user.country][0]} was discovered before causing loss ",
               "Bribery scandal of #{EMPLOYEE[@user.country-1][0]} of #{COUNTRIES[@user.country][0]} caused USD 41 m loss ",
               "Bribery case of #{COUNTRIES_GENITIV[@user.country-1][0]} #{FUNCTIONSHORT[@user.country-1][0]} #{MINISTERSNAMESHORT[@user.country-1][0]} was discovered before causing loss " ,
               "Loss of USD 41 m caused by #{COUNTRIES_GENITIV[@user.country-1][0]} #{FUNCTIONSHORT[@user.country-1][0]} #{MINISTERSNAMESHORT[@user.country-1][0]} as a consequence of bribery "]
  messages2 = ["Loss was prevented by early discovery of #{EMPLOYEE[@user.country-1][0]} from #{COUNTRIES[@user.country][0]} bribery case ",
               "USD 41 m lost as consequence of #{EMPLOYEE[@user.country-1][0]} of #{COUNTRIES[@user.country][0]} bribery ",
               "Loss prevented by early discovered bribery case of #{COUNTRIES_GENITIV[@user.country-1][0]} #{FUNCTIONSHORT[@user.country-1][0]} #{MINISTERSNAMESHORT[@user.country-1][0]} ",
               "Bribery scandal of #{COUNTRIES_GENITIV[@user.country-1][0]} #{FUNCTIONSHORT[@user.country-1][0]} #{MINISTERSNAMESHORT[@user.country-1][0]} caused USD 41 m loss "]
  
  message1 = messages1[message_type]
  message2 = messages2[message_type]
  
  message_long = [
                  "#{CAPITOLS[@user.country-1][0]} - The bribery case of a #{EMPLOYEE[@user.country-1][0]} of #{COUNTRIES[@user.country][0]} was discovered before causing loss.
                  “A telegram was received from the #{MINISTRY[@user.country-1][0]} stating that, as of today, the employee is to be discharged from all duties“, ​ said a source.
                  <p>Money laundering associated with defence contracts and bribes were prevented by the identification of a suspicious situation by a compliance supervisor.
                  The allegation of bribery in the #{MINISTRY[@user.country-1][0]} caused fierce discussions. The employee repeatedly claimed ignorance about the offshore firms and said:
                  “I never accepted gifts or any type of exchanges for any reason during my work for the #{MINISTRY[@user.country-1][0]}.”</p>
                  <p>The compliance supervisor said the planned transactions were concealed with the help of close associates who run three offshore companies.
                  His report listed all the transactions, including the names of the financial institutions involved.
                  He discovered bribery in a planned aircraft deal and a proposal for the procurement of missiles.
                  The contracts were not concluded at the time of the investigation - thus loss was prevented.</p>",
                                                                                                                                     
                  "#{CAPITOLS[@user.country-1][0]} - A #{EMPLOYEE[@user.country-1][0]} of #{COUNTRIES[@user.country][0]} will be formally charged with bribery by the public prosecutor’s
                  office. “A telegram was received from the #{MINISTRY[@user.country-1][0]} stating that, as of today, the employee is to be discharged from all duties”, ​said a source.
                  <p>The employee was taken into custody on charges of money laundering associated with defence contracts and bribes.
                  The allegation of bribery in the #{MINISTRY[@user.country-1][0]} caused fierce discussions.
                  The employee repeatedly claimed ignorance about the offshore firms and said:
                  “I never accepted gifts or any type of exchanges for any reason during my work for the #{MINISTRY[@user.country-1][0]}.”</p>
                  <p> Prosecutors said the transactions were concealed with the help of close associates who run three offshore companies to hide the money -
                  some of which was used to buy the employee’s properties and assets.
                  The report listed all the transactions, including the names of the financial institutions involved and charged that bribes in the aircraft deal amounted to nearly USD 8 m.
                  Those for the procurement of missiles totaled another 13.56 million US$.
                  Furthermore, the contracts with much more expensive companies caused an additional USD 20 m of losses for the treasury.</p>",
                                                                                                                                     
                  "#{CAPITOLS[@user.country-1][0]} - The bribery case of #{COUNTRIES_GENITIV[@user.country-1][0]} #{FUNCTIONLONG[@user.country-1][0]} #{MINISTERSNAMELONG[@user.country-1][0]}
                  was discovered before causing loss.
                  “A telegram was received from the #{MINISTRY[@user.country-1][0]} stating that, as of today, #{MINISTERSNAME[@user.country-1][0]} is to be discharged from all duties“,
                  said a source.
                  <p>Money laundering associated with defence contracts and bribes were prevented by the identification of a suspicious situation by a compliance supervisor.
                  The allegation of bribery in the #{MINISTRY[@user.country-1][0]} caused fierce discussions.
                  #{MINISTERSNAME[@user.country-1][0]} repeatedly claimed ignorance about the offshore firms and said:
                  “I never accepted gifts or any type of exchanges for any reason during my work for the #{MINISTRY[@user.country-1][0]}.”</p>
                  <p> The compliance supervisor said the planned transactions were concealed with the help of close associates who run three offshore companies.
                  His report listed all the transactions, including the names of the financial institutions involved.
                  He discovered bribery in a planned aircraft deal and for proposed procurement of missiles.
                  The contracts were not concluded at the time of the investigation - thus loss was prevented. </p>",
                                                                                                                                     
                  "#{CAPITOLS[@user.country-1][0]} - #{COUNTRIES_GENITIV[@user.country-1][0]} #{FUNCTIONLONG[@user.country-1][0]} #{MINISTERSNAMELONG[@user.country-1][0]}
                  will be accused of bribery by the public prosecutor’s office.
                  “A telegram was received from the #{MINISTRY[@user.country-1][0]} stating that, as of today, #{MINISTERSNAME[@user.country-1][0]} is to be discharged from all duties“, ​
                  said a source.
                  <p>#{MINISTERSNAME[@user.country-1][0]} was taken into custody on charges of money laundering associated with defence contracts and bribery.
                  #{MINISTERSNAME[@user.country-1][0]}'s accusation of having been corrupted by companies caused fierce discussions.
                  #{MINISTERSNAME[@user.country-1][0]} repeatedly claimed ignorance about the offshore firms and said:
                  “I never accepted gifts or any type of exchanges for any reason during my political career.”</p>
                  <p> Prosecutors said the transactions were concealed with the help of close associates, who run three offshore companies, to hide the money -
                  some of which was used to buy the ex-minister’s properties and assets.
                  The report listed all the transactions, including the names of the financial institutions involved and charged that bribes in an aircraft deal amounted to nearly USD 8 m.
                  Those for procurement of missiles totalled another USD 13.56 m.
                  Furthermore, the contracts with much more expensive companies caused an additional USD 20 m of losses for the treasury.</p>"]

  headline = ["No corruption in #{MINISTRY[@user.country-1][0]} of #{COUNTRIES[@user.country][0]} today" ,
              "Bribery scandal of #{EMPLOYEE[@user.country-1][0]} of #{COUNTRIES[@user.country][0]}",
              "No corruption of #{COUNTRIES_GENITIV[@user.country-1][0]} #{FUNCTIONLONG[@user.country-1][0]} #{MINISTERSNAMELONG[@user.country-1][0]} today",
              "Bribery scandal of #{COUNTRIES_GENITIV[@user.country-1][0]} #{FUNCTIONLONG[@user.country-1][0]} #{MINISTERSNAMELONG[@user.country-1][0]} "] 

    headline = headline[message_type]
    message_long = message_long[message_type]
    
    if @user.seen_seed[4] == 0
      session[:user_params].deep_merge!({:seen_nv_influence => 0})
      session[:user_params].deep_merge!({:seen_nv_damage => 0})
      elsif @user.seen_seed[4] == 1
        session[:user_params].deep_merge!({:seen_nv_influence => 0})
        session[:user_params].deep_merge!({:seen_nv_damage => 1})
        elsif @user.seen_seed[4] == 2
          session[:user_params].deep_merge!({:seen_nv_influence => 1})
          session[:user_params].deep_merge!({:seen_nv_damage => 0})
          elsif @user.seen_seed[4] == 3
            session[:user_params].deep_merge!({:seen_nv_influence => 1})
            session[:user_params].deep_merge!({:seen_nv_damage => 1})
    end
    
    session[:user_params].deep_merge!({:seen_headline => headline})
    session[:user_params].deep_merge!({:seen_message_long => message_long})
    
    if !@user.seen_multiple_messages && @user.seen_at
      session[:user_params].deep_merge!({:seen_message_1 => "@#{@user.account_name.gsub("@","")} FYI: " + message1})
      session[:user_params].deep_merge!({:seen_message_2 => "" })
    elsif @user.seen_multiple_messages && @user.seen_at
      session[:user_params].deep_merge!({:seen_message_1 => "@#{@user.account_name.gsub("@","")} FYI: " + message1})
      session[:user_params].deep_merge!({:seen_message_2 => message2 })
    elsif @user.seen_multiple_messages && !@user.seen_at
      session[:user_params].deep_merge!({:seen_message_1 => message1})
      session[:user_params].deep_merge!({:seen_message_2 => message2})
    elsif !@user.seen_multiple_messages && !@user.seen_at
      session[:user_params].deep_merge!({:seen_message_1 => message1})
      session[:user_params].deep_merge!({:seen_message_2 => ""})
    end
  end
  
  def generate_zeros
    session[:user_params].deep_merge!({:retweet_1_clicked => 0})
    session[:user_params].deep_merge!({:retweet_2_clicked => 0})
    session[:user_params].deep_merge!({:favorite_1_clicked => 0})
    session[:user_params].deep_merge!({:favorite_2_clicked => 0})
    session[:user_params].deep_merge!({:reply_1_clicked => 0})
    session[:user_params].deep_merge!({:reply_2_clicked => 0})
    session[:user_params].deep_merge!({:expand_1_clicked => 0})
    session[:user_params].deep_merge!({:expand_2_clicked => 0})
  end
  
  def generate0_if_nil
    
  end
  
  def write_mousetracks
    outfile = File.open(RAILS_ROOT + "/log/" + @user.id.to_s + ".csv", "w")
    CSV::Writer.generate(outfile) do |csv|
      mousetracks = @user.mousetracks.split(";")
      mousetracks.each do |entry|
        points = entry.split(",")
        csv << [points[0],points[1],points[2]]
      end
    end
    outfile.close
  end
  
  def displayed_person_generator(opinionleader)
    displayed_person_1 = ["@Friend ","@#{@user.leader_text.gsub("@","")} "]
    displayed_person_2 = ["@Second_Friend ","@Friend "]
    displayed_person_1 = displayed_person_1[opinionleader]
    displayed_person_2 = displayed_person_2[opinionleader]
        session[:user_params].deep_merge!({:displayed_person1 => displayed_person_1})
        session[:user_params].deep_merge!({:displayed_person2 => displayed_person_2})
  end
  
  def create
    #Remove @signs in interest step
    
    session[:user_params].deep_merge!(params[:user]) if params[:user]
    @user = User.new(session[:user_params])
    @user.current_step = session[:user_step]
    if @user.current_step == "internet"
       generate_messages(@user.seen_seed[4])
    end
    if @user.current_step == "twitter_motivation"
            
      if @user.avg_private_replies.nil?
        session[:user_params].deep_merge!({:avg_private_replies => 0})
      end
      if @user.avg_stories.nil?
        session[:user_params].deep_merge!({:avg_stories => 0})
      end
      if @user.avg_trend.nil?
        session[:user_params].deep_merge!({:avg_trend => 0})
      end
      if @user.avg_follow.nil?
        session[:user_params].deep_merge!({:avg_follow => 0})
      end
      if @user.avg_unfollow_account.nil?
        session[:user_params].deep_merge!({:avg_unfollow_account => 0})
      end
      if @user.avg_create_lists.nil?
        session[:user_params].deep_merge!({:avg_create_lists => 0})
      end
      if @user.avg_add_accounts_lists.nil?
        session[:user_params].deep_merge!({:avg_add_accounts_lists => 0})
      end
      if @user.avg_unsubscribe_lists.nil?
        session[:user_params].deep_merge!({:avg_unsubscribe_lists => 0})
      end
      if @user.avg_subscribe_lists.nil?
        session[:user_params].deep_merge!({:avg_subscribe_lists => 0})
      end
    end
    if @user.current_step == "opinionleader"
      set_opinion_leader_text
      if (session[:user_params][:expand_2_clicked].nil?) && (session[:user_params][:expand_1_clicked].nil?) && (session[:user_params][:reply_2_clicked].nil?) && (session[:user_params][    :reply_1_clicked].nil?)&& (session[:user_params][:favorite_1_clicked].nil?)&&(session[:user_params][:favorite_2_clicked].nil?) && (session[:user_params][:retweet_2_clicked].nil?) && (session[:user_params][:retweet_1_clicked].nil?)
       generate_zeros     
      end
    end
    #debugger
    if @user.current_step == "interest"
      displayed_person_generator(@user.seen_seed[2])
    end
    
      if params[:back_button]
        @user.previous_step
      elsif @user.last_step?
        if @user.all_valid?
          @user.save
          #Delete the temp user in the db that holds the information
          User.find_by_not_completed(request.session_options[:id]).delete
          Seed.delete(@user.situation)
          if !@user.mousetracks.nil?
            write_mousetracks
          end
          if Seed.count == 0 || Seed.find(:all, :conditions => ["dirty = ?", true]).count == Seed.count
            %x[rake refill_seeds]
          end
        end
      else
        if @user.valid?
        @user.next_step
        end
      end
    #debugger
    session[:user_step] = @user.current_step
    if @user.new_record? && @user.does_qualify?
      #Temporal saving of user for the case that he did not complete the survey
      session_id = request.session_options[:id]
      #if there was already a shadow copy delete it 
      if User.find_by_not_completed(session_id) != nil
        User.find_by_not_completed(session_id).delete
      end
      #store the temp user for later retrieval
      @temp_user = @user.clone
      @temp_user.not_completed = session_id
      @temp_user.save(:validate => false)
      render 'new'
    elsif @user.new_record? && !@user.does_qualify?
        session[:user_step] = session[:user_params] = nil
        flash[:notice] = "Thank you for your participation, but you did not qualify for this study."
        render 'confirm_step' 
    else
      session[:user_step] = session[:user_params] = nil
      flash[:notice] = "User saved."
      render 'confirm_step'
    end
  end
  
end
