class AddPointsToGames < ActiveRecord::Migration[6.0]
  def change
    add_column :games, :points, :interger, :default => 0
  end
end
