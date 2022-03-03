class InboxesController < ApplicationController
  def index
    if current_user
      @me = current_user
    else
      redirect_to new_user_session_path, notice: 'You are not logged in.'
    end
  end

  def show
  end
end
