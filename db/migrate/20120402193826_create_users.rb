class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :bildung
      t.integer :alter
      t.boolean :retweed_clicked
      t.boolean :at_clicked
      t.string :geschlecht
      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
