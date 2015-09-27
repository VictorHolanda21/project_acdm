json.array!(@administrators) do |administrator|
  json.extract! administrator, :id, :full_name, :user_name
  json.url administrator_url(administrator, format: :json)
end
