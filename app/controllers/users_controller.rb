class UsersController < ApplicationController
  def index
    @users = User.all.sample(5)
    # @markers = @users.geocoded.map do |user|
    #   {
    #     lat: user.latitude,
    #     lng: user.longitude
    #   }
    # end
  end
end
