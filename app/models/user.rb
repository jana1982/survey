class User < ActiveRecord::Base
  attr_accessible 	:bildung, :alter, :retweet_clicked, :at_clicked, :geschlecht, 
			:martial_status, :language, :country, :years, :twitter_account, :income, 
			:area, :children, :employment, :employment_text, :bildung_text, :position, :position_text,
			:organization, :organization_text, :private_pc, :private_mobile, :work_pc, :work_mobile,
			:public, :favorite_clicked, :leader_text, :reply_clicked, :reply_text, :tweet_text, :search,
			:retweet_time, :favorite_time, :message_hover_time, :reply_time, :new_tweet_time, :retweet_importance,
			:tweet_text_n
			
  attr_writer :current_step

  validates_presence_of :language, :if => :selection?
  validates_presence_of :twitter_account, :if => :selection?
  
  def current_step
      @current_step || steps.first
  end
  
  def selection?
    current_step == "selection"
  end
  
  def all_valid?
    steps.all? do |step|
      self.current_step = step
      valid?
    end
  end

  def steps
      %w[selection twitter target]
      #introduction demographic opinionleader interest 
  end
  
  def first_step?
    current_step == steps.first
  end
  
  def next_step
    self.current_step = steps[steps.index(current_step)+1]
  end
  
  def second_to_last?
    current_step == steps[steps.count-2]
  end
  
  def last_step?
    current_step == steps.last
  end
  
  def previous_step
    self.current_step = steps[steps.index(current_step)-1]
  end
  
  def does_qualify?
      if (language != nil && language < 5) || (twitter_account != nil && twitter_account < 2)
        return false
      else
        return true
      end
  end

  def twitter_step?
    current_step == 'twitter'
  end




end
