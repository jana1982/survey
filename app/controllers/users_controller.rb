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

  def reply
    number = params[:number].to_i
    session[:user_params].deep_merge!({:reply_1_clicked => 1}) if number == 1
    session[:user_params].deep_merge!({:reply_2_clicked => 1}) if number == 2
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
                page.hide 'new_tweet_seite';
                page.hide 'compose_tweet_seite';
                page.hide "expand_page1" if number == 1
                page.hide "expand_page2" if number == 2
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
  
  #def generate_batch
  #  out = []
  #  (0..1).each do |a|
  #    (0..1).each do |b|
  #      (0..1).each do |c|
  #        (0..1).each do |d|
  #          (0..1).each do |e|
  #            (0..3).each do |f|
  #              out << [a,b,c,d,e,f]
  #            end
  #          end
  #        end
  #      end
  #    end
  #  end
  #  return  out 
  #end
  #
  #def last_user
  #  @last_user = User.last
  #end
  #
  #def batch
  #   batch = 0
  #  while true
  #      if b == [] or b == nil
  #        puts "Generation of new batch"
  #        batch += 1   
  #        b = generate_batch
  #      end
  #    show = b[rand(b.length)]
  #    puts "Batch #{batch} The user sees #{show}"
  #    b.delete_at(b.index(show))  
  #  end
  #    if e
  #    end
  #end
 

  
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
