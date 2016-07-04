class User < ActiveRecord::Base
  before_save :build_name
  has_many :user_roles
  has_many :roles, through: :user_roles
  has_many :user_pairings
  has_many :pairing_sessions, through: :user_pairings

  validates :fullname, presence: true
  validates :email, presence: true, uniqueness: true

  enum role: %w(default admin)

  def self.register(user_params)
    user = User.new(user_params)
    user.update_exercism_stats
  end

  def self.update_exercism_stats(id)
    user = User.find(id)
    user.update_exercism_stats
    user
  end

  def update_exercism_stats
    exercism = ExercismService.new(self)

    unless exercism.stats["error"]
      language_stats = exercism.stats["submission_statistics"].map do |lang|
        [lang[1]["language"], lang[1]["completed"].count]
      end

      language_stats = Hash[*language_stats.flatten]

      update_attributes(exercism_stats: language_stats)

      self.save
    end
  end

  def completed_exercism_count
    exercism_stats.values.map(&:to_i).inject(:+)
  end

  def build_name
    self.first_name = fullname.split[0]
    self.last_name = fullname.split[1..-1].join(" ")
  end
end
