require 'rest_client'

class ::Hash
  def method_missing(name)
    return self[name] if key? name
    self.each { |k,v| return v if k.to_s.to_sym == name }

    nil
  end
end

class IgdbGamesController < JSONAPI::ResourceControllerMetal
  def initialize
    super

  end

  def index
    search_params = {fields: "*"}
    search_params[:search] = params[:query] if params[:query]

    response = RestClient.get("https://api-2445582011268.apicast.io/games/", {params: search_params, "user-key" => ENV["IGDB_KEY"]})
    data = JSON.parse(response.body)
    resources = data.map { |g| IgdbGameResource.new(g, nil) }
    games = JSONAPI::ResourceSerializer.new(IgdbGameResource).serialize_to_hash(resources)

    render json: games
  end
end
