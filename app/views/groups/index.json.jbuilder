json.array!(@groups) do |group|
  json.extract! group, :id, :user_id, :group_name, :private, :subscribers_only
  json.url group_url(group, format: :json)
end
