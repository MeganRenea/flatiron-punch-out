class CreateComputers < ActiveRecord::Migration[6.0]
  def change
    create_table :computers do |t|
      t.string :name, :default => "Computer"
      t.integer :game_id
      t.integer :hp, :default => 100
      t.integer :ap, :default => 15
      t.timestamps
    end
  end
end
