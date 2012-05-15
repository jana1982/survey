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
  
  def generate_random_message       
    message = ['Message: Schaden 0, Einfluss 0', 'Message: Schaden 1, Einfluss 0', 'Message: Schaden 0, Einfluss 1', 'Message: Schaden 1, Einfluss 1']
    random_message = message[rand(message.length)]
    return random_message   
  end
  
  def new
    session[:user_params] ||= {}
    @user = User.new(session[:user_params])
    
    #Generate a random message for the user if he has'nt one yet
    if @user.seen_message == nil
      @user.seen_message = generate_random_message
      session[:user_params].deep_merge!({:seen_message => @user.seen_message})
    end
    
    @user.current_step = session[:user_step]    
  end

  def reply
    puts session[:user_params]
    session[:user_params].deep_merge!({:reply_clicked => 1})
    respond_to do |format|
      format.js {
              render(:update) do |page|
                page.show 'reply_seite'
              end
            }
    end
    
  end 
  
  def retweet
    puts session[:user_params]
    session[:user_params].deep_merge!({:retweet_clicked => 1})
    respond_to do |format|
      format.js {
              render(:update) do |page|
                page.replace_html 'retweet', image_tag('../images/retweet_nachklick.png')
              end
            }
    end
    
  end
  
  def favorite
    puts session[:user_params]
    session[:user_params].deep_merge!({:favorite_clicked => 1})
    respond_to do |format|
      format.js {
              render(:update) do |page|
                page.replace_html 'favorite',  image_tag('../images/favorite_nachklick.png')
              end
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
    respond_to do |format|
      format.js {
              render(:update) do |page|
                page.hide 'reply_seite'
              end
            }
    end
    
  end
  
  def close_tweet
    respond_to do |format|
      format.js {
              render(:update) do |page|
                page.hide 'new_tweet_seite'
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
  
  def compose_tweet
      respond_to do |format|
      format.js {
              render(:update) do |page|
                page.show 'compose_tweet_seite'
              end
            }
    end
    
  end
  
  def close_compose
    respond_to do |format|
      format.js {
              render(:update) do |page|
              
                page.hide'compose_tweet_seite'
              end
            }
      end
  end

  
  def create
    session[:user_params].deep_merge!(params[:user]) if params[:user]
    @user = User.new(session[:user_params])
    @user.current_step = session[:user_step]
    if @user.valid?
      if params[:back_button]
        @user.previous_step
      elsif @user.last_step?
        @user.save if @user.all_valid?
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
