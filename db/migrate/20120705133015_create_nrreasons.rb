class CreateNrreasons < ActiveRecord::Migration
  def self.up
    create_table :nrreasons do |t|
      t.integer :user_id
      t.text :reason

      t.timestamps
    end
  end

  def self.down
    drop_table :nrreasons
  end
end
