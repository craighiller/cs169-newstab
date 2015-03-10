Given /^I am signed in with provider facebook$/ do
  # Newly added
 
  visit "/auth/facebook"
  # visit user_omniauth_authorize_path

  # visit user_omniauth_callback_path
end

Then /^user "(.*?)" should not exist$/ do |user_email|
  !User.find_by_email(user_email)
end