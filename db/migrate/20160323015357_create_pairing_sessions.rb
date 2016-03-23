class CreatePairingSessions < ActiveRecord::Migration
  def change
    create_table :pairing_sessions do |t|
      t.integer :complete, default: 0

      t.timestamps null: false
    end
  end
end
