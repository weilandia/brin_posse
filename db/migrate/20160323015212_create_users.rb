class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :fullname
      t.string :email
      t.string :github
      t.string :cohort
      t.integer :exercisms

      t.timestamps null: false
    end
  end
end
