json.array!(@saturdays) do |bus|
  json.extract! bus, :hour, :times
end
