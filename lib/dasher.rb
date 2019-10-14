require 'dasher/client'

module Dasher

  class << self
    def client
      @client ||= Dasher::Client.new(ENV["DASHER_HOST"] || "dashertv.com", ENV["DASHER_TOKEN"], :port => 443, :ssl => true)
    end
  end

end
