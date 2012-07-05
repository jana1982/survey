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
  


  def new
    session[:user_params] ||= {}
    @user = User.new(session[:user_params])
    @user.current_step = session[:user_step]
    
    @user.setup
    session[:user_params] = @user.to_hash  
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
  
  def reply3
    session[:user_params].deep_merge!({:reply_1_clicked => 1})
    respond_to do |format|
      format.js {
              render(:update) do |page|
                page.show 'reply_seite'
              end
            }
    end
  end
  
  def retweet
    number = params[:number].to_i
    session[:user_params].deep_merge!({:retweet_1_clicked => 1}) if number == 1
    session[:user_params].deep_merge!({:retweet_1_clicked => 1}) if number == 3
    session[:user_params].deep_merge!({:retweet_2_clicked => 1}) if number == 2
    respond_to do |format|
      format.js {
              render(:update) do |page|
                page.replace_html "retweet#{number}", image_tag('../images/retweet_clicked_g.png');
                page.replace_html "retweetexpand#{number}", image_tag('../images/retweet_clicked.png');
              end
            }
    end
  end
  
  
  def favorite
    number = params[:number].to_i
    session[:user_params].deep_merge!({:favorite_1_clicked => 1}) if number == 1
    session[:user_params].deep_merge!({:favorite_1_clicked => 1}) if number == 3
    session[:user_params].deep_merge!({:favorite_2_clicked => 1}) if number == 2
    respond_to do |format|
      format.js {
              render(:update) do |page|
                page.replace_html "favorite#{number}",  image_tag('../images/favorite_clicked_g.png');
                page.replace_html "favoriteexpand#{number}",  image_tag('../images/favorite_clicked.png');
              end
            }
    end    
  end


    
  def expand_message
    number = params[:number].to_i
    session[:user_params].deep_merge!({:expand_1_clicked => 1}) if number == 1
    session[:user_params].deep_merge!({:expand_2_clicked => 1}) if number == 2
    session[:user_params].deep_merge!({:expand_1_clicked => 1}) if number == 3
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
                page.hide "expand_page1" if number == 1
                page.hide "expand_page2" if number == 2
                page.hide "expand_page3" if number == 3
                page.hide 'connect_page';
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
  
  def connect
    puts session[:user_params]
    session[:user_params].deep_merge!({:connect_clicked => 1})
    respond_to do |format|
      format.js {
            render(:update) do |page|
            page.show 'connect_page'
          end
         }
    end    
  end

  
  def compose_tweet
      respond_to do |format|
      format.js {
              render(:update) do |page|
                page.show 'compose_tweet_seite'
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
    c = b.max { |a,b| a.last <=> b.last }.first
    session[:user_params].deep_merge!({:leader_text => c})
    return c
  end
 
  def create
    session[:user_params].deep_merge!(params[:user]) if params[:user]
    @user = User.new(session[:user_params])
    @user.current_step = session[:user_step]
    if @user.current_step == "opinionleader"
      set_opinion_leader_text
    end
    
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
