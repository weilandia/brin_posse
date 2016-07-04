class AddStatsToUsers < ActiveRecord::Migration
  def change
    enable_extension "hstore"
    add_column :users, :exercism_stats, :hstore
  end
end
