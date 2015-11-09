require 'teledash/client'

module Teledash

  class << self
    def client
      @client ||= Teledash::Client.new("teledash.vdtapp.com", ENV["TELEDASH_TOKEN"], :port => 443, :ssl => true)
    end
  end

end
