json.array!(@users) do |user|
  json.extract! user, :id, :fullname, :email, :github, :exercism_count
  json.url user_url(user, format: :json)
end
