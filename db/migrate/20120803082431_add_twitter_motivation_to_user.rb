class AddTwitterMotivationToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :pass_time, :integer
    add_column :users, :entertain_myself , :integer
    add_column :users, :occupy_time, :integer
    add_column :users, :time_bored, :integer
    add_column :users, :forget_worries, :integer
    add_column :users, :help_others, :integer
    add_column :users, :support_others, :integer
    add_column :users, :show_encouragement, :integer
    add_column :users, :contribute, :integer
    add_column :users, :new_friends, :integer
    add_column :users, :new_people, :integer
    add_column :users, :get_know_other, :integer
    add_column :users, :keep_in_touch , :integer
    add_column :users, :find_people, :integer
    add_column :users, :communicate, :integer
    add_column :users, :gather_information, :integer
    add_column :users, :find_out_things , :integer
    add_column :users, :look_for_information , :integer
    add_column :users, :knowledgeable_individual, :integer
    add_column :users, :answers_questions, :integer
    add_column :users, :keep_connect, :integer
    add_column :users, :find_out, :integer
    add_column :users, :deepen_relationships, :integer
    add_column :users, :far_away , :integer  
  end

  def self.down
  end
end
