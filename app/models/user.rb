class User < ActiveRecord::Base
  attr_accessible 	:bildung, :alter, :geschlecht, 
			:martial_status, :language, :country, :years, :twitter_account, :income, 
			:area, :children, :employment, :employment_text, :bildung_text, :position, :position_text,
			:organization, :organization_text, :private_pc, :private_mobile, :work_pc, :work_mobile,
			:public, :leader_text, :reply_text, :tweet_text, :search,
			:retweet_time, :favorite_time, :message_hover_time, :reply_time, :new_tweet_time, :retweet_importance,
			:tweet_text_n,
			:seen_person,
			:seen_message_1,:seen_message_2,
			:seen_multiple_messages,:seen_at,
			:seen_retweet_message1, :seen_retweet_message2,
			:ol_1, :ol_2, :ol_3,  :ol_4, :ol_5, :ol_6,  :ol_7,  :ol_8, :ol_9,  :ol_10,  :ol_11, :ol_12, :ol_list, 
			:open_time, :search_time,  :experiment_time, :connect_clicked,
			:retweet_1_clicked, :favorite_1_clicked, :expand_1_clicked, :reply_1_clicked,
			:retweet_2_clicked, :favorite_2_clicked, :expand_2_clicked, :reply_2_clicked,
			:results
  attr_writer :current_step
  attr_accessor :username
  
  def setup
    if first_step?
      self.username = "plotti"
      #self.seen_situation = show
      self.seen_retweet_message1 = generate_random_retweet
      self.seen_retweet_message2 = generate_random_retweet
      self.seen_multiple_messages = generate_random_themes
      self.seen_at = true
      self.seen_person = generate_random_person
      generate_messages
    end
  end
  
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
  #end
  
  def to_hash
    hash = {}; self.attributes.each { |k,v| hash[k] = v }
  end
  
  validates_presence_of :language, :if => :selection?
  validates_presence_of :twitter_account, :if => :selection?
  
  def generate_messages   
    messages1 = ['Message: Schaden 0, Einfluss 0', 'Message: Schaden 1, Einfluss 0', 
      'Message: Schaden 0, Einfluss 1', 'Message: Schaden 1, Einfluss 1']
    messages2 = ['Message2: Schaden 0, Einfluss 0', 'Message2: Schaden 1, Einfluss 0', 
      'Message2: Schaden 0, Einfluss 1', 'Message2: Schaden 1, Einfluss 1']
    message1 = messages1[rand(messages1.length)]
    message2 = messages2[messages1.index(message1)]
    if !self.seen_multiple_messages && self.seen_at
      self.seen_message_1 = "@#{self.username} " + message1
      self.seen_message_2 = ""
    elsif self.seen_multiple_messages && self.seen_at
      self.seen_message_1 = "@#{self.username} " + message1
      self.seen_message_2  = message1
    elsif self.seen_multiple_messages && !self.seen_at
      self.seen_message_1 = message1
      self.seen_message_2  = message2
    elsif !self.seen_multiple_messages && !self.seen_at
      self.seen_message_1 = message1
      self.seen_message_2  = ""
    end
  end
  
  def generate_random_person       

    person = [self.leader_text, 'Friend']
    
  end

  
  def generate_random_retweet
    rt = [true, false]
    rt[rand(rt.length)]
  end
  
  def generate_random_at     
    at = [true, false]
    at[rand(at.length)]
  end
  
  def generate_random_themes    
    themen = ['one', 'more']
    themen[rand(themen.length)]
  end
  

  
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
      %w[selection opinionleader test twitter target]
      #introduction demographic  interest 
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
