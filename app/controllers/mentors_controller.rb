class MentorsController < ApplicationController
  def show
  end

  def new
    @mentor = Mentor.new
  end

  def edit
  end

  def create
    @mentor = Mentor.new(mentor_params)
    if @mentor.save
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    if @mentor.update(mentor_params)
      redirect_to mentors_path
    else
      render :edit
    end
  end

  def destroy
    @mentor.destroy
    redirect_to mentors_url
  end

  private

    def set_mentor
      @mentor = Mentor.find(params[:id])
    end

    def mentor_params
      params.require(:mentor).permit(:fullname, :email, :github, :cohort, :ruby_exercisms, :js_exercisms, :all_exercisms)
    end
end
