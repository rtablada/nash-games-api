require 'rest_client'

class IgdbGamesController < ApplicationController
  def initialize
    super

  end

  def index
    response = RestClient.get("https://api-2445582011268.apicast.io/games/", {params: {fields: "*", search: "batman"}, "user-key" => ENV["IGDB_KEY"]})

    render json: {
      games: JSON.parse(response.body)
    }
  end
end
