json.array!(@holidays) do |bus|
  json.extract! bus, :hour, :times
end
