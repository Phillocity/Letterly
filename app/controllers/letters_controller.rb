class LettersController < ApplicationController

  def new
    @letter = Letter.new
  end

end
