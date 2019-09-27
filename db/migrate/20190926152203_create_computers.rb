class CreateComputers < ActiveRecord::Migration[6.0]
  def change
    create_table :computers do |t|
      t.string :name, :default => "Computer"
      t.integer :game_id
      t.timestamps
    end
  end
end
