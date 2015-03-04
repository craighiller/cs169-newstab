@omniauth_test
Feature: Articles
  
  As a  user
  So that Articles can be shared with newstab users
  I want to be able to create, share and view articles
  
@javascript  
 Scenario: an authenticated user can post an article
   Given I am signed in with provider "facebook"
   When I follow "new article"

# Need to revise the following: Only a few scenarios I thought we should cover -
 Scenario: an authenticated user should be able to delete an article they posted
   Given I am signed in with provider
   And I delete an article that I find is posted by me
   Then I should be redirected to '/feed' page and that article should not be there

 Scenario: an user should be able to subscribe and unsubscribe to another user
   Given I am signed in and I am on '/home' page
  # Sub scenario: This user should see an updated news feed with articles 
  # posted by users to which they are subscribed.

 Scenario: an user should be able to log out
   Given I am signed in and I am on the '/home' page
   Then if I follow "sign out"
   Then I should not be signed in

 Scenario: a user should be able to sign in through Facebook
   Given I am on the '/home' page
   Then if I follow "sign up"
   Then I should see at the '/sign_up' page
   And if I click the link to sign in with provider "facebook"
   Then I should be redirected to "facebook" and if I accept terms
   Then I should be redirected to the '/home' page
   And I should see ...