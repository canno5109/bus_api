json.array!(@weekdays) do |bus|
  json.extract! bus, :hour, :times
end
