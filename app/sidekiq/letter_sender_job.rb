class LetterSenderJob
  # queue_as :default
  include Sidekiq::Job

  def perform()
   # Simulates a long, time-consuming task
  #  sleep 2
   # Will display current time, milliseconds included
   puts "hello"
  end
end
