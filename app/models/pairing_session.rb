class PairingSession < ActiveRecord::Base
  has_many :user_pairings
  has_many :users, through: :user_pairings

  def date
    created_at.strftime("%B %d, %Y")
  end
end
