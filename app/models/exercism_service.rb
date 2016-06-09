class ExercismService
  attr_reader :stats
  def initialize(user)
    @stats ||= parse(Faraday.get("http://exercism.io/api/v1/users/#{user.github}/statistics"))
  end

  def track_stats(track)
    @stats["submission_statistics"][track]["total"].to_i if @stats["submission_statistics"][track]["total"]
  end

  def comment_stats
    @stats["comment_statistics"]["total_comments_given_to_others"] if @stats
  end

private
  def parse(response)
    JSON.parse(response.body, symbolize_name: true)
  end
end
