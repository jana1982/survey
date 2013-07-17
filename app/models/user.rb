require "csv"
ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
  "<span class='field_error'>#{html_tag}<sup><big>*</big></sup></span>"
end
#ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
#  error_text = ""
#  errors = instance.object.errors.on(instance.method_name)
#  if errors
#    errors.to_a.each do |error|
#      error_text << "<p class=\"error\">#{error}</p>"
#    end
#  end
#  "<div class=\"errors\">#{error_text}</div>#{html_tag}"
#end
class User < ActiveRecord::Base
  serialize :seen_seed
  serialize :interest_list
  serialize :open_reasons
  serialize :rank_source
  set_primary_key :id
  
    
  attr_accessible 	:bildung, :alter, :geschlecht, 
			:martial_status, :language, :country, :years, :twitter_account, :income, 
			:area, :children, :employment, :employment_text, :bildung_still_study, :position, :position_text,
			:organization, :organization_text, :private_pc, :private_mobile, :work_pc, :work_mobile,
			:public, :leader_text, :reply_text, :reply_text2, :tweet_text, :search,
			:retweet_time_m1, :favorite_time_m1, :message_hover_m1, :open_time_m1, :reply_time_m1, :follow_m1,
			:retweet_time_m2, :favorite_time_m2, :message_hover_m2, :open_time_m2, :reply_time_m2, 
			:new_tweet_time, :search_time,
			:experiment_time,
			:tweet_text_n,
			:displayed_person1, :displayed_person2,
			:seen_nv_influence, :seen_nv_damage, :random_var_multimessage,
			:seen_person,
			:seen_message_1, :seen_message_2, :seen_headline, :seen_message_long,
			:seen_multiple_messages, :seen_at,
			:seen_retweet_message1, 
			:ol_1, :ol_2, :ol_3,  :ol_4, :ol_5, :ol_6,  :ol_7,  :ol_8, :ol_9,  :ol_10,  :ol_11, :ol_12,
			:retweet_1_clicked, :favorite_1_clicked, :expand_1_clicked, :reply_1_clicked,
			:retweet_2_clicked, :favorite_2_clicked, :expand_2_clicked, :reply_2_clicked, :link_clicked,
			:follow_1_clicked, :new_tweet_clicked, :compose_tweet_clicked, :search_clicked,
			:results, :situation,
			:account_name, :twitter_privat_work, :number_followers, :number_followeees, :number_messages,
			:avg_tweet_number, :avg_at_replies, :avg_read_tweets, :avg_stories, :avg_trend, :avg_retweet, :avg_follow,
			:avg_login, :avg_search_keywords, :avg_search_accounts, :avg_activities_friends, :avg_who_to_follow,
			:avg_browse_categories, :avg_find_friends, :avg_create_lists, :avg_add_accounts_lists, :avg_subscribe_lists, :avg_unsubscribe_lists,
			:avg_delete_accounts_lists, :avg_unfollow_account, :avg_favorite_tweets, :avg_private_replies, :avg_read_twtimes,
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
			
			:economic_policy, :foreign_affairs, :domestic_politics, :legal_policy, :fiscal_policy, :social_policy, :agricultural_policy, :defence_policy, :family_policy,
			:healthcare_policy, :traffic_policy, :environmental_policy, :educational_policy, :development_policy, :other_sup_topic, :other_str_sup_topic,
			
			:econ_gen, :econ_sent, :for_gen, :for_sent, :dom_gen, :dom_sent, :leg_gen, :leg_sent, :fisc_gen, :fisc_sent, :soc_gen, :soc_sent, :agr_gen, :agr_sent, :def_gen,
			:def_sent, :fam_gen, :fam_sent, :health_gen, :health_sent, :traf_gen, :traf_sent, :env_gen, :env_sent, :educ_gen, :educ_sent, :dev_gen, :dev_sent,
			:oth_neg, :oth_oth, :oth_neg_txt,
			
			:slider, :dk_pol_percentage,
			
			:rank_source, 
			
			:tv, :radio, :magazine, :newspaper,
			
			:tv_website, :tv_sn, :tv_mb, :tv_rss, :tv_newsletter,
			:radio_website, :radio_sn, :radio_mb, :radio_rss, :radio_newsletter,
			:magazine_website, :magazine_sn, :magazine_mb, :magazine_rss, :magazine_newsletter,
			:newspaper_website, :newspaper_sn, :newspaper_mb, :newspaper_rss, :newspaper_newsletter,
			
			:people_interested, :locals, :aquaintances, :contact_friends, :colleagues, :experts, :contact_ol,
			
			:locals_mb, :locals_chat, :aquaintances_forum, :contact_ol_chat, :contact_ol_sn, :contact_ol_mb, :contact_friends_mb, :people_interested_chat,
			:contact_friends_chat, :colleagues_forum, :contact_friends_email, :contact_friends_forum, :locals_sn, :people_interested_forum, :contact_ol_email,
			:people_interested_email, :aquaintances_email, :experts_sn, :experts_email, :experts_forum, :aquaintances_mb, :aquaintances_sn, :colleagues_mb,
			:people_interested_mb, :locals_forum, :contact_friends_sn, :colleagues_email, :experts_chat, :colleagues_chat, :aquaintances_chat, :contact_ol_forum,
			:experts_mb, :locals_email, :colleagues_sn, :people_interested_sn, :people_interested_phone, :locals_phone, :aquaintances_phone,
			:contact_friends_phone, :colleagues_phone, :experts_phone, :contact_ol_phone, 
			
			:blogs, :goverment_site, :search_engine,
			
			:not_completed, :self_aggr_txt, :pers_cont_txt, :trad_media_txt, 
			
			:other_sources_txt, 
			
			:came_across_same_intrest, :came_across_twitter_list, :heard_mass_media, :heard_internet, :read_retweet, :read_reply, :heard_friends_follow,
			:heard_friends_interact, :heard_friends_recommend, :heard_friends_write, :heard_friends_follow_nf, :heard_friends_interact_nf, :heard_friends_recommend_nf,
			:heard_friends_write_nf, :came_accross_wtf, :came_across_bc, :came_across_stories, :knew_friends, :knew_colleagues, :knew_aquaintances,
			:met_informal, :met_formal, :other_reasons, :other_reasons_txt,
			
			:reply_pr_relevant, :reply_pr_meaningful, :reply_pr_important, :reply_pr_significant,
			:reply_oc_relevant, :reply_oc_meaningful, :reply_oc_important, :reply_oc_significant,
			:favorite_pr_relevant, :favorite_pr_meaningful, :favorite_pr_important, :favorite_pr_significant,
			
			:retweet_pr_relevant, :retweet_pr_meaningful, :retweet_pr_important, :retweet_pr_significant, 
			:retweet_oc_relevant, :retweet_oc_meaningful, :retweet_oc_important, :retweet_oc_significant,
			
			:retweet_pr_important_ck, :retweet_pr_relevant_ck, :retweet_pr_significant_ck, :retweet_pr_meaningful_ck,
			:retweet_oc_important_ck, :retweet_oc_relevant_ck, :retweet_oc_significant_ck, :retweet_oc_meaningful_ck,
			:favorite_pr_significant_ck, :favorite_pr_meaningful_ck, :favorite_pr_relevant_ck, :favorite_pr_important_ck,
			
			:reply_pr_relevant_ck, :reply_pr_important_ck, :reply_pr_significant_ck, :reply_pr_meaningful_ck,
			:reply_oc_relevant_ck, :reply_oc_significant_ck,  :reply_oc_meaningful_ck, :reply_oc_important_ck,
			
			:open_reasons_others, :open_reasons,
			:email,
			
			:beh_exp_retweet, :beh_exp_reply, :beh_exp_favorite, :beh_exp_write, 
			
			:t_imp_int_retweet, :t_imp_int_reply, :t_imp_int_favorite, :t_imp_int_write, 
			
			:o_imp_int_retweet, :o_imp_int_reply, :o_imp_int_favorite, :o_imp_int_write, 
			
			:cbx_write, :cbx_discover_stories, :cbx_discover_trends, :cbx_follow, :cbx_unfollow, :cbx_create_lists, :cbx_add_to_lists, :cbx_unsubscribe_lists,
			:cbx_subscribe_lists,
			
			:any_mistakes, :mistake_txt, :act_af_tw, :uinf_an_sco, :irp_imagine, :irp_act, :irp_keep, :cr_imagine, :cr_act, :cr_keep,
			
			:express_feelings, :spread_ideas, :argue_ideas, :impress_others, :enteratain_others, :inform_others, :center_of_attention, :someone_else, :show_competence,
			:show_interest, :others_expectation, :please_others, :cover_up_feelings, :other_motivations, :other_motivation_txt,
			
			:teilnahme_weitere_befr, :shared_survey

  attr_writer :current_step
  attr_accessor :username
  
  def self.csv_export
    filename = "twitter_database_export.csv"
    CSV.open(filename, "w") do |csv|
    	csv << ["ID",
		"P1_language", "P1_twitter_account", "P1_interest_list",
		"P2_bildung", "P2_bildung_still_study", "P2_geschlecht", "P2_alter", "P2_martial_status", "P2_children", "P2_country", "P2_years", "P2_area",  "P2_employment", "P2_employment_text", "P2_position", "P2_position_text", "P2_organization", "P2_organization_text", "P2_private_pc", "P2_private_mobile", "P2_work_pc", "P2_work_mobile", "P2_public",
		"P3_account_name", "P3_twitter_privat_work", "P3_number_followers", "P3_number_followeees", "P3_number_messages", "P3_avg_login", "P3_avg_tweet_number", "P3_avg_retweet", "P3_avg_at_replies", "P3_avg_private_replies", "P3_avg_favorite_tweets", "P3_avg_read_tweets", "P3_avg_read_twtimes", "P3_avg_stories", "P3_avg_trend", "P3_avg_search_keywords", "P3_avg_follow", "P3_avg_unfollow_account", "P3_avg_search_accounts", "P3_avg_who_to_follow", "P3_avg_browse_categories", "P3_avg_find_friends", "P3_avg_activities_friends", "P3_avg_create_lists", "P3_avg_add_accounts_lists", "P3_avg_subscribe_lists", "P3_avg_unsubscribe_lists", "P3_avg_delete_accounts_lists", 
		"P4_pass_time", "P4_entertain_myself", "P4_occupy_time", "P4_time_bored", "P4_forget_worries", "P4_help_others", "P4_support_others", "P4_show_encouragement", "P4_contribute", "P4_new_friends", "P4_new_people", "P4_get_know_other", "P4_keep_in_touch", "P4_find_people", "P4_communicate", "P4_gather_information", "P4_find_out_things", "P4_look_for_information", "P4_knowledgeable_individual", "P4_answers_questions", "P4_keep_connect", "P4_find_out", "P4_deepen_relationships", "P4_far_away", "P4_express_feelings", "P4_spread_ideas", "P4_argue_ideas", "P4_impress_others", "P4_enteratain_others", "P4_inform_others", "P4_center_of_attention", "P4_someone_else", "P4_show_competence", "P4_show_interest", "P4_others_expectation", "P4_please_others", "P4_cover_up_feelings", "P4_other_motivations", "P4_other_motivation_txt",
		"P5_ol_1", "P5_ol_2", "P5_ol_3", "P5_ol_4", "P5_ol_5", "P5_ol_6", "P5_ol_7", "P5_ol_8", "P5_ol_9", "P5_ol_10", "P5_ol_11", "P5_ol_12", "P5_leader_text",
		"P6_economic_policy", "P6_foreign_affairs", "P6_domestic_politics", "P6_legal_policy", "P6_fiscal_policy", "P6_social_policy", "P6_agricultural_policy", "P6_defence_policy", "P6_family_policy", "P6_healthcare_policy", "P6_traffic_policy", "P6_environmental_policy", "P6_educational_policy", "P6_development_policy", "P6_other_sup_topic", "P6_other_str_sup_topic", "P6_slider", "P6_dk_pol_percentage", "P6_econ_gen", "P6_econ_sent", "P6_for_gen", "P6_for_sent", "P6_dom_gen", "P6_dom_sent", "P6_leg_gen", "P6_leg_sent", "P6_fisc_gen", "P6_fisc_sent", "P6_soc_gen", "P6_soc_sent", "P6_agr_gen", "P6_agr_sent", "P6_def_gen", "P6_def_sent", "P6_fam_gen", "P6_fam_sent", "P6_health_gen", "P6_health_sent", "P6_traf_gen", "P6_traf_sent", "P6_env_gen", "P6_env_sent", "P6_educ_gen", "P6_educ_sent", "P6_dev_gen", "P6_dev_sent", "P6_oth_neg", "P6_oth_oth", "P6_oth_neg_txt",
		"P7_rank_source", "P7_1_tv_website", "P7_1_tv_sn", "P7_1_tv_mb", "P7_1_tv_rss", "P7_1_tv_newsletter", "P7_1_tv", "P7_1_radio_website", "P7_1_radio_sn", "P7_1_radio_mb", "P7_1_radio_rss", "P7_1_radio_newsletter", "P7_1_radio", "P7_1_magazine_website", "P7_1_magazine_sn", "P7_1_magazine_mb", "P7_1_magazine_rss", "P7_1_magazine_newsletter", "P7_1_magazine", "P7_1_newspaper_website", "P7_1_newspaper_sn", "P7_1_newspaper_mb", "P7_1_newspaper_rss", "P7_1_newspaper_newsletter", "P7_1_newspaper", "P7_1_trad_media_txt",
		"P7_2_people_interested_email", "P7_2_people_interested_sn", "P7_2_people_interested_mb", "P7_2_people_interested_forum", "P7_2_people_interested_chat", "P7_2_people_interested_phone", "P7_2_people_interested", "P7_2_locals_email", "P7_2_locals_sn", "P7_2_locals_mb", "P7_2_locals_forum", "P7_2_locals_chat", "P7_2_locals_phone", "P7_2_locals", "P7_2_aquaintances_email", "P7_2_aquaintances_sn", "P7_2_aquaintances_mb", "P7_2_aquaintances_forum", "P7_2_aquaintances_chat", "P7_2_aquaintances_phone", "P7_2_aquaintances", "P7_2_contact_friends_email", "P7_2_contact_friends_sn", "P7_2_contact_friends_mb", "P7_2_contact_friends_forum", "P7_2_contact_friends_chat", "P7_2_contact_friends_phone", "P7_2_contact_friends", "P7_2_colleagues_email", "P7_2_colleagues_sn", "P7_2_colleagues_mb", "P7_2_colleagues_forum", "P7_2_colleagues_chat", "P7_2_colleagues_phone", "P7_2_colleagues", "P7_2_experts_email", "P7_2_experts_sn", "P7_2_experts_mb", "P7_2_experts_forum", "P7_2_experts_chat", "P7_2_experts_phone", "P7_2_experts", "P7_2_contact_ol_email", "P7_2_contact_ol_sn", "P7_2_contact_ol_mb", "P7_2_contact_ol_forum", "P7_2_contact_ol_chat", "P7_2_contact_ol_phone", "P7_2_contact_ol", "P7_2_pers_cont_txt",
		"P7_3_blogs", "P7_3_search_engine", "P7_3_goverment_site", "P7_3_self_aggr_txt", "P7_other_sources_txt",
		"P8_heard_mass_media", "P8_knew_colleagues", "P8_read_retweet", "P8_came_accross_wtf", "P8_knew_aquaintances", "P8_came_across_bc", "P8_heard_friends_write", "P8_1_heard_friends_write_nf", "P8_met_informal", "P8_knew_friends", "P8_heard_friends_interact", "P8_2_heard_friends_interact_nf", "P8_read_reply", "P8_came_across_twitter_list", "P8_heard_internet", "P8_came_across_same_intrest", "P8_heard_friends_recommend", "P8_3_heard_friends_recommend_nf", "P8_met_formal", "P8_came_across_stories", "P8_heard_friends_follow", "P8_4_heard_friends_follow_nf", "P8_other_reasons", "P8_other_reasons_txt",
		"P9_A_follow_1_clicked", "P9_A_follow_m1", "P9_A_reply_1_clicked", "P9_A_reply_text", "P9_A_reply_time_m1", "P9_A_reply_2_clicked", "P9_A_reply_text2", "P9_A_reply_time_m2", "P9_A_retweet_1_clicked", "P9_A_retweet_time_m1", "P9_A_retweet_2_clicked", "P9_A_retweet_time_m2", "P9_A_favorite_1_clicked", "P9_A_favorite_time_m1", "P9_A_favorite_2_clicked", "P9_A_favorite_time_m2", "P9_A_expand_1_clicked", "P9_A_open_time_m1", "P9_A_expand_2_clicked", "P9_A_open_time_m2", "P9_A_new_tweet_clicked", "P9_A_tweet_text_n", "P9_A_compose_tweet_clicked", "P9_A_tweet_text", "P9_A_new_tweet_time", "P9_A_search_clicked", "P9_A_search", "P9_A_search_time", "P9_A_link_clicked", "P9_A_message_hover_m1", "P9_A_message_hover_m2", "P9_A_mousetracks",
		"P9_M_batch_id", "P9_M_seen_seed", "P9_M_situation", "P9_M_seen_retweet_message1", "P9_M_seen_multiple_messages", "P9_M_seen_person", "P9_M_seen_at", "P9_M_seen_nv_influence", "P9_M_seen_nv_damage", "P9_M_random_var_multimessage","P9_M_seen_message_1", "P9_M_seen_message_2", "P9_M_seen_headline", "P9_M_seen_message_long",
		"P10_message_important", "P10_message_meaningful", "P10_message_for_me", "P10_message_remember", "P10_message_value", "P10_message_relevant", "P10_message_useful", "P10_message_attention", "P10_message_interest", "P10_message_ideas", "P10_message_helpful", "P10_message_informative",
		"P10_retweet_pr_relevant", "P10_retweet_pr_relevant_ck", "P10_retweet_pr_meaningful", "P10_retweet_pr_meaningful_ck", "P10_retweet_pr_important", "P10_retweet_pr_important_ck", "P10_retweet_pr_significant", "P10_retweet_pr_significant_ck", "P10_retweet_oc_relevant", "P10_retweet_oc_relevant_ck", "P10_retweet_oc_meaningful", "P10_retweet_oc_meaningful_ck", "P10_retweet_oc_important", "P10_retweet_oc_important_ck", "P10_retweet_oc_significant", "P10_retweet_oc_significant_ck", "P10_reason_nrt",
		"P10_favorite_pr_relevant", "P10_favorite_pr_relevant_ck", "P10_favorite_pr_meaningful", "P10_favorite_pr_meaningful_ck", "P10_favorite_pr_important", "P10_favorite_pr_important_ck", "P10_favorite_pr_significant", "P10_favorite_pr_significant_ck", "P10_reason_nfav",
		"P10_open_reasons", "P10_open_reasons_others", "P10_reason_nexp",
		"P10_reply_pr_relevant", "P10_reply_pr_relevant_ck", "P10_reply_pr_meaningful", "P10_reply_pr_meaningful_ck", "P10_reply_pr_important", "P10_reply_pr_important_ck", "P10_reply_pr_significant", "P10_reply_pr_significant_ck", "P10_reply_oc_relevant", "P10_reply_oc_relevant_ck", "P10_reply_oc_meaningful", "P10_reply_oc_meaningful_ck", "P10_reply_oc_important", "P10_reply_oc_important_ck", "P10_reply_oc_significant", "P10_reply_oc_significant_ck", "P10_reason_nrep",
		"P11_any_mistakes", "P11_mistake_txt", "P11_act_af_tw", "P11_uinf_an_sco", "P11_irp_imagine", "P11_irp_act", "P11_irp_keep", "P11_cr_imagine", "P11_cr_act", "P11_cr_keep",
		"P11_cbx_write", "P11_1_intention1_write", "P11_1_intention2_write", "P11_1_intention3_write","P11_cbx_discover_stories", "P11_2_intention1_discover_stories", "P11_2_intention2_discover_stories", "P11_2_intention3_discover_stories", "P11_cbx_discover_trends", "P11_3_intention1_discover_trends", "P11_3_intention2_discover_trends", "P11_3_intention3_discover_trends", "P11_cbx_follow", "P11_4_intention1_follow", "P11_4_intention2_follow", "P11_4_intention3_follow", "P11_cbx_unfollow",  "P11_5_intention1_unfollow", "P11_5_intention2_unfollow", "P11_5_intention3_unfollow", "P11_cbx_create_lists", "P11_6_intention1_create_lists", "P11_6_intention2_create_lists", "P11_6_intention3_create_lists", "P11_cbx_add_to_lists", "P11_7_intention1_add_to_lists", "P11_7_intention2_add_to_lists", "P11_7_intention3_add_to_lists", "P11_cbx_unsubscribe_lists", "P11_8_intention1_unsubscribe_lists", "P11_8_intention2_unsubscribe_lists", "P11_8_intention3_unsubscribe_lists", "P11_cbx_subscribe_lists","P11_9_intention1_subscribe_lists", "P11_9_intention2_subscribe_lists", "P11_9_intention3_subscribe_lists",  
		"P12_beh_exp_retweet", "P12_beh_exp_reply", "P12_beh_exp_favorite", "P12_beh_exp_write", "P12_t_imp_int_retweet", "P12_t_imp_int_reply", "P12_t_imp_int_favorite", "P12_t_imp_int_write", "P12_o_imp_int_retweet", "P12_o_imp_int_reply", "P12_o_imp_int_favorite", "P12_o_imp_int_write",
		"P13_results", "P13_email", "P13_teilnahme_weitere_befr",
		"P14_not_completed"]
    	User.all.each do |user|
	    csv << [user.id,
		user.language, user.twitter_account, user.interest_list,
		user.bildung, user.bildung_still_study, user.geschlecht, user.alter, user.martial_status, user.children, user.country, user.years, user.area, user.employment, user.employment_text, user.position, user.position_text, user.organization, user.organization_text, user.private_pc, user.private_mobile, user.work_pc, user.work_mobile, user.public,
		user.account_name, user.twitter_privat_work, user.number_followers, user.number_followeees, user.number_messages, user.avg_login, user.avg_tweet_number, user.avg_retweet, user.avg_at_replies, user.avg_private_replies, user.avg_favorite_tweets, user.avg_read_tweets, user.avg_read_twtimes, user.avg_stories, user.avg_trend, user.avg_search_keywords, user.avg_follow, user.avg_unfollow_account, user.avg_search_accounts, user.avg_who_to_follow, user.avg_browse_categories, user.avg_find_friends, user.avg_activities_friends, user.avg_create_lists, user.avg_add_accounts_lists, user.avg_subscribe_lists, user.avg_unsubscribe_lists, user.avg_delete_accounts_lists,
		user.pass_time, user.entertain_myself, user.occupy_time, user.time_bored, user.forget_worries, user.help_others, user.support_others, user.show_encouragement, user.contribute, user.new_friends, user.new_people, user.get_know_other, user.keep_in_touch, user.find_people, user.communicate, user.gather_information, user.find_out_things, user.look_for_information, user.knowledgeable_individual, user.answers_questions, user.keep_connect, user.find_out, user.deepen_relationships, user.far_away, user.express_feelings, user.spread_ideas, user.argue_ideas, user.impress_others, user.enteratain_others, user.inform_others, user.center_of_attention, user.someone_else, user.show_competence, user.show_interest, user.others_expectation, user.please_others, user.cover_up_feelings, user.other_motivations, user.other_motivation_txt,
		user.ol_1, user.ol_2, user.ol_3, user.ol_4, user.ol_5, user.ol_6, user.ol_7, user.ol_8, user.ol_9, user.ol_10, user.ol_11, user.ol_12, user.leader_text,
		user.economic_policy, user.foreign_affairs, user.domestic_politics, user.legal_policy, user.fiscal_policy, user.social_policy, user.agricultural_policy, user.defence_policy, user.family_policy, user.healthcare_policy, user.traffic_policy, user.environmental_policy, user.educational_policy, user.development_policy, user.other_sup_topic, user.other_str_sup_topic, user.slider, user.dk_pol_percentage, user.econ_gen, user.econ_sent, user.for_gen, user.for_sent, user.dom_gen, user.dom_sent, user.leg_gen, user.leg_sent, user.fisc_gen, user.fisc_sent, user.soc_gen, user.soc_sent, user.agr_gen, user.agr_sent, user.def_gen, user.def_sent, user.fam_gen, user.fam_sent, user.health_gen, user.health_sent, user.traf_gen, user.traf_sent, user.env_gen, user.env_sent, user.educ_gen, user.educ_sent, user.dev_gen, user.dev_sent, user.oth_neg, user.oth_oth, user.oth_neg_txt,
		user.rank_source, user.tv_website, user.tv_sn, user.tv_mb, user.tv_rss, user.tv_newsletter, user.tv, user.radio_website, user.radio_sn, user.radio_mb, user.radio_rss, user.radio_newsletter, user.radio, user.magazine_website, user.magazine_sn, user.magazine_mb, user.magazine_rss, user.magazine_newsletter, user.magazine, user.newspaper_website, user.newspaper_sn, user.newspaper_mb, user.newspaper_rss, user.newspaper_newsletter, user.newspaper, user.trad_media_txt,
		user.people_interested_email, user.people_interested_sn, user.people_interested_mb, user.people_interested_forum, user.people_interested_chat, user.people_interested_phone, user.people_interested, user.locals_email, user.locals_sn, user.locals_mb, user.locals_forum, user.locals_chat, user.locals_phone, user.locals, user.aquaintances_email, user.aquaintances_sn, user.aquaintances_mb, user.aquaintances_forum, user.aquaintances_chat, user.aquaintances_phone, user.aquaintances, user.contact_friends_email, user.contact_friends_sn, user.contact_friends_mb, user.contact_friends_forum, user.contact_friends_chat, user.contact_friends_phone, user.contact_friends, user.colleagues_email, user.colleagues_sn, user.colleagues_mb, user.colleagues_forum, user.colleagues_chat, user.colleagues_phone, user.colleagues, user.experts_email, user.experts_sn, user.experts_mb, user.experts_forum, user.experts_chat, user.experts_phone, user.experts, user.contact_ol_email, user.contact_ol_sn, user.contact_ol_mb, user.contact_ol_forum, user.contact_ol_chat, user.contact_ol_phone, user.contact_ol, user.pers_cont_txt,
		user.blogs, user.search_engine, user.goverment_site, user.self_aggr_txt, user.other_sources_txt,
		user.heard_mass_media, user.knew_colleagues, user.read_retweet, user.came_accross_wtf, user.knew_aquaintances, user.came_across_bc, user.heard_friends_write, user.heard_friends_write_nf, user.met_informal, user.knew_friends, user.heard_friends_interact, user.heard_friends_interact_nf, user.read_reply, user.came_across_twitter_list, user.heard_internet, user.came_across_same_intrest, user.heard_friends_recommend, user.heard_friends_recommend_nf, user.met_formal, user.came_across_stories, user.heard_friends_follow, user.heard_friends_follow_nf, user.other_reasons, user.other_reasons_txt,
		user.follow_1_clicked, user.follow_m1, user.reply_1_clicked, user.reply_text, user.reply_time_m1, user.reply_2_clicked, user.reply_text2, user.reply_time_m2, user.retweet_1_clicked, user.retweet_time_m1, user.retweet_2_clicked, user.retweet_time_m2, user.favorite_1_clicked, user.favorite_time_m1, user.favorite_2_clicked, user.favorite_time_m2, user.expand_1_clicked, user.open_time_m1, user.expand_2_clicked, user.open_time_m2, user.new_tweet_clicked, user.tweet_text_n, user.compose_tweet_clicked, user.tweet_text, user.new_tweet_time, user.search_clicked, user.search, user.search_time, user.link_clicked, user.message_hover_m1, user.message_hover_m2, user.mousetracks,
		user.batch_id, user.seen_seed, user.situation, user.seen_retweet_message1, user.seen_multiple_messages, user.seen_person, user.seen_at, user.seen_nv_influence, user.seen_nv_damage, user.random_var_multimessage, user.seen_message_1, user.seen_message_2, user.seen_headline, user.seen_message_long,
		user.message_important, user.message_meaningful, user.message_for_me, user.message_remember, user.message_value, user.message_relevant, user.message_useful, user.message_attention, user.message_interest, user.message_ideas, user.message_helpful, user.message_informative,
		user.retweet_pr_relevant, user.retweet_pr_relevant_ck, user.retweet_pr_meaningful, user.retweet_pr_meaningful_ck, user.retweet_pr_important, user.retweet_pr_important_ck, user.retweet_pr_significant, user.retweet_pr_significant_ck, user.retweet_oc_relevant, user.retweet_oc_relevant_ck, user.retweet_oc_meaningful, user.retweet_oc_meaningful_ck, user.retweet_oc_important, user.retweet_oc_important_ck, user.retweet_oc_significant, user.retweet_oc_significant_ck, user.reason_nrt,
		user.favorite_pr_relevant, user.favorite_pr_relevant_ck, user.favorite_pr_meaningful, user.favorite_pr_meaningful_ck, user.favorite_pr_important, user.favorite_pr_important_ck, user.favorite_pr_significant, user.favorite_pr_significant_ck, user.reason_nfav,
		user.open_reasons, user.open_reasons_others, user.reason_nexp,
		user.reply_pr_relevant, user.reply_pr_relevant_ck, user.reply_pr_meaningful, user.reply_pr_meaningful_ck, user.reply_pr_important, user.reply_pr_important_ck, user.reply_pr_significant, user.reply_pr_significant_ck, user.reply_oc_relevant, user.reply_oc_relevant_ck, user.reply_oc_meaningful, user.reply_oc_meaningful_ck, user.reply_oc_important, user.reply_oc_important_ck, user.reply_oc_significant, user.reply_oc_significant_ck, user.reason_nrep,
		user.any_mistakes,  user.mistake_txt,  user.act_af_tw,  user.uinf_an_sco,  user.irp_imagine,  user.irp_act,  user.irp_keep,  user.cr_imagine,  user.cr_act,  user.cr_keep, 
		user.cbx_write, user.intention1_write, user.intention2_write, user.intention3_write, user.cbx_discover_stories, user.intention1_discover_stories, user.intention2_discover_stories, user.intention3_discover_stories, user.cbx_discover_trends, user.intention1_discover_trends, user.intention2_discover_trends, user.intention3_discover_trends, user.cbx_follow, user.intention1_follow, user.intention2_follow, user.intention3_follow, user.cbx_unfollow, user.intention1_unfollow, user.intention2_unfollow, user.intention3_unfollow, user.cbx_create_lists, user.intention1_create_lists, user.intention2_create_lists, user.intention3_create_lists, user.cbx_add_to_lists, user.intention1_add_to_lists, user.intention2_add_to_lists, user.intention3_add_to_lists, user.cbx_unsubscribe_lists, user.intention1_unsubscribe_lists, user.intention2_unsubscribe_lists, user.intention3_unsubscribe_lists,  user.cbx_subscribe_lists, user.intention1_subscribe_lists, user.intention2_subscribe_lists, user.intention3_subscribe_lists,  
		user.beh_exp_retweet, user.beh_exp_reply, user.beh_exp_favorite, user.beh_exp_write, user.t_imp_int_retweet, user.t_imp_int_reply, user.t_imp_int_favorite, user.t_imp_int_write, user.o_imp_int_retweet, user.o_imp_int_reply, user.o_imp_int_favorite, user.o_imp_int_write,
		user.results, user.email, user.teilnahme_weitere_befr,
		user.not_completed]
    	end
    end
  end

  def setup
    if first_step?
      if Seed.count == 0
        %x[rake refill_seeds]
      end
      seed = Seed.get_random_from_last_batch
      seed.dirty = true
      seed.time_setup = Time.now
      seed.save!
      self.created_at = Time.now
      self.situation = seed.id
      self.batch_id = seed.batch_id
      self.seen_seed = seed.content
      self.seen_person = seed.content[2]
      self.seen_retweet_message1 = seed.content[0]
      self.seen_multiple_messages = seed.content[1]
      self.seen_at = seed.content[3]
      self.random_var_multimessage = seed.content[5]
      self.interest_list = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17"]
    end
  end
  
  def to_hash
    hash = {}; self.attributes.each { |k,v| hash[k] = v }
  end

  validates_presence_of 	:language, :if => :selection?
  validates_presence_of 	:twitter_account, :if => :selection?
  validates_inclusion_of 	:country, :in => 1..196, :if => :demographic?, :message => "is missing. Please select the country you currently live."
  validates_presence_of		:income, :if => :demographic?, :message => "cant be blank, unless you are still studying."
  #validates_format_of	 	:bildung, :with => /^([1-9]+[0-9])?$/i, :allow_nil => false, :allow_blank => false, :if => :demographic?, :message => "is invalid. Make shure you insertet your age, when you left your last educational institution - not the years you spent in school."
  validates_format_of	 	:income, :with => /^(1[2-9]|(2|3|4|5|6|7)[0-9])?$/i, :allow_nil => false, :allow_blank => false, :if => :demographic?, :message => "is invalid. Make shure you insertet your age, when you left your last educational institution - not the years you spent in school."
  validates_presence_of		:alter, :if => :demographic?
  validates_format_of		:alter, :with => /^((19|20)+[0-9]{2})?$/i, :allow_nil => false, :allow_blank => false,  :if => :demographic?, :message => "is invalid. Please enter your year of birth"
  #validates_format_of 		:interest_list[0], :with => /^[0-4]$/i, :allow_nil => true, :allow_blank => true, :message => "is missing. Please rank at least your 5 most shared topics."
  #validates_format_of 		:interest_list[1], :with => /^[0-4]$/i, :allow_nil => true, :allow_blank => true, :message => "is missing. Please rank at least your 5 most shared topics."
  #validates_format_of 		:interest_list[2], :with => /^[0-4]$/i, :allow_nil => true, :allow_blank => true, :message => "is missing. Please rank at least your 5 most shared topics."
  #validates_format_of 		:interest_list[3], :with => /^[0-4]$/i, :allow_nil => true, :allow_blank => true, :message => "is missing. Please rank at least your 5 most shared topics."
  #validates_format_of 		:interest_list[4], :with => /^[0-4]$/i, :allow_nil => true, :allow_blank => true, :message => "is missing. Please rank at least your 5 most shared topics."

  validates_presence_of		:account_name, :if => :internet?, :message => "can't be blank. If you absolutely don't trust the guarantied anonymization of this questionnaire, please insert a name you can identify with.", :if => :internet?
  validates_format_of 		:account_name, :with => /^[@]?[a-zA-Z0-9_]*$/i, :message => "is invalid. Usernames of Twitter users contain only alphanumeric characters.", :if => :internet?
  #validate			:account_name, :uniqueness => {:scope => :account_name}
  validates_inclusion_of 	:twitter_privat_work, :in => 1..5, :if => :internet?, :message => "is missing"
  validates_presence_of 	:avg_login, :if => :internet?, :message => "is missing"
  validates_presence_of 	:avg_tweet_number, :if => :internet?, :message => "is missing"
  validates_presence_of 	:avg_retweet, :if => :internet?, :message => "is missing"
  validates_presence_of 	:avg_at_replies, :if => :internet?, :message => "is missing"
  validates_presence_of 	:avg_favorite_tweets, :if => :internet?, :message => "is missing"
  validates_presence_of 	:avg_follow, :if => :internet?, :message => "is missing"
  validates_presence_of 	:avg_read_tweets, :if => :internet?, :message => "is missing"
  validates_presence_of 	:avg_read_twtimes, :if => :internet?, :message => "is missing"
  validates_presence_of 	:avg_stories, :if => :internet?, :message => "is missing"
  validates_presence_of 	:avg_trend, :if => :internet?, :message => "is missing"
  validates_presence_of 	:avg_activities_friends,  :if => :internet?, :message => "is missing"
  
  validates_numericality_of 	:number_followers, :allow_nil => true, :allow_blank => true, :if => :internet? 
  validates_numericality_of	:number_followeees, :allow_nil => true, :allow_blank => true, :if => :internet? 
  validates_numericality_of	:number_messages, :allow_nil => true, :allow_blank => true, :if => :internet?
  validates_numericality_of 	:surf_twitter_week, :allow_nil => true, :allow_blank => true, :if => :internet?
  validates_numericality_of 	:surf_twitter_weekend, :allow_nil => true, :allow_blank => true, :if => :internet?
  validates_format_of 		:surf_twitter_week, :with => /^[0-9]?[0-9](\.\d+)?$/i, :allow_nil => true, :allow_blank => true, :message => "is invalid. Please insert a number between 0 and 99. You can use . to separate decimal places.", :if => :internet?
  validates_format_of 		:surf_twitter_weekend, :with => /^[0-3]?[0-9](\.\d+)?$/i, :allow_nil => true, :allow_blank => true, :message => "is invalid. Please insert a number between 0 and 39. You can use . to separate decimal places.", :if => :internet?
  validates_format_of 		:email, :with => /\b[A-Z0-9._%-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b/i, :allow_nil => true, :allow_blank => true, :message => "is invalid. We cant get back to you without your correct email address. If you are not interested in the results you can leave the field blank.", :if => :target?
  
  validates_format_of 	:ol_1, :if => :opinionleader?, :unless => proc{|obj| obj.ol_1.blank?}, 	:with => /^[@]?[a-zA-Z0-9_]*$/i,  :message => "is invalid. Usernames of Twitter users contain only alphanumeric characters."
  validates_format_of 	:ol_2, :if => :opinionleader?, :unless => proc{|obj| obj.ol_2.blank?},	:with => /^[@]?[a-zA-Z0-9_]*$/i,  :message => "is invalid. Usernames of Twitter users contain only alphanumeric characters."
  validates_format_of 	:ol_3, :if => :opinionleader?, :unless => proc{|obj| obj.ol_3.blank?},	:with => /^[@]?[a-zA-Z0-9_]*$/i,  :message => "is invalid. Usernames of Twitter users contain only alphanumeric characters."
  validates_format_of 	:ol_4, :if => :opinionleader?, :unless => proc{|obj| obj.ol_4.blank?},	:with => /^[@]?[a-zA-Z0-9_]*$/i,  :message => "is invalid. Usernames of Twitter users contain only alphanumeric characters."
  validates_format_of 	:ol_5, :if => :opinionleader?, :unless => proc{|obj| obj.ol_5.blank?},	:with => /^[@]?[a-zA-Z0-9_]*$/i,  :message => "is invalid. Usernames of Twitter users contain only alphanumeric characters."
  validates_format_of 	:ol_6, :if => :opinionleader?, :unless => proc{|obj| obj.ol_6.blank?},	:with => /^[@]?[a-zA-Z0-9_]*$/i,  :message => "is invalid. Usernames of Twitter users contain only alphanumeric characters."
  validates_format_of 	:ol_7, :if => :opinionleader?, :unless => proc{|obj| obj.ol_7.blank?},	:with => /^[@]?[a-zA-Z0-9_]*$/i,  :message => "is invalid. Usernames of Twitter users contain only alphanumeric characters."
  validates_format_of 	:ol_8, :if => :opinionleader?, :unless => proc{|obj| obj.ol_8.blank?},	:with => /^[@]?[a-zA-Z0-9_]*$/i,  :message => "is invalid. Usernames of Twitter users contain only alphanumeric characters."
  validates_format_of 	:ol_9, :if => :opinionleader?, :unless => proc{|obj| obj.ol_9.blank?},	:with => /^[@]?[a-zA-Z0-9_]*$/i,  :message => "is invalid. Usernames of Twitter users contain only alphanumeric characters."
  validates_format_of 	:ol_10,:if => :opinionleader?, :unless => proc{|obj| obj.ol_10.blank?},	:with => /^[@]?[a-zA-Z0-9_]*$/i,  :message => "is invalid. Usernames of Twitter users contain only alphanumeric characters."
  validates_format_of 	:ol_11,:if => :opinionleader?, :unless => proc{|obj| obj.ol_11.blank?},	:with => /^[@]?[a-zA-Z0-9_]*$/i,  :message => "is invalid. Usernames of Twitter users contain only alphanumeric characters."
  validates_format_of 	:ol_12,:if => :opinionleader?, :unless => proc{|obj| obj.ol_12.blank?},	:with => /^[@]?[a-zA-Z0-9_]*$/i,  :message => "is invalid. Usernames of Twitter users contain only alphanumeric characters."
  validate 		:at_least_one_ol, :if => :opinionleader?
    
  def at_least_one_ol
      if (ol_1.blank? & ol_2.blank? & ol_3.blank? & ol_4.blank? & ol_5.blank? & ol_6.blank? & ol_7.blank? & ol_8.blank? & ol_9.blank? & ol_10.blank? & ol_11.blank? & ol_12.blank?)
        errors.add_to_base("Specify at least one field")
      end
  end
  

  validates_presence_of :pass_time, :if => :twitter_motivation?, :unless => proc{|obj| obj.pass_time.blank?}
  validates_presence_of :entertain_myself,  :if => :twitter_motivation?, :unless => proc{|obj| obj.entertain_myself.blank?}
  validates_presence_of :occupy_time,  :if => :twitter_motivation?, :unless => proc{|obj| obj.occupy_time.blank?}
  validates_presence_of :time_bored,  :if => :twitter_motivation?, :unless => proc{|obj| obj.time_bored.blank?}
  validates_presence_of :forget_worries,  :if => :twitter_motivation?, :unless => proc{|obj| obj.forget_worries.blank?}
  validates_presence_of :help_others,  :if => :twitter_motivation?, :unless => proc{|obj| obj.help_others.blank?}
  validates_presence_of :support_others,  :if => :twitter_motivation?, :unless => proc{|obj| obj.support_others.blank?}
  validates_presence_of :show_encouragement,  :if => :twitter_motivation?, :unless => proc{|obj| obj.show_encouragement.blank?}
  validates_presence_of :contribute,  :if => :twitter_motivation?, :unless => proc{|obj| obj.contribute.blank?}
  validates_presence_of :new_friends,  :if => :twitter_motivation?, :unless => proc{|obj| obj.new_friends.blank?}
  validates_presence_of :new_people,  :if => :twitter_motivation?, :unless => proc{|obj| obj.new_people.blank?}
  validates_presence_of :get_know_other,  :if => :twitter_motivation?, :unless => proc{|obj| obj.get_know_other.blank?}
  validates_presence_of :keep_in_touch,  :if => :twitter_motivation?, :unless => proc{|obj| obj.keep_in_touch.blank?}
  validates_presence_of :find_people,  :if => :twitter_motivation?, :unless => proc{|obj| obj.find_people.blank?}
  validates_presence_of :communicate,  :if => :twitter_motivation?, :unless => proc{|obj| obj.communicate.blank?}
  validates_presence_of :gather_information,  :if => :twitter_motivation?, :unless => proc{|obj| obj.gather_information.blank?}
  validates_presence_of :find_out_things,  :if => :twitter_motivation?, :unless => proc{|obj| obj.find_out_things.blank?}
  validates_presence_of :look_for_information,  :if => :twitter_motivation?, :unless => proc{|obj| obj.look_for_information.blank?}
  validates_presence_of :knowledgeable_individual,  :if => :twitter_motivation?, :unless => proc{|obj| obj.knowledgeable_individual.blank?}
  validates_presence_of :answers_questions,  :if => :twitter_motivation?, :unless => proc{|obj| obj.answers_questions.blank?}
  validates_presence_of :keep_connect,  :if => :twitter_motivation?, :unless => proc{|obj| obj.keep_connect.blank?}
  validates_presence_of :find_out,  :if => :twitter_motivation?, :unless => proc{|obj| obj.find_out.blank?}
  validates_presence_of :deepen_relationships,  :if => :twitter_motivation?, :unless => proc{|obj| obj.deepen_relationships.blank?}
  validates_presence_of :far_away,  :if => :twitter_motivation?, :unless => proc{|obj| obj.far_away.blank?}
  validates_presence_of :express_feelings,  :if => :twitter_motivation?, :unless => proc{|obj| obj.express_feelings.blank?}
  validates_presence_of :spread_ideas,  :if => :twitter_motivation?, :unless => proc{|obj| obj.spread_ideas.blank?}
  validates_presence_of :argue_ideas,  :if => :twitter_motivation?, :unless => proc{|obj| obj.argue_ideas.blank?}
  validates_presence_of :impress_others,  :if => :twitter_motivation?, :unless => proc{|obj| obj.impress_others.blank?}
  validates_presence_of :enteratain_others,  :if => :twitter_motivation?, :unless => proc{|obj| obj.enteratain_others.blank?}
  validates_presence_of :inform_others,  :if => :twitter_motivation?, :unless => proc{|obj| obj.inform_others.blank?}
  validates_presence_of :center_of_attention,  :if => :twitter_motivation?, :unless => proc{|obj| obj.center_of_attention.blank?}
  validates_presence_of :someone_else,  :if => :twitter_motivation?, :unless => proc{|obj| obj.someone_else.blank?}
  validates_presence_of :show_competence,  :if => :twitter_motivation?, :unless => proc{|obj| obj.show_competence.blank?}
  validates_presence_of :show_interest,  :if => :twitter_motivation?, :unless => proc{|obj| obj.show_interest.blank?}
  validates_presence_of :others_expectation,  :if => :twitter_motivation?, :unless => proc{|obj| obj.others_expectation.blank?}
  validates_presence_of :please_others,  :if => :twitter_motivation?, :unless => proc{|obj| obj.please_others.blank?}
  validates_presence_of :cover_up_feelings,  :if => :twitter_motivation?, :unless => proc{|obj| obj.cover_up_feelings.blank?}
  validate 		:at_least_3q_motivations, :if => :twitter_motivation?
  
  def at_least_3q_motivations
  dummyvar= 0
     if !pass_time.blank? 
     dummyvar +=1
     end
   
     if !entertain_myself.blank? 
     dummyvar +=1
     end

     if !time_bored.blank? 
     dummyvar +=1
     end
   
     if !forget_worries.blank? 
     dummyvar +=1
     end
   
     if !help_others.blank? 
     dummyvar +=1
     end
   
     if !support_others.blank? 
     dummyvar +=1
     end

     if !contribute.blank? 
     dummyvar +=1
     end
   
     if !new_friends.blank? 
     dummyvar +=1
     end
   
     if !get_know_other.blank? 
     dummyvar +=1
     end

     if !look_for_information.blank? 
     dummyvar +=1
     end
  
     if !knowledgeable_individual.blank? 
     dummyvar +=1
     end
     
     if !deepen_relationships.blank? 
     dummyvar +=1
     end
   
     if !far_away.blank? 
     dummyvar +=1
     end

     if !enteratain_others.blank? 
     dummyvar +=1
     end

     if !center_of_attention.blank? 
     dummyvar +=1
     end

     if !show_competence.blank? 
     dummyvar +=1
     end

     if !others_expectation.blank? 
     dummyvar +=1
     end

     if !cover_up_feelings.blank? 
     dummyvar +=1
     end
      if dummyvar < 18
        errors.add_to_base("Rate at least the entire first half of the possible motivations regarding your degree of agreement.")
      end
  end
  
  validates_presence_of :economic_policy, :if => :interest?, :unless => proc{|obj| obj.economic_policy.blank?}
  validates_presence_of :foreign_affairs,  :if => :interest?, :unless => proc{|obj| obj.foreign_affairs.blank?}
  validates_presence_of :domestic_politics,  :if => :interest?, :unless => proc{|obj| obj.domestic_politics.blank?}
  validates_presence_of :legal_policy,  :if => :interest?, :unless => proc{|obj| obj.legal_policy.blank?}
  validates_presence_of :fiscal_policy,  :if => :interest?, :unless => proc{|obj| obj.fiscal_policy.blank?}
  validates_presence_of :social_policy,  :if => :interest?, :unless => proc{|obj| obj.social_policy.blank?}
  validates_presence_of :agricultural_policy,  :if => :interest?, :unless => proc{|obj| obj.agricultural_policy.blank?}
  validates_presence_of :defence_policy,  :if => :interest?, :unless => proc{|obj| obj.defence_policy.blank?}
  validates_presence_of :family_policy,  :if => :interest?, :unless => proc{|obj| obj.family_policy.blank?}
  validates_presence_of :healthcare_policy,  :if => :interest?, :unless => proc{|obj| obj.healthcare_policy.blank?}
  validates_presence_of :traffic_policy,  :if => :interest?, :unless => proc{|obj| obj.traffic_policy.blank?}
  validates_presence_of :environmental_policy,  :if => :interest?, :unless => proc{|obj| obj.environmental_policy.blank?}
  validates_presence_of :educational_policy,  :if => :interest?, :unless => proc{|obj| obj.educational_policy.blank?}
  validates_presence_of :development_policy,  :if => :interest?, :unless => proc{|obj| obj.development_policy.blank?}
  validates_presence_of :other_sup_topic, :if => :interest?, :unless => proc{|obj| obj.other_sup_topic.blank?}
  validate 		:at_least_3_intrests, :if => :interest?
  
  def at_least_3_intrests
    dummyvar2= 0
     if !economic_policy.blank? 
     dummyvar2 +=1
     end
     if !foreign_affairs.blank? 
     dummyvar2 +=1
     end
     if !domestic_politics.blank? 
     dummyvar2 +=1
     end
     if !legal_policy.blank? 
     dummyvar2 +=1
     end
     if !fiscal_policy.blank? 
     dummyvar2 +=1
     end
     if !social_policy.blank? 
     dummyvar2 +=1
     end
     if !agricultural_policy.blank? 
     dummyvar2 +=1
     end
     if !defence_policy.blank? 
     dummyvar2 +=1
     end
     if !family_policy.blank? 
     dummyvar2 +=1
     end
     if !healthcare_policy.blank? 
     dummyvar2 +=1
     end
     if !traffic_policy.blank? 
     dummyvar2 +=1
     end
     if !environmental_policy.blank? 
     dummyvar2 +=1
     end
     if !educational_policy.blank? 
     dummyvar2 +=1
     end
     if !development_policy.blank? 
     dummyvar2 +=1
     end
     if !other_sup_topic.blank? 
     dummyvar2 +=1
    end	
    if dummyvar2 < 3
        errors.add_to_base("Please rate at least 3 political topics you are especially interested in on Twitter")
      end
  end
  
  validates_presence_of :slider, :if => :interest?, :unless => proc{|obj| obj.slider.blank?}
  validates_presence_of :dk_pol_percentage, :if => :interest?, :unless => proc{|obj| obj.dk_pol_percentage == 1}
  validate 		:slide_slider_or_dk, :if => :interest?
  
  def slide_slider_or_dk
    dummyvar3 = 0
    if !slider.blank? 
     dummyvar3 +=1
    end
    if dk_pol_percentage == 1 
     dummyvar3 +=1
    end	
    if dummyvar3 < 1
        errors.add_to_base("Please estimate the percentage of the Tweets you read in an average week that are related to political topics. If you don't know it mark the checkbox below.")
      end
  end
  
  validates_presence_of :heard_mass_media, :if => :reasons_for_ol?, :unless => proc{|obj| obj.heard_mass_media==1} 
  validates_presence_of :knew_colleagues,  :if => :reasons_for_ol?, :unless => proc{|obj| obj.knew_colleagues==1} 
  validates_presence_of :read_retweet,  :if => :reasons_for_ol?, :unless => proc{|obj| obj.read_retweet==1} 
  validates_presence_of :came_accross_wtf,  :if => :reasons_for_ol?, :unless => proc{|obj| obj.came_accross_wtf==1} 
  validates_presence_of :knew_aquaintances,  :if => :reasons_for_ol?, :unless => proc{|obj| obj.knew_aquaintances==1} 
  validates_presence_of :came_across_bc,  :if => :reasons_for_ol?, :unless => proc{|obj| obj.came_across_bc==1} 
  validates_presence_of :heard_friends_write,  :if => :reasons_for_ol?, :unless => proc{|obj| obj.heard_friends_write==1} 
  validates_presence_of :met_informal,  :if => :reasons_for_ol?, :unless => proc{|obj| obj.met_informal==1} 
  validates_presence_of :knew_friends,  :if => :reasons_for_ol?, :unless => proc{|obj| obj.knew_friends==1} 
  validates_presence_of :heard_friends_interact,  :if => :reasons_for_ol?, :unless => proc{|obj| obj.heard_friends_interact==1} 
  validates_presence_of :read_reply,  :if => :reasons_for_ol?, :unless => proc{|obj| obj.read_reply==1} 
  validates_presence_of :came_across_twitter_list,  :if => :reasons_for_ol?, :unless => proc{|obj| obj.came_across_twitter_list==1} 
  validates_presence_of :heard_internet,  :if => :reasons_for_ol?, :unless => proc{|obj| obj.heard_internet==1} 
  validates_presence_of :came_across_same_intrest,  :if => :reasons_for_ol?, :unless => proc{|obj| obj.came_across_same_intrest==1} 
  validates_presence_of :heard_friends_recommend,  :if => :reasons_for_ol?, :unless => proc{|obj| obj.heard_friends_recommend==1} 
  validates_presence_of :met_formal,  :if => :reasons_for_ol?, :unless => proc{|obj| obj.met_formal==1} 
  validates_presence_of :came_across_stories,  :if => :reasons_for_ol?, :unless => proc{|obj| obj.came_across_stories==1} 
  validates_presence_of :heard_friends_follow,  :if => :reasons_for_ol?, :unless => proc{|obj| obj.heard_friends_follow==1} 
  validates_presence_of :other_reasons,  :if => :reasons_for_ol?, :unless => proc{|obj| obj.other_reasons==1}
  validate 		:at_least_one_reason, :if => :reasons_for_ol?
  
  def at_least_one_reason
    dummyvar4 = 0
    if heard_mass_media==1
    dummyvar4 += 1
    end
    if knew_colleagues==1
    dummyvar4 += 1
    end
    if read_retweet==1
    dummyvar4 += 1
    end
    if came_accross_wtf==1
    dummyvar4 += 1
    end
    if knew_aquaintances==1
    dummyvar4 += 1
    end
    if came_across_bc==1
    dummyvar4 += 1
    end
    if heard_friends_write==1
    dummyvar4 += 1
    end
    if met_informal==1
    dummyvar4 += 1
    end
    if knew_friends==1
    dummyvar4 += 1
    end
    if heard_friends_interact==1
    dummyvar4 += 1
    end
    if read_reply==1
    dummyvar4 += 1
    end
    if came_across_twitter_list==1
    dummyvar4 += 1
    end
    if heard_internet==1
    dummyvar4 += 1
    end
    if came_across_same_intrest==1
    dummyvar4 += 1
    end
    if heard_friends_recommend==1
    dummyvar4 += 1
    end
    if met_formal==1
    dummyvar4 += 1
    end
    if came_across_stories==1
    dummyvar4 += 1
    end
    if heard_friends_follow==1
    dummyvar4 += 1
    end
    if other_reasons==1
    dummyvar4 += 1
    end
    if dummyvar4 < 1
        errors.add_to_base("Please select at least one reason.")
      end
  end

  validates_presence_of :message_important, :if => :message_relevance?, :unless => proc{|obj| obj.message_important.blank?} 
  validates_presence_of :message_meaningful, :if => :message_relevance?, :unless => proc{|obj| obj.message_meaningful.blank?}  
  validates_presence_of :message_for_me,  :if => :message_relevance?, :unless => proc{|obj| obj.message_for_me.blank?} 
  validates_presence_of :message_remember,  :if => :message_relevance?, :unless => proc{|obj| obj.message_remember.blank?} 
  validates_presence_of :message_value,  :if => :message_relevance?, :unless => proc{|obj| obj.message_value.blank?} 
  validates_presence_of :message_relevant,  :if => :message_relevance?, :unless => proc{|obj| obj.message_relevant.blank?} 
  validates_presence_of :message_useful,  :if => :message_relevance?, :unless => proc{|obj| obj.message_useful.blank?} 
  validates_presence_of :message_attention,  :if => :message_relevance?, :unless => proc{|obj| obj.message_attention.blank?} 
  validates_presence_of :message_interest,  :if => :message_relevance?, :unless => proc{|obj| obj.message_interest.blank?} 
  validates_presence_of :message_ideas,  :if => :message_relevance?, :unless => proc{|obj| obj.message_ideas.blank?} 
  validates_presence_of :message_helpful,  :if => :message_relevance?, :unless => proc{|obj| obj.message_helpful.blank?} 
  validates_presence_of :message_informative, :if => :message_relevance?, :unless => proc{|obj| obj.message_informative.blank?} 
  validate 		:at_least_4_message_evals, :if => :message_relevance?
  
  def at_least_4_message_evals
    dummyvar5 = 0
    if !message_important.blank? 
    dummyvar5 += 1
    end
    if !message_meaningful.blank? 
    dummyvar5 += 1
    end
    if !message_for_me.blank? 
    dummyvar5 += 1
    end
    if !message_remember.blank? 
    dummyvar5 += 1
    end
    if !message_value.blank? 
    dummyvar5 += 1
    end
    if !message_relevant.blank? 
    dummyvar5 += 1
    end
    if !message_useful.blank? 
    dummyvar5 += 1
    end
    if !message_attention.blank? 
    dummyvar5 += 1
    end
    if !message_interest.blank? 
    dummyvar5 += 1
    end
    if !message_ideas.blank? 
    dummyvar5 += 1
    end
    if !message_helpful.blank? 
    dummyvar5 += 1
    end
    if !message_informative.blank? 
    dummyvar5 += 1
    end
    if dummyvar5 < 4
        errors.add_to_base("Please evaluate at least 4 statements regarding the message seen.")
    end
  end
  

  validates_presence_of :reason_nrt, :if => :message_relevance?, :unless => proc{|obj| obj.reason_nrt == "1.\r\n2.\r\n3.\r\n..."} 
  validates_presence_of :retweet_pr_relevant, :if => :message_relevance?, :unless => proc{|obj| obj.retweet_pr_relevant.blank?}  
  validates_presence_of :retweet_pr_meaningful,  :if => :message_relevance?, :unless => proc{|obj| obj.retweet_pr_meaningful.blank?} 
  validates_presence_of :retweet_pr_important,  :if => :message_relevance?, :unless => proc{|obj| obj.retweet_pr_important.blank?} 
  validates_presence_of :retweet_pr_significant,  :if => :message_relevance?, :unless => proc{|obj| obj.retweet_pr_significant.blank?} 
  validates_presence_of :retweet_oc_relevant,  :if => :message_relevance?, :unless => proc{|obj| obj.retweet_oc_relevant.blank?} 
  validates_presence_of :retweet_oc_meaningful,  :if => :message_relevance?, :unless => proc{|obj| obj.retweet_oc_meaningful.blank?} 
  validates_presence_of :retweet_oc_important,  :if => :message_relevance?, :unless => proc{|obj| obj.retweet_oc_important.blank?} 
  validates_presence_of :retweet_oc_significant,  :if => :message_relevance?, :unless => proc{|obj| obj.retweet_oc_significant.blank?}
  
  validates_presence_of :retweet_pr_relevant_ck, :if => :message_relevance?, :unless => proc{|obj| obj.retweet_pr_relevant_ck.blank?}  
  validates_presence_of :retweet_pr_meaningful_ck,  :if => :message_relevance?, :unless => proc{|obj| obj.retweet_pr_meaningful_ck.blank?} 
  validates_presence_of :retweet_pr_important_ck,  :if => :message_relevance?, :unless => proc{|obj| obj.retweet_pr_important_ck.blank?} 
  validates_presence_of :retweet_pr_significant_ck,  :if => :message_relevance?, :unless => proc{|obj| obj.retweet_pr_significant_ck.blank?} 
  validates_presence_of :retweet_oc_relevant_ck,  :if => :message_relevance?, :unless => proc{|obj| obj.retweet_oc_relevant_ck.blank?} 
  validates_presence_of :retweet_oc_meaningful_ck,  :if => :message_relevance?, :unless => proc{|obj| obj.retweet_oc_meaningful_ck.blank?} 
  validates_presence_of :retweet_oc_important_ck,  :if => :message_relevance?, :unless => proc{|obj| obj.retweet_oc_important_ck.blank?} 
  validates_presence_of :retweet_oc_significant_ck,  :if => :message_relevance?, :unless => proc{|obj| obj.retweet_oc_significant_ck.blank?}
  validate 		:at_least_4_retweet_evals, :if => :message_relevance?
  
  def at_least_4_retweet_evals
    dummyvar6 = 0
    if reason_nrt != "1.\r\n2.\r\n3.\r\n..."
    dummyvar6 += 4
    end
    if !retweet_pr_relevant.blank? 
    dummyvar6 += 1
    end
    if !retweet_pr_meaningful.blank? 
    dummyvar6 += 1
    end
    if !retweet_pr_important.blank? 
    dummyvar6 += 1
    end
    if !retweet_pr_significant.blank? 
    dummyvar6 += 1
    end
    if !retweet_oc_relevant.blank? 
    dummyvar6 += 1
    end
    if !retweet_oc_meaningful.blank? 
    dummyvar6 += 1
    end
    if !retweet_oc_important.blank? 
    dummyvar6 += 1
    end
    if !retweet_oc_significant.blank? 
    dummyvar6 += 1
    end
  
    if retweet_pr_relevant_ck.blank? 
    dummyvar6 == 1
    end
    if retweet_pr_meaningful_ck.blank?
    dummyvar6 == 1
    end
    if retweet_pr_important_ck.blank?
    dummyvar6 == 1
    end
    if retweet_pr_significant_ck.blank?
    dummyvar6 == 1
    end
    if retweet_oc_relevant_ck.blank?
    dummyvar6 == 1
    end
    if retweet_oc_meaningful_ck.blank?
    dummyvar6 == 1
    end
    if retweet_oc_important_ck.blank?
    dummyvar6 == 1
    end
    if retweet_oc_significant_ck.blank?
    dummyvar6 == 1
    end
  
    if retweet_pr_relevant_ck==1 
    dummyvar6 += 1
    end
    if retweet_pr_meaningful_ck==1
    dummyvar6 += 1
    end
    if retweet_pr_important_ck==1
    dummyvar6 += 1
    end
    if retweet_pr_significant_ck==1
    dummyvar6 += 1
    end
    if retweet_oc_relevant_ck==1
    dummyvar6 += 1
    end
    if retweet_oc_meaningful_ck==1
    dummyvar6 += 1
    end
    if retweet_oc_important_ck==1
    dummyvar6 += 1
    end
    if retweet_oc_significant_ck==1
    dummyvar6 += 1
    end
    
    if dummyvar6 < 4
      if self.retweet_1_clicked > 0 || self.retweet_2_clicked > 0
	errors.add_to_base("Please use at least 4 of the sliders to evaluate the retweet you have done in the simulation.")
      elsif self.retweet_1_clicked == 0 && self.retweet_2_clicked == 0
        errors.add_to_base("Please mention at least one reason why you didn't retweet the message in the simulation.")
      end
    end
  end
  
  validates_presence_of :reason_nfav, :if => :message_relevance?, :unless => proc{|obj| obj.reason_nfav == "1.\r\n2.\r\n3.\r\n..."} 
  validates_presence_of :favorite_pr_relevant, :if => :message_relevance?, :unless => proc{|obj| obj.favorite_pr_relevant.blank?}  
  validates_presence_of :favorite_pr_meaningful,  :if => :message_relevance?, :unless => proc{|obj| obj.favorite_pr_meaningful.blank?} 
  validates_presence_of :favorite_pr_important,  :if => :message_relevance?, :unless => proc{|obj| obj.favorite_pr_important.blank?} 
  validates_presence_of :favorite_pr_significant,  :if => :message_relevance?, :unless => proc{|obj| obj.favorite_pr_significant.blank?}
  
  validates_presence_of :favorite_pr_relevant_ck, :if => :message_relevance?, :unless => proc{|obj| obj.favorite_pr_relevant_ck.blank?}  
  validates_presence_of :favorite_pr_meaningful_ck,  :if => :message_relevance?, :unless => proc{|obj| obj.favorite_pr_meaningful_ck.blank?} 
  validates_presence_of :favorite_pr_important_ck,  :if => :message_relevance?, :unless => proc{|obj| obj.favorite_pr_important_ck.blank?} 
  validates_presence_of :favorite_pr_significant_ck,  :if => :message_relevance?, :unless => proc{|obj| obj.favorite_pr_significant_ck.blank?} 
  validate 		:at_least_4_favorite_evals, :if => :message_relevance?
  
  def at_least_4_favorite_evals
    dummyvar7 = 0
    if reason_nfav != "1.\r\n2.\r\n3.\r\n..."
    dummyvar7 += 2
    end
    if favorite_pr_relevant_ck==1 
    dummyvar7 += 1
    end
    if favorite_pr_meaningful_ck==1
    dummyvar7 += 1
    end
    if favorite_pr_important_ck==1
    dummyvar7 += 1
    end
    if favorite_pr_significant_ck==1
    dummyvar7 += 1
    end
 
    if favorite_pr_relevant_ck.blank? 
    dummyvar7 == 1
    end
    if favorite_pr_meaningful_ck.blank?
    dummyvar7 == 1
    end
    if favorite_pr_important_ck.blank?
    dummyvar7 == 1
    end
    if favorite_pr_significant_ck.blank?
    dummyvar7 == 1
    end  
  
    if !favorite_pr_relevant.blank? 
    dummyvar7 += 1
    end
    if !favorite_pr_meaningful.blank? 
    dummyvar7 += 1
    end
    if !favorite_pr_important.blank? 
    dummyvar7 += 1
    end
    if !favorite_pr_significant.blank? 
    dummyvar7 += 1
    end
    if dummyvar7 < 2
      if self.favorite_1_clicked > 0 || self.favorite_2_clicked > 0
	errors.add_to_base("Please use at least 3 of the sliders to evaluate the favorite you have done in the simulation.")
      elsif self.favorite_1_clicked == 0 && self.favorite_2_clicked == 0
        errors.add_to_base("Please mention at least one reason why you didn't favorite the message in the simulation.")
      end
    end
  end
  
  validates_presence_of :reason_nrep, :if => :message_relevance?, :unless => proc{|obj| obj.reason_nrep == "1.\r\n2.\r\n3.\r\n..."} 
  validates_presence_of :reply_pr_relevant, :if => :message_relevance?, :unless => proc{|obj| obj.reply_pr_relevant.blank?}  
  validates_presence_of :reply_pr_meaningful,  :if => :message_relevance?, :unless => proc{|obj| obj.reply_pr_meaningful.blank?} 
  validates_presence_of :reply_pr_important,  :if => :message_relevance?, :unless => proc{|obj| obj.reply_pr_important.blank?} 
  validates_presence_of :reply_pr_significant,  :if => :message_relevance?, :unless => proc{|obj| obj.reply_pr_significant.blank?} 
  validates_presence_of :reply_oc_relevant,  :if => :message_relevance?, :unless => proc{|obj| obj.reply_oc_relevant.blank?} 
  validates_presence_of :reply_oc_meaningful,  :if => :message_relevance?, :unless => proc{|obj| obj.reply_oc_meaningful.blank?} 
  validates_presence_of :reply_oc_important,  :if => :message_relevance?, :unless => proc{|obj| obj.reply_oc_important.blank?} 
  validates_presence_of :reply_oc_significant,  :if => :message_relevance?, :unless => proc{|obj| obj.reply_oc_significant.blank?}
  
  validates_presence_of :reply_pr_relevant_ck, :if => :message_relevance?, :unless => proc{|obj| obj.reply_pr_relevant_ck.blank?}  
  validates_presence_of :reply_pr_meaningful_ck,  :if => :message_relevance?, :unless => proc{|obj| obj.reply_pr_meaningful_ck.blank?} 
  validates_presence_of :reply_pr_important_ck,  :if => :message_relevance?, :unless => proc{|obj| obj.reply_pr_important_ck.blank?} 
  validates_presence_of :reply_pr_significant_ck,  :if => :message_relevance?, :unless => proc{|obj| obj.reply_pr_significant_ck.blank?} 
  validates_presence_of :reply_oc_relevant_ck,  :if => :message_relevance?, :unless => proc{|obj| obj.reply_oc_relevant_ck.blank?} 
  validates_presence_of :reply_oc_meaningful_ck,  :if => :message_relevance?, :unless => proc{|obj| obj.reply_oc_meaningful_ck.blank?} 
  validates_presence_of :reply_oc_important_ck,  :if => :message_relevance?, :unless => proc{|obj| obj.reply_oc_important_ck.blank?} 
  validates_presence_of :reply_oc_significant_ck,  :if => :message_relevance?, :unless => proc{|obj| obj.reply_oc_significant_ck.blank?}
  
  validate 		:at_least_4_reply_evals, :if => :message_relevance?
  
  def at_least_4_reply_evals
    dummyvar8 = 0
    if reason_nrep != "1.\r\n2.\r\n3.\r\n..."
    dummyvar8 += 4
    end
    if !reply_pr_relevant.blank? 
    dummyvar8 += 1
    end
    if !reply_pr_meaningful.blank? 
    dummyvar8 += 1
    end
    if !reply_pr_important.blank? 
    dummyvar8 += 1
    end
    if !reply_pr_significant.blank? 
    dummyvar8 += 1
    end
    if !reply_oc_relevant.blank? 
    dummyvar8 += 1
    end
    if !reply_oc_meaningful.blank? 
    dummyvar8 += 1
    end
    if !reply_oc_important.blank? 
    dummyvar8 += 1
    end
    if !reply_oc_significant.blank? 
    dummyvar8 += 1
    end
  
    if reply_pr_relevant_ck.blank?
    dummyvar8 == 1
    end
    if reply_pr_meaningful_ck.blank?
    dummyvar8 == 1
    end
    if reply_pr_important_ck.blank?
    dummyvar8 == 1
    end
    if reply_pr_significant_ck.blank?
    dummyvar8 == 1
    end
    if reply_oc_relevant_ck.blank?
    dummyvar8 == 1
    end
    if reply_oc_meaningful_ck.blank?
    dummyvar8 == 1
    end
    if reply_oc_important_ck.blank?
    dummyvar8 == 1
    end
    if reply_oc_significant_ck.blank?
    dummyvar8 == 1
    end
  
    if reply_pr_relevant_ck==1 
    dummyvar8 += 1
    end
    if reply_pr_meaningful_ck==1
    dummyvar8 += 1
    end
    if reply_pr_important_ck==1
    dummyvar8 += 1
    end
    if reply_pr_significant_ck==1
    dummyvar8 += 1
    end
    if reply_oc_relevant_ck==1
    dummyvar8 += 1
    end
    if reply_oc_meaningful_ck==1
    dummyvar8 += 1
    end
    if reply_oc_important_ck==1
    dummyvar8 += 1
    end
    if reply_oc_significant_ck==1
    dummyvar8 += 1
    end
    if dummyvar8 < 4
      if self.reply_1_clicked > 0 || self.reply_2_clicked > 0
	errors.add_to_base("Please use at least 4 of the sliders to evaluate the reply you have done in the simulation.")
      elsif self.reply_1_clicked == 0 && self.reply_2_clicked == 0
        errors.add_to_base("Please mention at least one reason why you didn't reply the message in the simulation.")
      end
    end
  end
  
  validates_presence_of :irp_imagine, :if => :target_variables?, :unless => proc{|obj| obj.irp_imagine.blank?}  
  validates_presence_of :irp_act,  :if => :target_variables?, :unless => proc{|obj| obj.irp_act.blank?}
  validates_presence_of :irp_keep,  :if => :target_variables?, :unless => proc{|obj| obj.irp_keep.blank?}
  validate 		:all_3_eval_1, :if => :target_variables?
  
  def all_3_eval_1
    dummyvar9 = 0
    if !irp_imagine.blank? 
    dummyvar9 += 1
    end
    if !irp_act.blank? 
    dummyvar9 += 1
    end
    if !irp_keep.blank? 
    dummyvar9 += 1
    end
    if dummyvar9 < 3
        errors.add_to_base("Please mention how difficult the tasks were for you.")
    end
  end
  
  validates_presence_of :cr_imagine,  :if => :target_variables?, :unless => proc{|obj| obj.cr_imagine.blank?} 
  validates_presence_of :cr_act,  :if => :target_variables?, :unless => proc{|obj| obj.cr_act.blank?} 
  validates_presence_of :cr_keep,  :if => :target_variables?, :unless => proc{|obj| obj.cr_keep.blank?}
  validate 		:all_3_eval_2, :if => :target_variables?
  
  def all_3_eval_2
    dummyvar10 = 0
    if !cr_imagine.blank? 
    dummyvar10 += 1
    end
    if !cr_act.blank? 
    dummyvar10 += 1
    end
    if !cr_keep.blank? 
    dummyvar10 += 1
    end
    if dummyvar10 < 3
        errors.add_to_base("Please mention how shure of task fulfillment you are.")
    end
  end
  
  def current_step
      @current_step || steps.first
  end
  
  def introduction?
    current_step == "introduction"
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
  
  def twitter_motivation?
    current_step == "twitter_motivation"
  end

  def opinionleader?
   current_step == "opinionleader"
  end
  
  def interest?
    current_step == "interest"
  end
  
  def twitter_motivation?
    current_step == "twitter_motivation"
  end
  
  def sources?
    current_step == "sources"
  end
  
  def sources_extent?
    current_step == "sources_extent"
  end
  
  def reasons_for_ol?
    current_step == "reasons_for_ol"
  end
  
  def twitter?
    current_step == "twitter"
  end
  
  def message_relevance?
    current_step == "message_relevance"
  end
  
  def target_variables?
    current_step == "target_variables"
  end
  
  def behavioral_expectation?
    current_step == "behavioral_expectation"
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
      %w[ introduction selection demographic internet twitter_motivation opinionleader interest sources sources_extent reasons_for_ol
	 twitter message_relevance target_variables behavioral_expectation target]          
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
      #If the user does not have an active twitter account
      if twitter_account != nil && twitter_account < 2
	does_not_qualify = true
      end      
      #If the user has not selected politcs as the first or second choice
      if current_step == "internet"
	if interest_list[0] == "11" || interest_list[1] == "11" || interest_list[2] == "11" || interest_list[3] == "11" || interest_list[4] == "11"
	  print "User did qualify"
	else	  
	  does_not_qualify = true
	end
      end
      # If Country is one of those without defence ministry
      if current_step == "internet"
	if country == 4 || country == 15 || country == 20 || country == 38 || country == 41 || country == 49 || country == 68 || country == 70 || country == 89 || country == 101 || country == 110 || country == 111 || country == 115 || country == 117 || country == 124 || country == 128 || country == 130 || country == 134 || country == 135 || country == 146 || country == 147 || country == 148 || country == 149 || country == 150 || country == 160 || country == 176 || country == 182 || country == 190 || country == 191
	does_not_qualify = true
	end 
      end
      if current_step == "twitter_motivation"
	if avg_retweet == 7
	  does_not_qualify = true
	end
      end
#      if current_step == "sources"
#	  if def_gen == 1 || for_gen == 1 
#	  does_not_qualify = true
#	end
#      end
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
