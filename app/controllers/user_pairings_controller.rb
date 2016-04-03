class UserPairingsController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @users = User.all
    @user_pairing = UserPairing.new
  end

  def create
    ps = PairingSession.create
    User.find(params[:user_id]).user_pairings.create(pairing_session_id: ps.id)
    User.find(params[:user_pairing][:user_id]).user_pairings.create(pairing_session_id: ps.id)
    redirect_to root_path
  end
end
