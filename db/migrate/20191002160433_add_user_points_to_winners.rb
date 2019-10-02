class AddUserPointsToWinners < ActiveRecord::Migration[6.0]
  def change
    add_column :winners, :user_points, :integer, :default => 0
  end
end
