class LettersController < ApplicationController
  def new
    @letter = Letter.new
    @inbox = Inbox.find(params[:inbox_id])
  end

  def create
    @inbox = Inbox.find(params[:inbox_id])
    @letter = Letter.new(letter_params)
    @letter.inbox_id = @inbox.id
    @letter.sender_id = current_user.id
    @letter.receiver_id = @inbox.first_user_id == current_user.id ? @inbox.second_user_id : @inbox.first_user_id
    if @letter.save
      redirect_to pals_path, notice: "Your letter was posted."
    else
      render :new, notice: "Something went wrong. Try again."
    end
  end

  def edit
  end

  private

  def letter_params
    params.require(:letter).permit(:content, :subject)
  end
end
