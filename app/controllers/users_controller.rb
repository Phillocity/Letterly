class UsersController < ApplicationController
  def index
    @users = User.all.sample(5)
  end
end
