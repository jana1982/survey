class User < ActiveRecord::Base
  serialize :seen_seed
  
  attr_accessible 	:bildung, :alter, :geschlecht, 
			:martial_status, :language, :country, :years, :twitter_account, :income, 
			:area, :children, :employment, :employment_text, :bildung_text, :position, :position_text,
			:organization, :organization_text, :private_pc, :private_mobile, :work_pc, :work_mobile,
			:public, :leader_text, :reply_text, :reply_text2, :tweet_text, :search,
			:retweet_time_m1, :favorite_time_m1, :message_hover_m1, :open_time_m1, :reply_time_m1,
			:retweet_time_m2, :favorite_time_m2, :message_hover_m2, :open_time_m2, :reply_time_m2, 
			:new_tweet_time, :search_time,
			:experiment_time,
			:retweet_importance,
			:tweet_text_n,
			:seen_person,
			:seen_message_1,:seen_message_2,
			:seen_multiple_messages,:seen_at,
			:seen_retweet_message1, :seen_retweet_message2,
			:ol_1, :ol_2, :ol_3,  :ol_4, :ol_5, :ol_6,  :ol_7,  :ol_8, :ol_9,  :ol_10,  :ol_11, :ol_12, :ol_list, 
			:retweet_1_clicked, :favorite_1_clicked, :expand_1_clicked, :reply_1_clicked,:connect_clicked,
			:retweet_2_clicked, :favorite_2_clicked, :expand_2_clicked, :reply_2_clicked,
			:results, :situation,
			:account_name, :number_followers, :number_followeees, :number_messages,
			:avg_tweet_number, :avg_at_replies, :avg_read_tweets, :avg_stories, :avg_trend, :avg_retweet, :avg_follow,
			:avg_login, :avg_search_keywords, :avg_search_accounts, :avg_activities_friends, :avg_who_to_follow,
			:avg_browse_categories, :avg_find_friends, :avg_create_lists, :avg_add_accounts_lists, :avg_subscribe_lists,
			:avg_delete_accounts_lists, :avg_unfollow_account, :avg_favorite_tweets, :avg_private_replies,
			:surf_twitter_week, :surf_twitter_weekend,
			:seen_seed, :batch_id,
			
			:message_important, :message_meaningful, :message_for_me, :message_remember,:message_value,
			:message_relevant, :message_useful, :message_attention, :message_interest, :message_ideas, :message_helpful,
			:message_informative, 
			
			:intention1_write, :intention2_write, :intention3_write,
			:intention1_discover_stories, :intention2_discover_stories,:intention3_discover_stories,
			:intention1_discover_trends, :intention2_discover_trends, :intention3_discover_trends,
		        :intention1_follow, :intention2_follow, :intention3_follow, 
			:intention1_unfollow, :intention2_unfollow, :intention3_unfollow,
			:intention1_create_lists, :intention2_create_lists, :intention3_create_lists,
			:intention1_add_to_lists, :intention2_add_to_lists, :intention3_add_to_lists,
			:intention1_unsubscribe_lists, :intention2_unsubscribe_lists, :intention3_unsubscribe_lists,
			:intention1_subscribe_lists, :intention2_subscribe_lists,:intention3_subscribe_lists,
  
			:retweet_time_at, :message_hover_time_at, :open_time_at, :favorite_time_at, :reply_time_at,
			:open_clicked_at, :reply_clicked_at, :created_at, :updated_at, :reply_text_at, :favorite_at_clicked,
			:at_clicked, :retweet_at_clicked

  
  attr_writer :current_step
  attr_accessor :username
  
  def setup
    if first_step?
      seed = Seed.get_random_from_last_batch
      seed.dirty = true
      seed.time_setup = Time.now
      seed.save!
      self.situation = seed.id
      self.batch_id = seed.batch_id
      self.seen_seed = seed.content
      self.seen_person = seed.content[2]
      self.seen_retweet_message1 = seed.content[0]
      self.seen_multiple_messages = seed.content[1]
      self.seen_at = seed.content[3]
      generate_messages(seed.content[4])
    end
  end
  
  def to_hash
    hash = {}; self.attributes.each { |k,v| hash[k] = v }
  end
  
  validates_presence_of :language, :if => :selection?
  validates_presence_of :twitter_account, :if => :selection?
  
  def generate_messages(message_type)
    messages1 = ['Message: Schaden 0, Einfluss 0', 'Message: Schaden 1, Einfluss 0', 
      'Message: Schaden 0, Einfluss 1', 'Message: Schaden 1, Einfluss 1']
    messages2 = ['Message2: Schaden 0, Einfluss 0', 'Message2: Schaden 1, Einfluss 0', 
      'Message2: Schaden 0, Einfluss 1', 'Message2: Schaden 1, Einfluss 1']
    message1 = messages1[message_type]
    message2 = messages2[message_type]
    if !self.seen_multiple_messages && self.seen_at
      self.seen_message_1 = "@#{self.account_name} " + message1
      self.seen_message_2 = ""
    elsif self.seen_multiple_messages && self.seen_at
      self.seen_message_1 = "@#{self.account_name} " + message1
      self.seen_message_2  = message2 
    elsif self.seen_multiple_messages && !self.seen_at
      self.seen_message_1 = message1
      self.seen_message_2  = message2
    elsif !self.seen_multiple_messages && !self.seen_at
      self.seen_message_1 = message1
      self.seen_message_2  = ""
    end
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
      %w[ introduction  selection demographic internet opinionleader
	  test twitter message_relevance target]
      #   interest         
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
