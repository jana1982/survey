class CreateOpinionleaders < ActiveRecord::Migration
  def self.up
    create_table :opinionleaders do |t|
      t.integer :user_id
      t.text :ol

      t.timestamps
    end
  end

  def self.down
    drop_table :opinionleaders
  end
end
