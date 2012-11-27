require "csv"
class User < ActiveRecord::Base
  serialize :seen_seed
  serialize :interest_list
  serialize :open_reasons
  
    
  attr_accessible 	:bildung, :alter, :geschlecht, 
			:martial_status, :language, :country, :years, :twitter_account, :income, 
			:area, :children, :employment, :employment_text, :bildung_text, :position, :position_text,
			:organization, :organization_text, :private_pc, :private_mobile, :work_pc, :work_mobile,
			:public, :leader_text, :reply_text, :reply_text2, :tweet_text, :search,
			:retweet_time_m1, :favorite_time_m1, :message_hover_m1, :open_time_m1, :reply_time_m1, :follow_m1,
			:retweet_time_m2, :favorite_time_m2, :message_hover_m2, :open_time_m2, :reply_time_m2, :follow_m2,
			:new_tweet_time, :search_time,
			:experiment_time,
			:tweet_text_n,
			:seen_person,
			:seen_message_1, :seen_message_2, :seen_headline, :seen_message_long,
			:seen_multiple_messages, :seen_at,
			:seen_retweet_message1, 
			:ol_1, :ol_2, :ol_3,  :ol_4, :ol_5, :ol_6,  :ol_7,  :ol_8, :ol_9,  :ol_10,  :ol_11, :ol_12,
			:retweet_1_clicked, :favorite_1_clicked, :expand_1_clicked, :reply_1_clicked,
			:retweet_2_clicked, :favorite_2_clicked, :expand_2_clicked, :reply_2_clicked, :link_clicked,
			:follow_1_clicked, :follow_2_clicked, :new_tweet_clicked, :compose_tweet_clicked, :search_clicked,
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
  
			
			:created_at, :updated_at, 
			
			:reason_nrt, :reason_nfav, :reason_nrep, :reason_nexp,
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
			
			:trad_mass_med_online, :person_contact_online, :self_aggregated,
			
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
			:experts_mb, :locals_email, :colleagues_sn, :people_interested_sn, :people_interested_phone, :locals_phone, :aquaintances_phone,
			:contact_friends_phone, :colleagues_phone, :experts_phone, :contact_ol_phone, 
			
			:community_site, :blogs, :goverment_site, :search_engine,
			
			:other_sources_txt, :other_sources,
			
			:came_across_same_intrest, :came_across_twitter_list, :heard_mass_media, :heard_internet, :read_retweet, :read_reply, :heard_friends_follow,
			:heard_friends_interact, :heard_friends_recommend, :heard_friends_write, :heard_friends_follow_nf, :heard_friends_interact_nf, :heard_friends_recommend_nf,
			:heard_friends_write_nf, :came_accross_wtf, :came_across_bc, :came_across_stories, :knew_friends, :knew_colleagues, :knew_aquaintances,
			:met_informal, :met_formal, :other_reasons, :other_reasons_txt,
			
			:reply_pr_relevant, :reply_pr_meaningful, :reply_pr_important, :reply_pr_significant,
			:reply_oc_relevant, :reply_oc_meaningful, :reply_oc_important, :reply_oc_significant,
			:favorite_pr_relevant, :favorite_pr_meaningful, :favorite_pr_important, :favorite_pr_significant,
			:favorite_oc_relevant, :favorite_oc_meaningful, :favorite_oc_important, :favorite_oc_significant,
			:retweet_pr_relevant, :retweet_pr_meaningful, :retweet_pr_important, :retweet_pr_significant, 
			:retweet_oc_relevant, :retweet_oc_meaningful, :retweet_oc_important, :retweet_oc_significant,
			
			:retweet_pr_important_ck, :retweet_pr_relevant_ck, :retweet_pr_significant_ck, :retweet_pr_meaningful_ck,
			:retweet_oc_important_ck, :retweet_oc_relevant_ck, :retweet_oc_significant_ck, :retweet_oc_meaningful_ck,
			:favorite_pr_significant_ck, :favorite_pr_meaningful_ck, :favorite_pr_relevant_ck, :favorite_pr_important_ck,
			:favorite_oc_relevant_ck, :favorite_oc_important_ck, :favorite_oc_significant_ck, :favorite_oc_meaningful_ck,
			:reply_pr_relevant_ck, :reply_pr_important_ck, :reply_pr_significant_ck, :reply_pr_meaningful_ck,
			:reply_oc_relevant_ck, :reply_oc_significant_ck,  :reply_oc_meaningful_ck, :reply_oc_important_ck,
			
			:open_reasons_others, :open_reasons,
			:email

  attr_writer :current_step
  attr_accessor :username
  
  def self.csv_export
    filename = "twitter_database_export.csv"
    CSV.open(filename, "w") do |csv|
    	csv << ["ID",
		"P1_language", "P1_twitter_account", "P1_interest_list",
		"P2_bildung", "P2_geschlecht", "P2_alter", "P2_martial_status", "P2_children", "P2_country", "P2_years", "P2_area", "P2_income", "P2_employment", "P2_position", "P2_organization", "P2_private_pc",
		"P3_account_name", "P3_twitter_privat_work", "P3_number_followers", "P3_number_followeees", "P3_number_messages", "P3_avg_login", "P3_avg_tweet_number", "P3_avg_retweet", "P3_avg_at_replies", "P3_avg_private_replies", "P3_avg_favorite_tweets", "P3_avg_read_tweets", "P3_avg_stories", "P3_avg_trend", "P3_avg_search_keywords", "P3_avg_follow", "P3_avg_unfollow_account", "P3_avg_search_accounts", "P3_avg_who_to_follow", "P3_avg_browse_categories", "P3_avg_find_friends", "P3_avg_activities_friends", "P3_avg_create_lists", "P3_avg_add_accounts_lists", "P3_avg_subscribe_lists", "P3_avg_unsubscribe_lists", "P3_avg_delete_accounts_lists",
		"P4_pass_time", "P4_entertain_myself", "P4_occupy_time", "P4_time_bored", "P4_forget_worries", "P4_help_others", "P4_support_others", "P4_show_encouragement", "P4_contribute", "P4_new_friends", "P4_new_people", "P4_get_know_other", "P4_keep_in_touch", "P4_find_people", "P4_communicate", "P4_gather_information", "P4_find_out_things", "P4_look_for_information", "P4_knowledgeable_individual", "P4_answers_questions", "P4_keep_connect", "P4_find_out", "P4_deepen_relationships", "P4_far_away",
		"P5_ol_1", "P5_ol_2", "P5_ol_3", "P5_ol_4", "P5_ol_5", "P5_ol_6", "P5_ol_7", "P5_ol_8", "P5_ol_9", "P5_ol_10", "P5_ol_11", "P5_ol_12", "P5_leader_text",
		"P6_defence", "P6_diplomacy", "P6_elections", "P6_espionage", "P6_foreign_aid", "P6_government", "P6_human_rights", "P6_local_authorities", "P6_parliament", "P6_parties", "P6_refugees", "P6_regional_authorities", "P6_state_budget", "P6_treaties", "P6_constitution", "P6_interior_policies", "P6_migration", "P6_citizens_initiative", "P6_referenda", "P6_nuclear_policies", "P6_lobbying", "P6_other_sup_topic", "P6_other_str_sup_topic", "P6_slider", "P6_dk_pol_percentage",
		"P7_trad_mass_med_online", "P7_1_tv_website", "P7_1_tv_sn", "P7_1_tv_mb", "P7_1_tv_rss", "P7_1_tv_newsletter", "P7_1_tv", "P7_1_radio_website", "P7_1_radio_sn", "P7_1_radio_mb", "P7_1_radio_rss", "P7_1_radio_newsletter", "P7_1_radio", "P7_1_magazin_website", "P7_1_magazin_sn", "P7_1_magazin_mb", "P7_1_magazin_rss", "P7_1_magazin_newsletter", "P7_1_magazin", "P7_1_newspaper_website", "P7_1_newspaper_sn", "P7_1_newspaper_mb", "P7_1_newspaper_rss", "P7_1_newspaper_newsletter", "P7_1_newspaper",
		"P7_person_contact_online", "P7_2_people_interested_email", "P7_2_people_interested_sn", "P7_2_people_interested_mb", "P7_2_people_interested_forum", "P7_2_people_interested_chat", "P7_2_people_interested_phone", "P7_2_people_interested", "P7_2_locals_email", "P7_2_locals_sn", "P7_2_locals_mb", "P7_2_locals_forum", "P7_2_locals_chat", "P7_2_locals_phone", "P7_2_locals", "P7_2_aquaintances_email", "P7_2_aquaintances_sn", "P7_2_aquaintances_mb", "P7_2_aquaintances_forum", "P7_2_aquaintances_chat", "P7_2_aquaintances_phone", "P7_2_aquaintances", "P7_2_contact_friends_email", "P7_2_contact_friends_sn", "P7_2_contact_friends_mb", "P7_2_contact_friends_forum", "P7_2_contact_friends_chat", "P7_2_contact_friends_phone", "P7_2_contact_friends", "P7_2_colleagues_email", "P7_2_colleagues_sn", "P7_2_colleagues_mb", "P7_2_colleagues_forum", "P7_2_colleagues_chat", "P7_2_colleagues_phone", "P7_2_colleagues", "P7_2_experts_email", "P7_2_experts_sn", "P7_2_experts_mb", "P7_2_experts_forum", "P7_2_experts_chat", "P7_2_experts_phone", "P7_2_experts", "P7_2_contact_ol_email", "P7_2_contact_ol_sn", "P7_2_contact_ol_mb", "P7_2_contact_ol_forum", "P7_2_contact_ol_chat", "P7_2_contact_ol_phone", "P7_2_contact_ol",
		"P7_self_aggregated", "P7_3_blogs", "P7_3_search_engine", "P7_3_goverment_site", "P7_3_community_site", "P7_other_sources", "P7_other_sources_txt",
		"P8_heard_mass_media", "P8_knew_colleagues", "P8_read_retweet", "P8_came_accross_wtf", "P8_knew_aquaintances", "P8_came_across_bc", "P8_heard_friends_write", "P8_1_heard_friends_write_nf", "P8_met_informal", "P8_knew_friends", "P8_heard_friends_interact", "P8_2_heard_friends_interact_nf", "P8_read_reply", "P8_came_across_twitter_list", "P8_heard_internet", "P8_came_across_same_intrest", "P8_heard_friends_recommend", "P8_3_heard_friends_recommend_nf", "P8_met_formal", "P8_came_across_stories", "P8_heard_friends_follow", "P8_4_heard_friends_follow_nf", "P8_other_reasons", "P8_other_reasons_txt",
		"P9_A_follow_1_clicked", "P9_A_follow_m1", "P9_A_follow_2_clicked", "P9_A_follow_m2", "P9_A_reply_1_clicked", "P9_A_reply_text", "P9_A_reply_time_m1", "P9_A_reply_2_clicked", "P9_A_reply_text2", "P9_A_reply_time_m2", "P9_A_retweet_1_clicked", "P9_A_retweet_time_m1", "P9_A_retweet_2_clicked", "P9_A_retweet_time_m2", "P9_A_favorite_1_clicked", "P9_A_favorite_time_m1", "P9_A_favorite_2_clicked", "P9_A_favorite_time_m2", "P9_A_expand_1_clicked", "P9_A_open_time_m1", "P9_A_expand_2_clicked", "P9_A_open_time_m2", "P9_A_new_tweet_clicked", "P9_A_tweet_text_n", "P9_A_compose_tweet_clicked", "P9_A_tweet_text", "P9_A_new_tweet_time", "P9_A_search_clicked", "P9_A_search", "P9_A_search_time", "P9_A_link_clicked", "P9_A_message_hover_m1", "P9_A_message_hover_m2", "P9_A_mousetracks",
		"P9_M_batch_id", "P9_M_seen_seed", "P9_M_situation", "P9_M_seen_retweet_message1", "P9_M_seen_multiple_messages", "P9_M_seen_person", "P9_M_seen_at", "P9_M_seen_message_1", "P9_M_seen_message_2", "P9_M_seen_headline", "P9_M_seen_message_long",
		"P10_message_important", "P10_message_meaningful", "P10_message_for_me", "P10_message_remember", "P10_message_value", "P10_message_relevant", "P10_message_useful", "P10_message_attention", "P10_message_interest", "P10_message_ideas", "P10_message_helpful", "P10_message_informative",
		"P10_retweet_pr_relevant", "P10_retweet_pr_relevant_ck", "P10_retweet_pr_meaningful", "P10_retweet_pr_meaningful_ck", "P10_retweet_pr_important", "P10_retweet_pr_important_ck", "P10_retweet_pr_significant", "P10_retweet_pr_significant_ck", "P10_retweet_oc_relevant", "P10_retweet_oc_relevant_ck", "P10_retweet_oc_meaningful", "P10_retweet_oc_meaningful_ck", "P10_retweet_oc_important", "P10_retweet_oc_important_ck", "P10_retweet_oc_significant", "P10_retweet_oc_significant_ck", "P10_reason_nrt",
		"P10_favorite_pr_relevant", "P10_favorite_pr_relevant_ck", "P10_favorite_pr_meaningful", "P10_favorite_pr_meaningful_ck", "P10_favorite_pr_important", "P10_favorite_pr_important_ck", "P10_favorite_pr_significant", "P10_favorite_pr_significant_ck", "P10_favorite_oc_relevant", "P10_favorite_oc_relevant_ck", "P10_favorite_oc_meaningful", "P10_favorite_oc_meaningful_ck", "P10_favorite_oc_important", "P10_favorite_oc_important_ck", "P10_favorite_oc_significant", "P10_favorite_oc_significant_ck", "P10_reason_nfav",
		"P10_open_reasons", "P10_open_reasons_others", "P10_reason_nexp",
		"P10_reply_pr_relevant", "P10_reply_pr_relevant_ck", "P10_reply_pr_meaningful", "P10_reply_pr_meaningful_ck", "P10_reply_pr_important", "P10_reply_pr_important_ck", "P10_reply_pr_significant", "P10_reply_pr_significant_ck", "P10_reply_oc_relevant", "P10_reply_oc_relevant_ck", "P10_reply_oc_meaningful", "P10_reply_oc_meaningful_ck", "P10_reply_oc_important", "P10_reply_oc_important_ck", "P10_reply_oc_significant", "P10_reply_oc_significant_ck", "P10_reason_nrep",
		"P11_intention1_write", "P11_intention2_write", "P11_intention3_write", "P11_intention1_discover_stories", "P11_intention2_discover_stories", "P11_intention3_discover_stories", "P11_intention1_discover_trends", "P11_intention2_discover_trends", "P11_intention3_discover_trends", "P11_intention1_follow", "P11_intention2_follow", "P11_intention3_follow", "P11_intention1_unfollow", "P11_intention2_unfollow", "P11_intention3_unfollow", "P11_intention1_create_lists", "P11_intention2_create_lists", "P11_intention3_create_lists", "P11_intention1_add_to_lists", "P11_intention2_add_to_lists", "P11_intention3_add_to_lists", "P11_intention1_unsubscribe_lists", "P11_intention2_unsubscribe_lists", "P11_intention3_unsubscribe_lists", "P11_intention1_subscribe_lists", "P11_intention2_subscribe_lists", "P11_intention3_subscribe_lists",
		"P12_results", "P12_email"]
    	User.all.each do |user|
	    csv << [user.id,
		user.language, user.twitter_account, user.interest_list,
		user.bildung, user.geschlecht, user.alter, user.martial_status, user.children, user.country, user.years, user.area, user.income, user.employment, user.position, user.organization, user.private_pc,
		user.account_name, user.twitter_privat_work, user.number_followers, user.number_followeees, user.number_messages, user.avg_login, user.avg_tweet_number, user.avg_retweet, user.avg_at_replies, user.avg_private_replies, user.avg_favorite_tweets, user.avg_read_tweets, user.avg_stories, user.avg_trend, user.avg_search_keywords, user.avg_follow, user.avg_unfollow_account, user.avg_search_accounts, user.avg_who_to_follow, user.avg_browse_categories, user.avg_find_friends, user.avg_activities_friends, user.avg_create_lists, user.avg_add_accounts_lists, user.avg_subscribe_lists, user.avg_unsubscribe_lists, user.avg_delete_accounts_lists,
		user.pass_time, user.entertain_myself, user.occupy_time, user.time_bored, user.forget_worries, user.help_others, user.support_others, user.show_encouragement, user.contribute, user.new_friends, user.new_people, user.get_know_other, user.keep_in_touch, user.find_people, user.communicate, user.gather_information, user.find_out_things, user.look_for_information, user.knowledgeable_individual, user.answers_questions, user.keep_connect, user.find_out, user.deepen_relationships, user.far_away,
		user.ol_1, user.ol_2, user.ol_3, user.ol_4, user.ol_5, user.ol_6, user.ol_7, user.ol_8, user.ol_9, user.ol_10, user.ol_11, user.ol_12, user.leader_text,
		user.defence, user.diplomacy, user.elections, user.espionage, user.foreign_aid, user.government, user.human_rights, user.local_authorities, user.parliament, user.parties, user.refugees, user.regional_authorities, user.state_budget, user.treaties, user.constitution, user.interior_policies, user.migration, user.citizens_initiative, user.referenda, user.nuclear_policies, user.lobbying, user.other_sup_topic, user.other_str_sup_topic, user.slider, user.dk_pol_percentage,
		user.trad_mass_med_online, user.tv_website, user.tv_sn, user.tv_mb, user.tv_rss, user.tv_newsletter, user.tv, user.radio_website, user.radio_sn, user.radio_mb, user.radio_rss, user.radio_newsletter, user.radio, user.magazin_website, user.magazin_sn, user.magazin_mb, user.magazin_rss, user.magazin_newsletter, user.magazin, user.newspaper_website, user.newspaper_sn, user.newspaper_mb, user.newspaper_rss, user.newspaper_newsletter, user.newspaper,
		user.person_contact_online, user.people_interested_email, user.people_interested_sn, user.people_interested_mb, user.people_interested_forum, user.people_interested_chat, user.people_interested_phone, user.people_interested, user.locals_email, user.locals_sn, user.locals_mb, user.locals_forum, user.locals_chat, user.locals_phone, user.locals, user.aquaintances_email, user.aquaintances_sn, user.aquaintances_mb, user.aquaintances_forum, user.aquaintances_chat, user.aquaintances_phone, user.aquaintances, user.contact_friends_email, user.contact_friends_sn, user.contact_friends_mb, user.contact_friends_forum, user.contact_friends_chat, user.contact_friends_phone, user.contact_friends, user.colleagues_email, user.colleagues_sn, user.colleagues_mb, user.colleagues_forum, user.colleagues_chat, user.colleagues_phone, user.colleagues, user.experts_email, user.experts_sn, user.experts_mb, user.experts_forum, user.experts_chat, user.experts_phone, user.experts, user.contact_ol_email, user.contact_ol_sn, user.contact_ol_mb, user.contact_ol_forum, user.contact_ol_chat, user.contact_ol_phone, user.contact_ol,
		user.self_aggregated, user.blogs, user.search_engine, user.goverment_site, user.community_site, user.other_sources, user.other_sources_txt,
		user.heard_mass_media, user.knew_colleagues, user.read_retweet, user.came_accross_wtf, user.knew_aquaintances, user.came_across_bc, user.heard_friends_write, user.heard_friends_write_nf, user.met_informal, user.knew_friends, user.heard_friends_interact, user.heard_friends_interact_nf, user.read_reply, user.came_across_twitter_list, user.heard_internet, user.came_across_same_intrest, user.heard_friends_recommend, user.heard_friends_recommend_nf, user.met_formal, user.came_across_stories, user.heard_friends_follow, user.heard_friends_follow_nf, user.other_reasons, user.other_reasons_txt,
		user.follow_1_clicked, user.follow_m1, user.follow_2_clicked, user.follow_m2, user.reply_1_clicked, user.reply_text, user.reply_time_m1, user.reply_2_clicked, user.reply_text2, user.reply_time_m2, user.retweet_1_clicked, user.retweet_time_m1, user.retweet_2_clicked, user.retweet_time_m2, user.favorite_1_clicked, user.favorite_time_m1, user.favorite_2_clicked, user.favorite_time_m2, user.expand_1_clicked, user.open_time_m1, user.expand_2_clicked, user.open_time_m2, user.new_tweet_clicked, user.tweet_text_n, user.compose_tweet_clicked, user.tweet_text, user.new_tweet_time, user.search_clicked, user.search, user.search_time, user.link_clicked, user.message_hover_m1, user.message_hover_m2, user.mousetracks,
		user.batch_id, user.seen_seed, user.situation, user.seen_retweet_message1, user.seen_multiple_messages, user.seen_person, user.seen_at, user.seen_message_1, user.seen_message_2, user.seen_headline, user.seen_message_long,
		user.message_important, user.message_meaningful, user.message_for_me, user.message_remember, user.message_value, user.message_relevant, user.message_useful, user.message_attention, user.message_interest, user.message_ideas, user.message_helpful, user.message_informative,
		user.retweet_pr_relevant, user.retweet_pr_relevant_ck, user.retweet_pr_meaningful, user.retweet_pr_meaningful_ck, user.retweet_pr_important, user.retweet_pr_important_ck, user.retweet_pr_significant, user.retweet_pr_significant_ck, user.retweet_oc_relevant, user.retweet_oc_relevant_ck, user.retweet_oc_meaningful, user.retweet_oc_meaningful_ck, user.retweet_oc_important, user.retweet_oc_important_ck, user.retweet_oc_significant, user.retweet_oc_significant_ck, user.reason_nrt,
		user.favorite_pr_relevant, user.favorite_pr_relevant_ck, user.favorite_pr_meaningful, user.favorite_pr_meaningful_ck, user.favorite_pr_important, user.favorite_pr_important_ck, user.favorite_pr_significant, user.favorite_pr_significant_ck, user.favorite_oc_relevant, user.favorite_oc_relevant_ck, user.favorite_oc_meaningful, user.favorite_oc_meaningful_ck, user.favorite_oc_important, user.favorite_oc_important_ck, user.favorite_oc_significant, user.favorite_oc_significant_ck, user.reason_nfav,
		user.open_reasons, user.open_reasons_others, user.reason_nexp,
		user.reply_pr_relevant, user.reply_pr_relevant_ck, user.reply_pr_meaningful, user.reply_pr_meaningful_ck, user.reply_pr_important, user.reply_pr_important_ck, user.reply_pr_significant, user.reply_pr_significant_ck, user.reply_oc_relevant, user.reply_oc_relevant_ck, user.reply_oc_meaningful, user.reply_oc_meaningful_ck, user.reply_oc_important, user.reply_oc_important_ck, user.reply_oc_significant, user.reply_oc_significant_ck, user.reason_nrep,
		user.intention1_write, user.intention2_write, user.intention3_write, user.intention1_discover_stories, user.intention2_discover_stories, user.intention3_discover_stories, user.intention1_discover_trends, user.intention2_discover_trends, user.intention3_discover_trends, user.intention1_follow, user.intention2_follow, user.intention3_follow, user.intention1_unfollow, user.intention2_unfollow, user.intention3_unfollow, user.intention1_create_lists, user.intention2_create_lists, user.intention3_create_lists, user.intention1_add_to_lists, user.intention2_add_to_lists, user.intention3_add_to_lists, user.intention1_unsubscribe_lists, user.intention2_unsubscribe_lists, user.intention3_unsubscribe_lists, user.intention1_subscribe_lists, user.intention2_subscribe_lists, user.intention3_subscribe_lists,
		user.results, user.email]
    	end
    end
  end

  def setup
    if first_step?
      if Seed.count == 0
        %x[rake create_seeds]
      end
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
      self.open_reasons = [1, 2, 3, 4, 5]
    end
  end
  
  
  def to_hash
    hash = {}; self.attributes.each { |k,v| hash[k] = v }
  end
  
  validates_presence_of 	:language, :if => :selection?
  validates_presence_of 	:twitter_account, :if => :selection?
  validates_inclusion_of 	:country, :in => 1..196, :if => :demographic?, :message => "is missing. Please select the country you currently live."
  validates_presence_of		:account_name, :if => :internet?, :message => "can't be blank. If you absolutely don't trust the guarantied anonymization of this questionnaire, please insert a name you can identify with.", :if => :internet?
  validates_format_of 		:account_name, :with => /^[a-zA-Z0-9_]*$/i, :message => "is invalid. Usernames of Twitter users contain only alphanumeric characters.", :if => :internet?
 
  validates_numericality_of 	:number_followers, :allow_nil => true, :allow_blank => true, :if => :internet? 
  validates_numericality_of	:number_followeees, :allow_nil => true, :allow_blank => true, :if => :internet? 
  validates_numericality_of	:number_messages, :allow_nil => true, :allow_blank => true, :if => :internet?
  validates_numericality_of 	:surf_twitter_week, :allow_nil => true, :allow_blank => true, :if => :internet?
  validates_numericality_of 	:surf_twitter_weekend, :allow_nil => true, :allow_blank => true, :if => :internet?
  validates_format_of 		:surf_twitter_week, :with => /^[0-1]?[0-9](\.\d+)?$/i, :allow_nil => true, :allow_blank => true, :message => "is invalid. Please insert a number between 0 and 19. You can use . to separate decimal places.", :if => :internet?
  validates_format_of 		:surf_twitter_weekend, :with => /^[0-1]?[0-9](\.\d+)?$/i, :allow_nil => true, :allow_blank => true, :message => "is invalid. Please insert a number between 0 and 19. You can use . to separate decimal places.", :if => :internet?
  validates_format_of 		:email, :with => /\b[A-Z0-9._%-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b/i, :allow_nil => true, :allow_blank => true, :message => "is invalid. We cant get back to you without your correct email address. If you are not interested in the results you can leave the field blank.", :if => :target?
    
  validates_format_of 	:ol_1, :if => :opinionleader?, :unless => proc{|obj| obj.ol_1.blank?}, 	:with => /^[a-zA-Z0-9_]*$/i,  :message => "is invalid. Usernames of Twitter users contain only alphanumeric characters."
  validates_format_of 	:ol_2, :if => :opinionleader?, :unless => proc{|obj| obj.ol_2.blank?},	:with => /^[a-zA-Z0-9_]*$/i,  :message => "is invalid. Usernames of Twitter users contain only alphanumeric characters."
  validates_format_of 	:ol_3, :if => :opinionleader?, :unless => proc{|obj| obj.ol_3.blank?},	:with => /^[a-zA-Z0-9_]*$/i,  :message => "is invalid. Usernames of Twitter users contain only alphanumeric characters."
  validates_format_of 	:ol_4, :if => :opinionleader?, :unless => proc{|obj| obj.ol_4.blank?},	:with => /^[a-zA-Z0-9_]*$/i,  :message => "is invalid. Usernames of Twitter users contain only alphanumeric characters."
  validates_format_of 	:ol_5, :if => :opinionleader?, :unless => proc{|obj| obj.ol_5.blank?},	:with => /^[a-zA-Z0-9_]*$/i,  :message => "is invalid. Usernames of Twitter users contain only alphanumeric characters."
  validates_format_of 	:ol_6, :if => :opinionleader?, :unless => proc{|obj| obj.ol_6.blank?},	:with => /^[a-zA-Z0-9_]*$/i,  :message => "is invalid. Usernames of Twitter users contain only alphanumeric characters."
  validates_format_of 	:ol_7, :if => :opinionleader?, :unless => proc{|obj| obj.ol_7.blank?},	:with => /^[a-zA-Z0-9_]*$/i,  :message => "is invalid. Usernames of Twitter users contain only alphanumeric characters."
  validates_format_of 	:ol_8, :if => :opinionleader?, :unless => proc{|obj| obj.ol_8.blank?},	:with => /^[a-zA-Z0-9_]*$/i,  :message => "is invalid. Usernames of Twitter users contain only alphanumeric characters."
  validates_format_of 	:ol_9, :if => :opinionleader?, :unless => proc{|obj| obj.ol_9.blank?},	:with => /^[a-zA-Z0-9_]*$/i,  :message => "is invalid. Usernames of Twitter users contain only alphanumeric characters."
  validates_format_of 	:ol_10, :if => :opinionleader?, :unless => proc{|obj| obj.ol_10.blank?},	:with => /^[a-zA-Z0-9_]*$/i,  :message => "is invalid. Usernames of Twitter users contain only alphanumeric characters."
  validates_format_of 	:ol_11, :if => :opinionleader?, :unless => proc{|obj| obj.ol_11.blank?},	:with => /^[a-zA-Z0-9_]*$/i,  :message => "is invalid. Usernames of Twitter users contain only alphanumeric characters."
  validates_format_of 	:ol_12, :if => :opinionleader?, :unless => proc{|obj| obj.ol_12.blank?},	:with => /^[a-zA-Z0-9_]*$/i,  :message => "is invalid. Usernames of Twitter users contain only alphanumeric characters."
  validate 		:at_least_one_ol, :if => :opinionleader?
    
  def at_least_one_ol
      if (ol_1.blank? & ol_2.blank? & ol_3.blank? & ol_4.blank? & ol_5.blank? & ol_6.blank? & ol_7.blank? & ol_8.blank? & ol_9.blank? & ol_10.blank? & ol_11.blank? & ol_12.blank?)
        errors.add_to_base("Specify at least one field")
      end
  end
  
  def current_step
      @current_step || steps.first
  end
  
  def selection?
    current_step == "selection"
  end
  
  def demographic?
    current_step == "demographic"
  end
  
  def internet?
    current_step == "internet"
  end

  def opinionleader?
   current_step == "opinionleader"
  end
  
  def target?
   current_step == "target"
  end
   
  def all_valid?
    steps.all? do |step|
      self.current_step = step
      valid?
    end
  end

  def steps
      %w[ introduction  selection demographic internet twitter_motivation opinionleader interest sources reasons_for_ol
	 twitter message_relevance target_variables target]          
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
      # If Country is one of those without defence ministry
      if current_step == "internet"
	if country == 4 || country == 15 || country == 20 || country == 38 || country == 41 || country == 49 || country == 68 || country == 89 || country == 101 || country == 110 || country == 111 || country == 115 || country == 117 || country == 124 || country == 134 || country == 135 || country == 146 || country == 147 || country == 148 || country == 149 || country == 150 || country == 160 || country == 176 || country == 182 || country == 190 || country == 191
	does_not_qualify = true
	end 
      end
      if current_step == "twitter_motivation"
	if avg_login == 6
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
