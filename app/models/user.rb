require "csv"
class User < ActiveRecord::Base
  serialize :seen_seed
  serialize :interest_list
    
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
			:account_name, :twitter_privat_work, :number_followers, :number_followeees, :number_messages,
			:avg_tweet_number, :avg_at_replies, :avg_read_tweets, :avg_stories, :avg_trend, :avg_retweet, :avg_follow,
			:avg_login, :avg_search_keywords, :avg_search_accounts, :avg_activities_friends, :avg_who_to_follow,
			:avg_browse_categories, :avg_find_friends, :avg_create_lists, :avg_add_accounts_lists, :avg_subscribe_lists, :avg_unsubscribe_lists,
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
			:at_clicked, :retweet_at_clicked,
			
			:reason_nrt, :reason_nfav, :reason_nrep, :reason_nexp,
			:further_things_to_do, :further_things_in_simmulation,
			:mousetracks,
			
			:pass_time, :entertain_myself , :occupy_time, :time_bored, :forget_worries,
			:help_others, :support_others, :show_encouragement, :contribute,
			:new_friends, :new_people, :get_know_other, :keep_in_touch , :find_people, :communicate,
			:gather_information, :find_out_things, :look_for_information, :knowledgeable_individual, :answers_questions, 
			:keep_connect, :find_out, :deepen_relationships, :far_away,
			
			:interest_list,
			
			:other_sup_topic, :interior_policies, :foreign_aid, :regional_authorities, :nuclear_policies, :citizens_initiative, :defence, :elections, :referenda,
			:human_rights, :treaties, :parties, :constitution, :lobbying, :state_budget, :diplomacy, :other_str_sup_topic, :parliament, :espionage,
			:local_authorities, :government, :migration, :refugees,
			
			:slider, :dk_pol_percentage,
			
			:trad_mass_med_offline, :trad_mass_med_online, :person_contact_online,  :person_contact_offline, :self_aggregated,
			
			:tv, :radio, :magazin, :newspaper,
			
			:tv_website, :tv_sn, :tv_mb, :tv_rss, :tv_newsletter,
			:radio_website, :radio_sn, :radio_mb, :radio_rss, :radio_newsletter,
			:magazin_website, :magazin_sn, :magazin_mb, :magazin_rss, :magazin_newsletter,
			:newspaper_website, :newspaper_sn, :newspaper_mb, :newspaper_rss, :newspaper_newsletter,
			
			:people_interested, :locals, :aquaintances, :contact_friends, :colleagues, :experts, :contact_ol,
			
			:locals_mb, :locals_chat, :aquaintances_forum, :contact_ol_chat, :contact_ol_sn, :contact_ol_mb, :contact_friends_mb, :people_interested_chat,
			:contact_friends_chat, :colleagues_forum, :contact_friends_email, :contact_friends_forum, :locals_sn, :people_interested_forum, :contact_ol_email,
			:people_interested_email, :aquaintances_email, :experts_sn, :experts_email, :experts_forum, :aquaintances_mb, :aquaintances_sn, :colleagues_mb,
			:people_interested_mb, :locals_forum, :contact_friends_sn, :colleagues_email, :experts_chat, :colleagues_chat, :aquaintances_chat, :contact_ol_forum,
			:experts_mb, :locals_email, :colleagues_sn, :people_interested_sn,
			
			:community_site, :blogs, :goverment_site, :search_engine,
			
			:other_sources_txt, :other_sources,
			
			:came_across_same_intrest, :came_across_twitter_list, :heard_mass_media, :heard_internet, :read_retweet, :read_reply, :heard_friends_follow,
			:heard_friends_interact, :heard_friends_recommend, :heard_friends_write, :heard_friends_follow_nf, :heard_friends_interact_nf, :heard_friends_recommend_nf,
			:heard_friends_write_nf, :came_accross_wtf, :came_across_bc, :came_across_stories, :knew_friends, :knew_colleagues, :knew_aquaintances,
			:met_informal, :met_formal, :other_reasons, :other_reasons_txt



  
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
      self.interest_list = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17"]
    end
  end
  
  
  def to_hash
    hash = {}; self.attributes.each { |k,v| hash[k] = v }
  end
  
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
      %w[ introduction  selection  internet twitter_motivation opinionleader interest sources reasons_for_ol
	 twitter message_relevance demographic target]          
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
      does_not_qualify = false      
      # If the user does not seak english good enough
      if language != nil && language < 5
	does_not_qualify = true
      end      
      # If the user does not have an active twitter account
      if twitter_account != nil && twitter_account < 2
	does_not_qualify = true
      end      
      # If the user has not selected politcs as the first or second choice
      if current_step == "internet"
	if interest_list[0] == "11" || interest_list[1] == "11" || interest_list[2] == "11"
	  print "User did qualify"
	else	  
	  does_not_qualify = true
	end
      end      
      if does_not_qualify
        return false
      else
        return true
      end
  end

  def twitter_step?
    current_step == 'twitter'
  end

  def write_mousetracks
    outfile = File.open(RAILS_ROOT + "/log/" + self.id.to_s + ".csv", "w")
    CSV::Writer.generate(outfile) do |csv|
      mousetracks = self.mousetracks.split(";")
      mousetracks.each do |entry|
        points = entry.split(",")
        csv << [points[0],points[1],points[2]]
      end
    end
    outfile.close
  end  
    
end
