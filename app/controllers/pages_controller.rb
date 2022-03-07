class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    if user_signed_in?
      @avatar = current_user.avatar
      @name = current_user.name.titleize
    else
      @avatar = "avatar-placeholder.png"
      @name = ""
    end

    @users = User.all

    @markers = @users.geocoded.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude,
        info_window: render_to_string(partial: "users/info_window", locals: { user: user }),
        image_url: helpers.asset_url("marker.png")
      }
    end
  end
end
