class CreateMentors < ActiveRecord::Migration
  def change
    create_table :mentors do |t|
      t.string :fullname
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :github
      t.string :company
      t.string :location

      t.timestamps null: false
    end
  end
end
