class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :fullname
      t.string :email
      t.string :github
      t.string :cohort
      t.integer :ruby_exercisms
      t.integer :js_exercisms
      t.integer :all_exercisms

      t.timestamps null: false
    end
  end
end
