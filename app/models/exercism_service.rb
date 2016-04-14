class ExercismService
  attr_reader :stats
  def initialize(user)
    @stats ||= collect_stats(parse(Faraday.get("http://exercism.io/api/v1/users/#{user.github}/statistics")))
  end

  def collect_stats(response)
    if response.keys != ["error"]
      response["statistics"].select do |track|
        track["language"] == "Ruby" || track["language"] == "JavaScript"
      end
    end
  end

  def ruby
    if @stats
      @stats.last["completed"].length
    end
  end

  def js
    if @stats
      @stats.first["completed"].length
    end
  end

private
  def parse(response)
    JSON.parse(response.body, symbolize_name: true)
  end
end
