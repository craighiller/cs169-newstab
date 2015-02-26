json.array!(@articles) do |article|
  json.extract! article, :id, :url, :title, :datetime, :content, :photo
  json.url article_url(article, format: :json)
end
