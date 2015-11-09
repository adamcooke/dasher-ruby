require 'moonrope_client'

module Teledash
  class Client

    attr_reader :host, :token, :port, :ssl

    def initialize(host, token, options = {})
      @host = host
      @token = token
      @port = options[:port]
      @ssl = options[:ssl]
    end

    def screens
      api.screens.list!.data
    end

    def screen(id)
      api.screens.details!(:id => id).data
    end

    def update_property(square, key, value)
      api.squares.update_property!(:square => square, :key => key, :value => value).data
    rescue MoonropeClient::RequestError => e
      e.result.data["code"] == "ValidationError" ? false : raise
    end

    private

    def api
      @client ||= begin
        MoonropeClient::Connection.new(host, :headers => {'X-Auth-Token' => token}, :ssl => port == 443, :port => port)
      end
    end

  end
end
