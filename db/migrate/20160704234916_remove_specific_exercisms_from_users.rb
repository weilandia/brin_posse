class RemoveSpecificExercismsFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :ruby_exercisms, :string
    remove_column :users, :js_exercisms, :string
  end
end
