json.array!(@boys) do |boy|
  json.extract! boy, :id, :name, :user_id, :age, :height, :weight, :class
  json.url boy_url(boy, format: :json)
end
