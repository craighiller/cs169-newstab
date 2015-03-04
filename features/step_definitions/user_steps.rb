Given /^I am signed in with provider "(.*)"$/ do |authentication|
  visit "/auth/#{authentication.downcase}"
end

Then /^user "(.*?)" should not exist$/ do |user_email|
  !User.find_by_email(user_email)
end