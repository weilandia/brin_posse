class RemoveCompleteFromPairingSessions < ActiveRecord::Migration
  def change
    remove_column :pairing_sessions, :complete
  end
end
