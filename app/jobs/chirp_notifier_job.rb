class ChirpNotifierJob < ApplicationJob
  queue_as :default
  include HTTParty

  def perform(chirp_id)
    uri = URI("https://bellbird.joinhandshake-internal.com/push")
    header = {'Content-Type': 'application/json'}

    Sidekiq.logger.info "--> Uri: #{uri}"

    response = HTTParty.post(uri,
      :body => {"chirp_id" => chirp_id}.to_json,
      :headers => header, :debug_output => $stdout )
  end
end
