json.array!(@tabs) do |tab|
  json.extract! tab, :id
  json.url tab_url(tab, format: :json)
end
