Given(/^the following articles exist:$/) do |articles_table|
  articles_table.hashes.each do |hash|
    user = User.find(hash.delete("user_id"))
    article = Article.new(hash.merge(user_id: user.id))
    article.save(validate: false)
    user.article << article
  end
end

Then /^article url "(.*?)" should exist$/ do |article_url|
  !!Article.find_by_url(article_url)
end
