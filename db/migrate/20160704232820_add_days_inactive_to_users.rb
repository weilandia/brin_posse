class AddDaysInactiveToUsers < ActiveRecord::Migration
  def change
    add_column :users, :days_inactive, :integer, default: 0
  end
end
