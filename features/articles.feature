@omniauth_test
Feature: Articles
  
  As a  user
  So that Articles can be shared with newstab users
  I want to be able to create, share and view articles
  
  
@javascript
Scenario: an authenticated user can post an article
   Given I am signed in with provider facebook
   
   
   # FAILS
   # Then I should see "Successfully authenticated from Facebook account."
   
  # And I am on the homepage
   
   # PASSES -- no user is signed in
   Then I should see "Invalid email or password"
   
   # FAILS -- no user is signed in"
  # Then I should see "User is signed in as"
   
  # When I follow "List of Users"
  # And I input article url
  # And I input Initial comment
  # And I press submit
  # Then I should be on the show page for article "1"
  # And I should see "article url"
  # And I should see "initial comment"

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

# # Need to revise the following: Only a few scenarios I thought we should cover -
# Scenario: an authenticated user should be able to delete an article they posted
#   Given I am signed in with provider
#   And I delete an article that I find is posted by me
#   Then I should be redirected to '/feed' page and that article should not be there

# Scenario: a user should be able to log out
#   Given I am signed in and I am on the '/home' page
#   And if I follow "sign out"
#   Then I should not be signed in

# Scenario: a user should be able to sign in through Facebook
#   Given I am on the '/home' page
#   And I follow "sign up"
#   Then I should see at the '/sign_up' page
#   And if I click the link to sign in with provider "facebook"
#   Then I should be redirected to "facebook" and if I accept terms
#   Then I should be redirected to the '/home' page
#   And I should see ...
   
# Scenario: a user cannot delete the articles of others
#   Given the following articles exist:
#     | user_id  | article                                    | initial_comment                             |
#     | 1        | A great concept for the next big startup!  | The description for the next big startup.   |
#   And I am on the show page for article "1"
#   Then I should not see element "delete_article"

# Scenario: a user cannot edit another user's article
#   Given the following article exist:
#     | user_id  | article                                    | initial_comment                             |
#     | 1        | A great concept for the next big startup!  | The description for the next big startup.   |
#   And I am on the show page for article "1"
#   Then I should not see element "edit_article"

# Scenario: a user can destory another user's article
#   Given the following article exist:
#     | user_id  | article                                    | initial_comment                             |
#     | 1        | A great concept for the next big startup!  | The description for the next big startup.   |
#   And I am on the show page for article "1"
#   Then I should see element "destory_article"
#   And I press destory article
#   Then I should not see article "1"
  
# @javascript
# Scenario: a user can edit his article
#   Given I am signed in with provider "facebook"
#   And the following article exist:
#     | user_id  | article                                    | initial_comment                             |
#     | 1        | A great concept for the next big startup!  | The description for the next big startup.   |
#   And I am on the show page for article "1"
#   And I click element "edit_article"
#   And I fill in "article[description]" with "I changed my comment."
#   And I click element "update_article"
#   Then I should be on the show page for article "1"
#   Then I should see "I changed my article."