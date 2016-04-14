class User < ActiveRecord::Base
  before_save :build_name
  has_many :user_roles
  has_many :roles, through: :user_roles
  has_many :user_pairings
  has_many :pairing_sessions, through: :user_pairings

  validates :fullname, presence: true
  validates :email, presence: true, uniqueness: true

  enum role: %w(default admin)

  def build_name
    self.first_name = fullname.split[0]
    self.last_name = fullname.split[1..-1].join(" ")
  end

  def self.api_updates
    all.each do |user|
      exercisms = ExercismService.new(user)
      if user.updates?(exercisms)
        user.update_attributes(ruby_exercisms: exercisms.ruby, js_exercisms: exercisms.js)
      end
    end
    User.all
  end

  def updates?(exercisms)
    exercisms.ruby != ruby_exercisms || exercisms.js != js_exercisms
  end
end
