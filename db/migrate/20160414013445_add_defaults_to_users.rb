class AddDefaultsToUsers < ActiveRecord::Migration
  def change
    change_column_default(:users, :js_exercisms, 0)
    change_column_default(:users, :ruby_exercisms, 0)
    remove_column :users, :all_exercisms
  end
end
