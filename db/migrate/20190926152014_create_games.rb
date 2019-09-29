class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.integer :user_id
      t.integer :computer_id
      t.integer :round, :default => 1
      t.integer :user_wins, :default => 0
      t.integer :computer_wins, :default => 0
      t.string :fight_pic
      t.string :front_hit_pic
      t.string :back_hit_pic
      t.string :front_miss
      t.string :back_miss
      t.string :front_knockout
      t.string :back_knockout
      t.timestamps
    end
  end
end
