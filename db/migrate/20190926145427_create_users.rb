class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :hp, :default => 100
      t.integer :ap, :default => 10
      t.timestamps
    end
  end
end
