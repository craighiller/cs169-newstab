@omniauth_test
Feature: Articles
  
  As a  user
  So that Articles can be shared with newstab users
  I want to be able to create, share and view articles
  
  
@javascript

Scenario: a non-Facebook user can sign up and post article
   Given I am on the homepage
   And I follow "Sign up"
   When I fill in "Email" with "helloworld@gmail.com"
   And I fill in "First name" with "Hello"
   And I fill in "Last name" with "World"
   And I fill in "Password" with "helloworld"
   And I fill in "Password confirmation" with "helloworld"
   Then I should see "New Article"
   And if I follow "New Article"
  # Then I should see 