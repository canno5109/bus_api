json.array!(@busStops) do |bus|
  json.extract! bus, :bus_stop_name, :bus_stop_url
end
