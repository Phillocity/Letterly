class LettersController < ApplicationController

  def new
    @letter = Letter.new
  end

  def create
    @letter = Letter.new(letter_params)
    @letter.inbox_id = current_inbox.id
    if @letter.save
      redirect_to @users, notice: "Your letter was posted."
    else
      render :new, notice: "Something went wrong. Try again."
    end
  end

  def edit
  end

  private

  def pokemon_params
    params.require(:letter).permit(:content, :subject)
  end
end
