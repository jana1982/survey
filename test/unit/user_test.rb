require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  def test_with_at_and_one_topic
    user = User.new
    user.seen_multiple_messages = false
    user.seen_at = true
    user.generate_messages
    assert user.seen_message_1.include? "@"
    assert user.seen_message_2 == ""
  end
  
  def test_with_at_and_two_topics
    user = User.new
    user.seen_multiple_messages = true
    user.seen_at = true
    user.generate_messages
    assert user.seen_message_1.include? "@"
    assert user.seen_message_2 != ""
  end
  
  def test_with_no_at_and_two_topics
    user = User.new
    user.seen_multiple_messages = true
    user.seen_at = false
    user.generate_messages
    assert !user.seen_message_1.include?("@") 
    assert !user.seen_message_2.include?("@") 
    assert user.seen_message_2 != ""
    assert user.seen_message_1 != ""
    assert user.seen_message_1 != user.seen_message_2
  end
  
  def test_with_no_at_and_one_topic
    user = User.new
    user.seen_multiple_messages = false
    user.seen_at = false
    user.generate_messages
    assert user.seen_message_1 != ""
    assert user.seen_message_2 == ""
    assert !user.seen_message_1.include?("@")
    assert !user.seen_message_2.include?("@")
  end
  
 rt_1 = 0
 no_rt1 = 0
 rt_2 = 0
 no_rt2 = 0

 800.times do
   u = User.new
   u.setup
   if u.seen_retweet_message1
    rt_1 += 1
   else
     no_rt1 += 1
   end
   
   if u.seen_retweet_message2
     rt_2 += 1
   else
     no_rt2 += 1
   end   
 end
 puts "rt #{rt_1}, no_rt1: #{no_rt1}, rt2: #{rt_2}, no_rt2:#{no_rt2}"
  
end
