module Api
  module V1
    class UsersController < ApiController
      def update_exercism_stats
        @user = User.update_exercism_stats(params[:id])
      end
    end
  end
end
