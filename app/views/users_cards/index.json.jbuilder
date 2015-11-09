json.array!(@users_cards) do |users_card|
  json.extract! users_card, :id, :user_id, :card_id
  json.url users_card_url(users_card, format: :json)
end
