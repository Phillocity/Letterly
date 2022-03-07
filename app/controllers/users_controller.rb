class UsersController < ApplicationController
  def index
    @users = User.all.sample(5)

    if params[:query].present?
      @users = User.search_user(params[:query])
    end

    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: 'shared/user_select', locals: { users: @users}, formats: [:html] }
    end

  end
end
