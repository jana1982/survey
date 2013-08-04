ENV["RAILS_ENV"] = "production"
require File.expand_path(File.dirname(__FILE__) + "/../config/environment")

users = User.all.select{|u| u.created_at > Time.now - 2.weeks}

result = {}
for n in 1..14
    result[n] = 0
end

users.each do |user|
    puts user.not_completed 
    result[1] += 1 if user.twitter_account != nil
    result[2] += 1 if user.alter != nil
    result[3] += 1 if user.account_name != nil
    result[4] += 1 if user.pass_time != nil
    result[5] += 1 if (user.ol_1 != nil || user.ol_2 != nil)
end

for n in 1..14
    puts "#{result[n]} Personen haben Seite #{n} ausgefüllt." 
end