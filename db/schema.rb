# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120628101326) do

  create_table "opinionleaders", :force => true do |t|
    t.integer  "user_id"
    t.text     "ol"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "seeds", :force => true do |t|
    t.integer  "batch_id"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "dirty"
    t.datetime "time_setup"
  end

  create_table "users", :force => true do |t|
    t.integer  "bildung",                   :limit => 255
    t.integer  "alter"
    t.integer  "retweet_2_clicked"
    t.boolean  "at_clicked"
    t.integer  "geschlecht",                :limit => 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "martial_status"
    t.integer  "language"
    t.integer  "country"
    t.integer  "years"
    t.integer  "twitter_account"
    t.integer  "income"
    t.integer  "area"
    t.integer  "children"
    t.integer  "employment"
    t.string   "employment_text"
    t.integer  "position"
    t.string   "position_text"
    t.string   "bildung_text"
    t.integer  "organization"
    t.string   "organization_text"
    t.integer  "private_pc"
    t.integer  "private_mobile"
    t.integer  "work_pc"
    t.integer  "work_mobile"
    t.integer  "public"
    t.integer  "favorite_2_clicked"
    t.string   "leader_text"
    t.integer  "reply_2_clicked"
    t.string   "reply_text"
    t.string   "tweet_text"
    t.string   "search"
    t.float    "retweet_time_m1"
    t.float    "favorite_time_m1"
    t.float    "message_hover_m1"
    t.float    "reply_time_m1"
    t.float    "new_tweet_time"
    t.integer  "retweet_importance"
    t.string   "tweet_text_n"
    t.string   "seen_message_1"
    t.string   "ol_1"
    t.string   "ol_2"
    t.string   "ol_3"
    t.string   "ol_4"
    t.string   "ol_5"
    t.string   "ol_6"
    t.string   "ol_7"
    t.string   "ol_8"
    t.string   "ol_9"
    t.string   "ol_10"
    t.string   "ol_11"
    t.string   "ol_12"
    t.string   "ol_list"
    t.string   "seen_person"
    t.float    "open_time_m1"
    t.float    "search_time"
    t.boolean  "seen_retweet_message1",     :limit => 255
    t.integer  "expand_2_clicked"
    t.float    "experiment_time"
    t.boolean  "seen_at",                   :limit => 255
    t.integer  "connect_clicked"
    t.integer  "favorite_at_clicked"
    t.integer  "retweet_at_clicked"
    t.boolean  "seen_retweet_message2",     :limit => 255
    t.float    "open_time_at"
    t.float    "reply_time_at"
    t.float    "retweet_time_at"
    t.float    "favorite_time_at"
    t.float    "message_hover_time_at"
    t.integer  "open_clicked_at"
    t.string   "reply_text_at"
    t.integer  "reply_clicked_at"
    t.boolean  "seen_multiple_messages",    :limit => 255
    t.string   "seen_message_2"
    t.integer  "reply_1_clicked"
    t.integer  "favorite_1_clicked"
    t.integer  "retweet_1_clicked"
    t.integer  "expand_1_clicked"
    t.integer  "results"
    t.integer  "situation"
    t.string   "account_name"
    t.integer  "number_followers"
    t.integer  "number_followeees"
    t.integer  "number_messages"
    t.integer  "avg_tweet_number"
    t.integer  "avg_at_replies"
    t.integer  "avg_read_tweets"
    t.integer  "avg_stories"
    t.integer  "avg_trend"
    t.integer  "avg_retweet"
    t.integer  "avg_follow"
    t.integer  "avg_login"
    t.integer  "avg_search_keywords"
    t.integer  "avg_search_accounts"
    t.integer  "avg_activities_friends"
    t.integer  "avg_who_to_follow"
    t.integer  "avg_browse_categories"
    t.integer  "avg_find_friends"
    t.integer  "avg_create_lists"
    t.integer  "avg_add_accounts_lists"
    t.integer  "avg_subscribe_lists"
    t.integer  "avg_delete_accounts_lists"
    t.integer  "avg_unfollow_account"
    t.integer  "avg_favorite_tweets"
    t.integer  "surf_twitter_week"
    t.integer  "surf_twitter_weekend"
    t.integer  "avg_private_replies"
    t.string   "seen_seed"
    t.integer  "batch_id"
    t.float    "retweet_time_m2"
    t.float    "favorite_time_m2"
    t.float    "message_hover_m2"
    t.float    "reply_time_m2"
    t.float    "open_time_m2"
    t.string   "reply_text2"
  end

end
