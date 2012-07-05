class CreateNoRetweetReasons < ActiveRecord::Migration
  def self.up
    create_table :no_retweet_reasons do |t|
      t.integer :user_id
      t.text :reasons

      t.timestamps
    end
  end

  def self.down
    drop_table :no_retweet_reasons
  end
end
