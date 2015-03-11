Given /^I am signed in with provider facebook$/ do
  # Newly added
 
  visit "/auth/facebook"

end

Then /^user "(.*?)" should not exist$/ do |user_email|
  !User.find_by_email(user_email)
end

Then /^user "(.*?)" should  exist$/ do |user_email|
  !!User.find_by_email(user_email)
end

When /^I am signed in$/ do
  step %Q{I am on the homepage}
  step %Q{I follow "Sign up"}
  step %Q{I wait a bit}
  step %Q{I wait a bit}
  step %Q{I wait a bit}
  step %Q{I fill in "Email" with "helloworld@gmail.com"}
  step %Q{I fill in "First name" with "Hello"}
  step %Q{I fill in "Last name" with "World"}
  step %Q{I fill in "Password" with "helloworld"}
  step %Q{I fill in "Password confirmation" with "helloworld"}
  step %Q{I press "Sign up"}
end

When /^another has signed up$/ do
  step %Q{I am on the homepage}
  step %Q{I follow "Sign up"}
  step %Q{I wait a bit}
  step %Q{I wait a bit}
  step %Q{I wait a bit}
  step %Q{I fill in "Email" with "helloworld2@gmail.com"}
  step %Q{I fill in "First name" with "Hello2"}
  step %Q{I fill in "Last name" with "World2"}
  step %Q{I fill in "Password" with "helloworld2"}
  step %Q{I fill in "Password confirmation" with "helloworld2"}
  step %Q{I press "Sign up"}
  step %Q{I follow "Sign out"}
end