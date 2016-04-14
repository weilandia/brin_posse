class ExercismService
  attr_reader :stats
  def initialize(user)
    @stats ||= collect_stats(parse(Faraday.get("http://exercism.io/api/v1/users/#{user.github}/statistics")))
  end

  def collect_stats(response)
    require "pry"; binding.pry
    response["statistics"].select do |track|
      track["language"] == "Ruby" || track["language"] == "JavaScript"
    end
  end

  def ruby
    @stats.last["completed"].length
  end

  def js
    @stats.first["completed"].length
  end

private
  def parse(response)
    JSON.parse(response.body, symbolize_name: true)
  end
end
