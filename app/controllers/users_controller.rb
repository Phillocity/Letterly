class UsersController < ApplicationController
  def index
    User.all
  end
end
