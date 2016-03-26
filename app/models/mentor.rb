class Mentor < ActiveRecord::Base
  class User < ActiveRecord::Base
    before_save :build_name

    validates :fullname, presence: true
    validates :email, presence: true, uniqueness: true
    validates :company, presence: true
    validates :location, presence: true

    def build_name
      self.first_name = fullname.split[0]
      self.last_name = fullname.split[1..-1].join(" ")
    end
  end
end
