json.array!(@reviews) do |review|
  json.extract! review, :id, :design_id, :username, :note, :stars, :size, :, :performance, :gender, :boolean, :sport, :age, :size_purchased
  json.url review_url(review, format: :json)
end
