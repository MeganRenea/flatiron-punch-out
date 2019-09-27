class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.integer :fighter_id
      t.integer :challenger_id
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
