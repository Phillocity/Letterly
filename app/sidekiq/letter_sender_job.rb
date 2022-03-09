class LetterSenderJob < ActiveJob::Base
  queue_as :default
  # include Sidekiq::Job

  def perform(user)
    puts "Hello #{user}..."
    sleep 2
    puts "Bye #{user}"
  end
end
