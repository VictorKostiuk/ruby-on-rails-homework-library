# frozen_string_literal: true

require 'faraday'
require 'json'

class WorldTimeApi
  def self.user
    url  = 'http://worldtimeapi.org/api/timezone/Europe/Kiev'
    data = Faraday.get(url).body
    JSON.parse(data, symbolize_names: true)
  end
end
