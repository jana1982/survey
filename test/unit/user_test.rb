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
  
  
end
