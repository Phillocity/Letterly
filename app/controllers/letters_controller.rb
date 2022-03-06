class LettersController < ApplicationController
  def new
    @letter = Letter.new
    @inbox = Inbox.find(params[:inbox_id])
    @receiver = current_user == @inbox.first_user ? @inbox.second_user : @inbox.first_user
  end

  def create
    @inbox = Inbox.find(params[:inbox_id])
    @letter = Letter.new(letter_params)
    @letter.inbox_id = @inbox.id
    @letter.sender_id = current_user.id
    @letter.receiver_id = @inbox.first_user_id == current_user.id ? @inbox.second_user_id : @inbox.first_user_id
    @letter.delivery_time = delivery_in_seconds(@letter.sender, @letter.receiver)

    if @letter.save
      redirect_to pals_path, notice: "Your letter was posted."
    else
      render :new, notice: "Something went wrong. Try again."
    end
    raise
  end

  def edit
  end

  private

  def letter_params
    params.require(:letter).permit(:content, :subject)
  end

  def delivery_in_seconds(user1, user2)
    user1 = user1.geocode
    user2 = user2.geocode
    distance = Geocoder::Calculations.distance_between(user1, user2)
    miles_per_hour = 80
    delivery_time_in_seconds = (distance / miles_per_hour) * 3600
    return delivery_time_in_seconds.to_i
  end

end
