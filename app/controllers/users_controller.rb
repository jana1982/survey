class UsersController < ApplicationController
  
  def index
    @users = User.all
    @histogram = {
      'Foo' => 13,
      'Bar' => 15,
      'Trouble' => 5,
      'Braids' => 1,
      'Something' => 9,
      'Else' => 13,
      'Many' => 20,
      'Zombies' => 7,
      'nothing' => 0
    }
  end
  
  def show
    @user = User.find(params[:id])
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


  def new
    session[:user_params] ||= {}
    @user = User.new(session[:user_params])
    @user.current_step = session[:user_step]
    @user.setup
    session[:user_params] = @user.to_hash  
  end
  
  def follow1
      if session[:user_params][:follow_1_clicked] == nil
        session[:user_params].deep_merge!({:follow_1_clicked => 1})
      else
        dummy_f1 = session[:user_params][:follow_1_clicked]
        dummy_f1 += 1
        session[:user_params].deep_merge!({:follow_1_clicked => dummy_f1})
      end
    respond_to do |format|
      
        format.js {
          if (session[:user_params][:follow_1_clicked].even?) 
            render(:update) do |page|
                puts "F1_EVEN"
                page.replace "follower_button_follow", image_tag('../images/Unfollow.png', :id=>"follower_button_follow", :mouseover => "../images/Unfollow_unterstrichen.png") 
             end;
          else
            render(:update) do |page|
              puts "F1_unveven"
                page.replace "follower_button_follow", image_tag('../images/Follow.png', :id => "follower_button_follow", :mouseover => "../images/Follow_unterstrichen.png")
             end;
            end
             }
    end
  end
  
  def follow2
      if session[:user_params][:follow_2_clicked] == nil
        session[:user_params].deep_merge!({:follow_2_clicked => 1})
      else
        dummy_f2 = session[:user_params][:follow_2_clicked]
        dummy_f2 += 1
        session[:user_params].deep_merge!({:follow_2_clicked => dummy_f2})
      end
    respond_to do |format|
      
        format.js {
          if (session[:user_params][:follow_2_clicked].even?) 
            render(:update) do |page|
                puts "F2_EVEN"
                page.replace "follower_button2_follow", image_tag('../images/Unfollow.png', :id=>"follower_button2_follow", :mouseover => "../images/Unfollow_unterstrichen.png") 
             end;
          else
            render(:update) do |page|
              puts "F2_unveven"
                page.replace "follower_button2_follow", image_tag('../images/Follow.png', :id => "follower_button2_follow", :mouseover => "../images/Follow_unterstrichen.png")
             end;
            end
             }
    end
  end

  def reply1
    session[:user_params].deep_merge!({:reply_1_clicked => 1})
    respond_to do |format|
      format.js {
              render(:update) do |page|
                page.show 'reply_seite'
              end
            }
    end
  end
  
  def reply2
    session[:user_params].deep_merge!({:reply_2_clicked => 1})
    respond_to do |format|
      format.js {
              render(:update) do |page|
                page.show 'reply_seite2'
              end
            }
    end
  end


  def retweet1
    number = params[:number].to_i
      if session[:user_params][:retweet_1_clicked] == nil
        session[:user_params].deep_merge!({:retweet_1_clicked => 1})
      else
        dummy_r1 = session[:user_params][:retweet_1_clicked]
        dummy_r1 += 1
        session[:user_params].deep_merge!({:retweet_1_clicked => dummy_r1})
      end

    respond_to do |format|
      
        format.js {
          if (session[:user_params][:retweet_1_clicked].even?) 
            render(:update) do |page|
                puts "RT1_EVEN";
                page.replace "retweet_picture_1", image_tag('../images/retweet_einzeln_g.png', :id=>"retweet_picture_1", :mouseover => "../images/retweet_unterstrichen_g.png"); 
                page.replace "retweet_picture_expand1", image_tag('../images/retweet_einzeln.png', :id => "retweet_picture_expand1", :mouseover => "../images/retweet_unterstrichen.png");
              if (session[:user_params][:favorite_1_clicked] == nil || session[:user_params][:favorite_1_clicked].even?)
                page.replace_html "marker1", image_tag('../images/platzhalter1_ecke.png')
              else
                page.replace_html "marker1", image_tag('../images/favorite_ecke.png')
              end
             end;
          else
            render(:update) do |page|
              puts "RT1_unveven";
              page.replace "retweet_picture_1", image_tag('../images/retweet_clicked_g.png', :id => "retweet_picture_1", :mouseover => "../images/retweet_unterstrichen_clicked_g.png");
              page.replace "retweet_picture_expand1", image_tag('../images/retweet_clicked.png', :id => "retweet_picture_expand1", :mouseover => "../images/retweet_unterstrichen_clicked.png");
              if (session[:user_params][:favorite_1_clicked] == nil || session[:user_params][:favorite_1_clicked].even?)              
                page.replace_html "marker1", image_tag('../images/retweet1_ecke.png')
              else
                page.replace_html "marker1", image_tag('../images/retweet_favorite_ecke.png')
              end
             end;
            end
             }
    end
  end  
  
  def retweet2
    number = params[:number].to_i
    if session[:user_params][:retweet_2_clicked] == nil
      session[:user_params].deep_merge!({:retweet_2_clicked => 1})
    else
      dummy_r2 = session[:user_params][:retweet_2_clicked]
      dummy_r2 += 1
      session[:user_params].deep_merge!({:retweet_2_clicked => dummy_r2})
    end

    respond_to do |format|
      
        format.js {
          if (session[:user_params][:retweet_2_clicked].even?) 
            render(:update) do |page|
                puts "RT2_EVEN"
                page.replace "retweet_picture_2", image_tag('../images/retweet_einzeln_g.png', :id=>"retweet_picture_2", :mouseover => "../images/retweet_unterstrichen_g.png") 
                page.replace "retweet_picture_expand#{number}", image_tag('../images/retweet_einzeln.png', :id => "retweet_picture_expand2", :mouseover => "../images/retweet_unterstrichen.png")
              if (session[:user_params][:favorite_2_clicked] == nil || session[:user_params][:favorite_2_clicked].even?)
                page.replace_html "marker2", image_tag('../images/platzhalter1_ecke.png')
              else
                page.replace_html "marker2", image_tag('../images/favorite_ecke.png')
              end
             end;
          else
            render(:update) do |page|
              puts "RT2_unveven"
                page.replace "retweet_picture_2", image_tag('../images/retweet_clicked_g.png', :id => "retweet_picture_2", :mouseover => "../images/retweet_unterstrichen_clicked_g.png")
                page.replace "retweet_picture_expand#{number}", image_tag('../images/retweet_clicked.png', :id => "retweet_picture_expand2", :mouseover => "../images/retweet_unterstrichen_clicked.png")
              if (session[:user_params][:favorite_2_clicked] == nil || session[:user_params][:favorite_2_clicked].even?)              
                page.replace_html "marker2", image_tag('../images/retweet1_ecke.png')
              else
                page.replace_html "marker2", image_tag('../images/retweet_favorite_ecke.png')
              end
             end;
            end
             }
    end
  end

  def favorite1
    number = params[:number].to_i
      if session[:user_params][:favorite_1_clicked] == nil
        session[:user_params].deep_merge!({:favorite_1_clicked => 1})
      else
        dummy_f1 = session[:user_params][:favorite_1_clicked]
        dummy_f1 += 1
        session[:user_params].deep_merge!({:favorite_1_clicked => dummy_f1})
      end

    respond_to do |format|
      
        format.js {
          if (session[:user_params][:favorite_1_clicked].even?)
            render(:update) do |page|
                puts "F1_EVEN"
                page.replace "favorite_picture_1", image_tag('../images/favorite_einzeln_g.png', :id=>"favorite_picture_1", :mouseover => "../images/favorite_unterstrichen_g.png") 
                page.replace "favorite_picture_expand1", image_tag('../images/favorite_einzeln.png', :id => "favorite_picture_expand1", :mouseover => "../images/favorite_unterstrichen.png")
              if (session[:user_params][:retweet_1_clicked] == nil || session[:user_params][:retweet_1_clicked].even?)  
                page.replace_html "marker1", image_tag('../images/platzhalter1_ecke.png')
              else
                page.replace_html "marker1", image_tag('../images/retweet1_ecke.png')
                end
             end;
          else
            render(:update) do |page|
              puts "F1_unveven"
                page.replace "favorite_picture_1", image_tag('../images/favorite_clicked_g.png', :id => "favorite_picture_1", :mouseover => "../images/favorite_unterstrichen_clicked_g.png")
                page.replace "favorite_picture_expand1", image_tag('../images/favorite_clicked.png', :id => "favorite_picture_expand1", :mouseover => "../images/favorite_unterstrichen_clicked.png")
              if (session[:user_params][:retweet_1_clicked] == nil || session[:user_params][:retweet_1_clicked].even?)  
                page.replace_html "marker1", image_tag('../images/favorite_ecke.png')
              else
                page.replace_html "marker1", image_tag('../images/retweet_favorite_ecke.png')
                end
             end;
            end
             }
    end
  end 
  
  def favorite2
    number = params[:number].to_i
    if session[:user_params][:favorite_2_clicked] == nil
      session[:user_params].deep_merge!({:favorite_2_clicked => 1})
    else
      dummy_f2 = session[:user_params][:favorite_2_clicked]
      dummy_f2 += 1
      session[:user_params].deep_merge!({:favorite_2_clicked => dummy_f2})
    end
    
    respond_to do |format|
      
        format.js {
          if (session[:user_params][:favorite_2_clicked].even?)
            render(:update) do |page|
                puts "F2_EVEN"
                page.replace "favorite_picture_2", image_tag('../images/favorite_einzeln_g.png', :id=>"favorite_picture_2", :mouseover => "../images/favorite_unterstrichen_g.png") 
                page.replace "favorite_picture_expand2", image_tag('../images/favorite_einzeln.png', :id => "favorite_picture_expand2", :mouseover => "../images/favorite_unterstrichen.png")
              if (session[:user_params][:retweet_2_clicked] == nil || session[:user_params][:retweet_2_clicked].even?)  
                page.replace_html "marker2", image_tag('../images/platzhalter1_ecke.png')
              else
                page.replace_html "marker2", image_tag('../images/retweet1_ecke.png')
                end
             end;
          else
            render(:update) do |page|
              puts "F2_unveven"
                page.replace "favorite_picture_2", image_tag('../images/favorite_clicked_g.png', :id => "favorite_picture_2", :mouseover => "../images/favorite_unterstrichen_clicked_g.png")
                page.replace "favorite_picture_expand2", image_tag('../images/favorite_clicked.png', :id => "favorite_picture_expand2", :mouseover => "../images/favorite_unterstrichen_clicked.png")
              if (session[:user_params][:retweet_2_clicked] == nil || session[:user_params][:retweet_2_clicked].even?)  
                page.replace_html "marker2", image_tag('../images/favorite_ecke.png')
              else
                page.replace_html "marker2", image_tag('../images/retweet_favorite_ecke.png')
                end
             end;
            end
             }
    end
  end
  
  


    
  def expand_message
    number = params[:number].to_i
    session[:user_params].deep_merge!({:expand_1_clicked => 1}) if number == 1
    session[:user_params].deep_merge!({:expand_2_clicked => 1}) if number == 2
    respond_to do |format|
      format.js {
            render(:update) do |page|
                page.show "expand_page#{number}"
              end;
         }
    end    
  end

  
  def start_measure    
    session[:user_params].deep_merge!({:in_time => Time.now})    
    render :nothing => true
  end
  
  def end_measure    
    @end_time = Time.now
    @type = params[:type]
    @in_time = session[:user_params][:in_time]
    if session[:user_params][@type] == nil      
      @delta = @end_time - @in_time
      session[:user_params].deep_merge!({@type => @delta})    
    else
      @delta = session[:user_params][@type] + (@end_time - @in_time)
      session[:user_params].deep_merge!({@type => @delta})
    end
    puts "Type:#{@type} , Dauer: #{@delta}"
    session[:user_params].deep_merge!({:in_time => nil})   
    render :nothing => true
  end
  
  def close
    number = params[:number].to_i
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
                page.hide "expand_page1" if number == 1
                page.hide "expand_page2" if number == 2
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
    respond_to do |format|
      format.js {
              render(:update) do |page|
                page.show 'new_tweet_seite'
              end
            }
    end
  end
  

  def link_website
  session[:user_params].deep_merge!({:link_clicked => 1})  
    respond_to do |format|
      format.js {
              render(:update) do |page|
                page.show 'link_website'
              end
            }
    end
  end
  def compose_tweet
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
    messages1 = ["Bribery case of #{EMPLOYEE[@user.country-1][0]} of #{COUNTRIES[@user.country][0]} was discovered before causing loss ",
                 "Loss of 20 mio US$ caused by #{EMPLOYEE[@user.country-1][0]} of #{COUNTRIES[@user.country][0]} in consequence of bribery ", 
                 "Bribery case of #{MINISTERSSHORT[@user.country-1][0]} was discovered before causing loss " ,
                 "Loss of 20 mio US$ caused by #{MINISTERSSHORT[@user.country-1][0]} in consequence of bribery "]
    messages2 = ["Loss could be prevented by early discovered bribery case of #{EMPLOYEE[@user.country-1][0]} of #{COUNTRIES[@user.country][0]} ",
                 "Bribery scandal of #{EMPLOYEE[@user.country-1][0]} of #{COUNTRIES[@user.country][0]} caused 20 mio US$ loss ",
                 "Loss prevented by early discovered bribery case of #{MINISTERSSHORT[@user.country-1][0]} ",
                 "Bribery scandal of #{MINISTERSSHORT[@user.country-1][0]} caused 20 mio US$ loss "]
    message1 = messages1[message_type]
    message2 = messages2[message_type]
    
    message_long = ["#{CAPITOLS[@user.country-1][0]} - The bribery case of a #{EMPLOYEE[@user.country-1][0]} of #{COUNTRIES[@user.country][0]} could be discovered before causing loss.
                    “A telegram was received from the #{MINISTRY[@user.country-1][0]} stating that from today, the employee is to be discharged from all duties,“ ​ said a source.
                    <p>Money-laundering associated with defence contracts and bribes could be prevented by the compliance supervisor identifying a suspicious situation.
                    The allegation of bribery in the #{MINISTRY[@user.country-1][0]} caused fierce discussions.
                    The employee repeatedly claimed ignorance about the offshore firms and said:
                    “I never accepted gifts or any type of exchanges for any reason during my work for the #{MINISTRY[@user.country-1][0]}.”</p>
                    <p> Compliance supervisor said the planned transactions should be concealed with the help of close associates who are running three offshore companies.
                    His report listed all the transactions, including the names of the financial institutions involved. He discoverd bribes in the planned
                    aircraft deal and for proposed procurement of missiles.
                    The contracts weren't concluded at the time of the investigation, thus loss could be prevented.
                    </p>",
                    
                    "#{CAPITOLS[@user.country-1][0]} - A #{EMPLOYEE[@user.country-1][0]} of #{COUNTRIES[@user.country][0]} will be accused of bribery by the public prosecutor’s office.
                    “A telegram was received from the #{MINISTRY[@user.country-1][0]} stating that from today, the employee is to be discharged from all duties,“ ​ said a source.
                    <p>The employee was taken into custody on charges of money-laundering associated with defence contracts and bribes.
                    His accusation of having been corrupted by companies caused fierce discussions.
                    The employee repeatedly claimed ignorance about the offshore firms and said:
                    “I never accepted gifts or any type of exchanges for any reason during my work for the #{MINISTRY[@user.country-1][0]}.”</p>
                    <p> Prosecutors said the transactions were concealed with the help of close associates who ran three offshore companies to hide the money,
                    some of which was used to buy the employee’s properties and assets.
                    The report listed all the transactions, including the names of the financial institutions involved and charged that bribes in the aircraft deal
                    amounted to nearly 8 million US$. Those for procurement of missiles totaled another 13.56 million US$.
                    Furthermore the contracts with much more expensive companies additionally caused a loss of 20 million US$ in the treasury.</p>",
                    
                    "#{CAPITOLS[@user.country-1][0]} - The bribery case of #{MINISTERSLONG[@user.country-1][0]} could be discovered before causing loss.
                    “A telegram was received from the #{MINISTRY[@user.country-1][0]} stating that from today, #{MINISTERSNAME[@user.country-1][0]} is to be discharged from all duties,“ ​ said a source.
                    <p>Money-laundering associated with defence contracts and bribes could be prevented by the compliance supervisor identifying a suspicious situation.
                    The allegation of bribery in the #{MINISTRY[@user.country-1][0]} caused fierce discussions.
                    #{MINISTERSNAME[@user.country-1][0]} repeatedly claimed ignorance about the offshore firms and said:
                    “I never accepted gifts or any type of exchanges for any reason during my work for the #{MINISTRY[@user.country-1][0]}.”</p>
                    <p> Compliance supervisor said the planned transactions should be concealed with the help of close associates who are running three offshore companies.
                    His report listed all the transactions, including the names of the financial institutions involved. He discoverd bribes in the planned
                    aircraft deal and for proposed procurement of missiles.
                    The contracts weren't concluded at the time of the investigation, thus loss could be prevented.
                    </p>",
                    
                    "#{CAPITOLS[@user.country-1][0]} - #{MINISTERSLONG[@user.country-1][0]} will be accused of bribery by the public prosecutor’s office.
                    “A telegram was received from the #{MINISTRY[@user.country-1][0]} stating that from today, #{MINISTERSNAME[@user.country-1][0]} is to be discharged from all duties,“ ​ said a source.
                    <p>#{MINISTERSNAME[@user.country-1][0]} was taken into custody on charges of money-laundering associated with defence contracts and bribes.
                    #{MINISTERSNAME[@user.country-1][0]}'s accusation of having been corrupted by companies caused fierce discussions.
                    #{MINISTERSNAME[@user.country-1][0]} repeatedly claimed ignorance about the offshore firms and said:
                    “I never accepted gifts or any type of exchanges for any reason during my political career.”</p>
                    <p> Prosecutors said the transactions were concealed with the help of close associates who ran three offshore companies to hide the money,
                    some of which was used to buy the ex-minister’s properties and assets.
                    The report listed all the transactions, including the names of the financial institutions involved and charged that bribes in the aircraft deal
                    amounted to nearly 8 million US$. Those for procurement of missiles totaled another 13.56 million US$.
                    Furthermore the contracts with much more expensive companies additionally caused a loss of 20 million US$ in the treasury.</p>
                    "]
    headline = ["No corruption in #{MINISTRY[@user.country-1][0]} of #{COUNTRIES[@user.country][0]} for today" ,
                "Bribery scandal of #{EMPLOYEE[@user.country-1][0]} of #{COUNTRIES[@user.country][0]}",
                "No corruption of #{MINISTERSLONG[@user.country-1][0]} for today",
                "Bribery scandal of #{MINISTERSLONG[@user.country-1][0]}"]

    headline = headline[message_type]
    message_long = message_long[message_type]
    
    
    session[:user_params].deep_merge!({:seen_headline => headline})
    session[:user_params].deep_merge!({:seen_message_long => message_long})
    
    if !@user.seen_multiple_messages && @user.seen_at
      session[:user_params].deep_merge!({:seen_message_1 => "@#{@user.account_name} FYI: " + message1})
      session[:user_params].deep_merge!({:seen_message_2 => "" })
    elsif @user.seen_multiple_messages && @user.seen_at
      session[:user_params].deep_merge!({:seen_message_1 => "@#{@user.account_name} FYI: " + message1})
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
  end
  
  def create
    session[:user_params].deep_merge!(params[:user]) if params[:user]
    @user = User.new(session[:user_params])
    @user.current_step = session[:user_step]
    if @user.current_step == "opinionleader"
      set_opinion_leader_text
      if (session[:user_params][:favorite_1_clicked].nil?)&&(session[:user_params][:favorite_2_clicked].nil?) && (session[:user_params][:retweet_2_clicked].nil?) && (session[:user_params][:retweet_1_clicked].nil?)
       generate_zeros

      end
    end
    if @user.current_step == "internet"
       generate_messages(@user.seen_seed[4])
    end
 
    #if @user.current_step == "twitter"
    #  render :js => "alert('Please remember! This is a simulation. None of your actions will be transmitted to your Twitter account. Please act as if you would be on Twitter. Thank you');"
    #end
    if @user.valid?
      if params[:back_button]
        @user.previous_step
      elsif @user.last_step?
        if @user.all_valid?
          @user.save
          Seed.delete(@user.situation)
        end
      else
        @user.next_step
      end
    end
    session[:user_step] = @user.current_step
    
    if @user.new_record? && @user.does_qualify?
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
