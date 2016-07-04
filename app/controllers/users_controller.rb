class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
    @mentors = Mentor.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.register(user_params)
    if @user
      redirect_to users_path
    else
      render :exercism_new
    end
  end

  def update
    if @user.update(user_params)
      redirect_to users_path
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_url
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:fullname, :email, :github, :cohort, :ruby_exercisms, :js_exercisms, :all_exercisms)
    end
end
