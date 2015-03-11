Given(/^the following articles exist:$/) do |articles_table|
  articles_table.hashes.each do |hash|
    user = User.find(hash.delete("user_id"))
    article = Article.new(hash.merge(user_id: user.id))
    article.save(validate: false)
    user.articles << article
  end
end

Then /^article url "(.*?)" should exist$/ do |article_url|
  !!Article.find_by_url(article_url)
end

Given(/^the following comments exist:$/) do |table|
  table.hashes.each do |hash|
    article = Article.find(hash.delete("article_id"))
    user = User.find(hash.delete("user_id"))
    comment = article.comments.build(hash)
    article.save! validate: false
    user.comments << comment
  end
end

Given(/^the following likes exist:$/) do |table|
  table.hashes.each do |hash|
    article = Article.find(hash.delete("article_id"))
    user = User.find(hash.delete("user_id"))
    like = Like.new
    like.save!
    user.likes << like
    article.likes << like
  end
end