json.categories do
  json.array! @licenses, :id, :game_id, :user_id, :key
end
