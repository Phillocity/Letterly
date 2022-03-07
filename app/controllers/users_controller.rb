class UsersController < ApplicationController
  def index

    @users = User.all
    @users_sample = []
    @markers = @users.geocoded.sample(5).map do |user|
      @users_sample << user
      {
        lat: user.latitude,
        lng: user.longitude,
        info_window: render_to_string(partial: "info_window", locals: { user: user }),
        image_url: helpers.asset_url("marker.png")
      }
    end

    if params[:query].present?
      @users = User.search_user(params[:query])
    end

    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: 'shared/user_select', locals: { users: @users}, formats: [:html] }
    end


  end
end
