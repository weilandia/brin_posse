desc "This task is called by the Heroku scheduler"
task update_exercism_stats: :environment do
  User.all.each do |user|
    user.update_exercism_stats
  end
end
