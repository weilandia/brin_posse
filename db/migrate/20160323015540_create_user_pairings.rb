class CreateUserPairings < ActiveRecord::Migration
  def change
    create_table :user_pairings do |t|
      t.references :user, index: true, foreign_key: true
      t.references :pairing_session, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
