class UsersController < ApplicationController
  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def new
    session[:user_params] ||= {}
    @user = User.new(session[:user_params])
    @user.current_step = session[:user_step]
  end
  
  def retweet
    puts session[:user_params]
    session[:user_params].deep_merge!({:retweet_clicked => 1})
    respond_to do |format|
      format.js {
              render(:update) do |page|
                page.replace_html 'retweet', "Retweeted"
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
