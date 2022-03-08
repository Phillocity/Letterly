class UsersController < ApplicationController
  def index
    if params[:query].present? && params[:age].present?
      @users = filter_existing(User.search_user(params[:query])).filter { |user| user.age.between?(16, params[:age].to_i)}.sample(5)
    elsif params[:query].present?
      @users = filter_existing(User.search_user(params[:query]))
    elsif params[:age].present?
      @users = User.all.filter { |user| user.age.between?(16, params[:age].to_i)}.sample(5)
    else
      @users = filter_existing(User.all.order('RANDOM()')).first(5)
    end

    @markers = @users.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude,
        info_window: "<h2>#{user.name}</h2>\n<p>#{user.address}</p>\n",
        image_url: helpers.asset_url("marker.png")
      }
    end

    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: 'shared/user_select', locals: { users: @users }, formats: [:html] }
    end
  end

  private

  def filter_existing(user_list)
    exclusions = current_user.inboxes.collect(&:second_user).collect(&:id) << current_user.id
    user_list.filter{ |user| exclusions.exclude?(user.id) }
  end
end
