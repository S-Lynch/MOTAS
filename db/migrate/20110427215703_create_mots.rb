class CreateMots < ActiveRecord::Migration
  def self.up
    create_table :mots do |t|
      t.date :mot_date
      t.integer :user_id

      t.timestamps
    end
    add_index :mots, :user_id
  end

  def self.down
    drop_table :mots
  end
end
