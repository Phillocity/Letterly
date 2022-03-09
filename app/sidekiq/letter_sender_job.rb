class LetterSenderJob
  # queue_as :default
  include Sidekiq::Job

  def perform(user)
    puts "Hello #{user}..."
    # TODO: perform a time consuming task like Clearbit's Enrichment API.
    sleep 2
    puts "Bye #{user}"
  end
end
