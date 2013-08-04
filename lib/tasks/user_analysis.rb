ENV["RAILS_ENV"] = "production"
require File.expand_path(File.dirname(__FILE__) + "/../../config/environment")

users = User.all.select{|u| u.created_at > Time.now - 2.weeks}

result = {}
for n in 1..14
    result[n] = 0
end

users.each do |user|
    result[1] += 1 if user.twitter_account != nil
    result[2] += 1 if user.alter != nil
    result[3] += 1 if user.account_name != nil
    result[4] += 1 if user.pass_time != nil
    result[5] += 1 if (user.ol_1 != nil || user.ol_2 != nil || user.ol_3 != nil || user.ol_4 != nil || user.ol_5 != nil || user.ol_6 != nil || user.ol_7 != nil || user.ol_8 != nil || user.ol_9 != nil || user.ol_10 != nil || user.ol_11 != nil || user.ol_12 != nil )
    result[6] += 1 if (user.slider != nil || user.dk_pol_percentage != nil )
    result[7] += 1 if user.rank_source != nil
    result[8] += 1 if (user.tv_website != nil || user.locals_mb != nil || user.blogs != nil|| user.other_sources_txt != nil)
    result[10] += 1 if user.mousetracks != nil
    result[11] += 1 if (user.message_important != nil || user.message_meaningful != nil || user.message_for_me != nil || user.message_remember != nil || user.message_value != nil)
    result[12] += 1 if user.irp_imagine != nil
    result[13] += 1 if (user.beh_exp_retweet != nil || user.beh_exp_reply != nil || user.beh_exp_favorite != nil || user.beh_exp_write != nil)
    result[14] += 1 if (user.teilnahme_weitere_befr != nil || user.shared_survey != nil || user.results != nil || user.email != nil)
end

for n in 1..14
    puts "#{result[n]} Personen haben Seite #{n} ausgefüllt. #{result[n]/users.count.to_f} %. " 
end