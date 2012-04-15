class User < ActiveRecord::Base
  attr_accessible 	:bildung, :alter, :retweed_clicked, :at_clicked, :geschlecht, 
			:martial_status, :language, :country, :years, :twitter_account
  attr_writer :current_step

  def current_step
      @current_step || steps.first
  end
  
  def steps
      %w[introduction filter2 demographic twitter target confirm]
  end
  
  def first_step?
    current_step == steps.first
  end
  
  def next_step
    self.current_step = steps[steps.index(current_step)+1]
  end
  def last_step?
    current_step == steps.last
  end
  
  def previous_step
    self.current_step = steps[steps.index(current_step)-1]
  end
  

end
