json.array!(@dates) do |date|
  json.extract! date, :name, :url
end
