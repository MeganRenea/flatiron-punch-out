class AddUserHitsToGames < ActiveRecord::Migration[6.0]
  def change
    add_column :games, :user_hits, :integer, :default => 0
  end
end
