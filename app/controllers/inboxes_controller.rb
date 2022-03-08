require 'date'

class InboxesController < ApplicationController
  def index
    if current_user
      @me = current_user
    else
      redirect_to new_user_session_path, notice: 'You are not logged in.'
    end

    current_user.inboxes.map do |inbox|
      Inbox.destroy(inbox.id) if inbox.letters.length.zero?
    end

    @me = current_user

    @me.inboxes.reverse.each do |inbox|
      @receiver = inbox.first_user == current_user ? inbox.second_user : inbox.first_user

      @markers = [
        {
          lat: @receiver.latitude,
          lng: @receiver.longitude,
          info_window: render_to_string(partial: "inboxes_info_window", locals: { receiver: @receiver }),
          image_url: helpers.asset_url("marker.png")
        }
      ]
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
    redirect_to pals_path
  end
end
