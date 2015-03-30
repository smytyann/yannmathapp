json.array!(@powers) do |power|
  json.extract! power, :id, :powernum
  json.url power_url(power, format: :json)
end
