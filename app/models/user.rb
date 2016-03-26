class User < ActiveRecord::Base
  before_save :build_name
  has_many :user_roles
  has_many :roles, through: :user_roles

  validates :fullname, presence: true
  validates :email, presence: true, uniqueness: true

  enum role: %w(default admin)

  def build_name
    self.first_name = fullname.split[0]
    self.last_name = fullname.split[1..-1].join(" ")
  end
end
