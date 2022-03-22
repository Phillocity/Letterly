class UsersController < ApplicationController
  def index
    age = params[:age].present? ? params[:age].to_i : 100

    if params[:query].present?
      @users = filter_existing(User.search_user(params[:query]))
      @users = @users.select { |user| user.age.to_i.between?(16, age) }
    else
      @users = filter_existing(User.all)
      @users = @users.select { |user| user.age.to_i.between?(16, age) }
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

  def edit
    @user = user.find(params[:pal_id])
  end

  def update
    @user = User.find(params[:pal_id])
    @user.update(user_params)
    redirect_to pal_inboxes_path, notice: 'Your information was successfully updated.'
  end

  def update_avatar
    @user = User.find(params[:pal_id])
    randomizer = ('a'..'z').to_a
    @user.avatar = "https://avatars.dicebear.com/api/bottts/#{randomizer.sample(rand(1..26)).join}.svg"
    @user.save
    redirect_to request.referrer
  end

  private

  def user_params
    params.require(:user).permit(:name, :address, :age, :gender, :description, :avatar)
  end

  def filter_existing(user_list)
    exclusions = current_user.inboxes.collect(&:second_user).collect(&:id) << current_user.id
    user_list.filter { |user| exclusions.exclude?(user.id) }
  end
end
