class InboxesController < ApplicationController
  def index
    if current_user
      @me = current_user
    else
      redirect_to new_user_session_path, notice: 'You are not logged in.'
    end
  end

  def show
    @me = current_user
    @inbox = Inbox.find(params[:id])
  end

  def new
    @inbox = Inbox.new
  end

  def create
    @inbox = Inbox.new
    @inbox.first_user_id = current_user.id
    @inbox.second_user_id = User.find(params[:user_id]).id
    @inbox.save
    redirect_to new_inbox_letter_path(@inbox)
  end

  def destroy
    @inbox = Inbox.find(params[:id])
    @inbox.destroy
  end
end
