class ExercismService
  attr_reader :stats
  def initialize(user)
    begin
      @stats ||= parse(Faraday.get("http://exercism.io/api/v1/users/#{user.github}/statistics"))
    rescue
      @stats = nil
    end
  end

  def on_exercism?
    @stats
  end

  def track_stats
    @stats["submission_statistics"]
  end

  def comment_stats
    @stats["comment_statistics"]
  end

private
  def parse(response)
    JSON.parse(response.body, symbolize_name: true)
  end
end
