class IgdbGameResource < JSONAPI::Resource
  attributes :name, :summary, :popularity, :release_dates, :screenshots, :time_to_beat, :cover
end
