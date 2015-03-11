@omniauth_test
Feature: Articles
  
  As a  user
  So that Articles can be shared with newstab users
  I want to be able to create, share and view articles
  
  Background:
    Given another has signed up
    And I am signed in
    And I am on the homepage

@javascript 
Scenario: a signed in user can post an article
   Then I should see "User is signed in as"
   Then I should see "New Article"
   Then I should see "My Profile"
   When I follow "New Article"
   And I fill in "Url" with "Hello_World_Article_URL.com"
   And I fill in "Initial comment" with "My first comment" 
   And I press "Create Article"
   Then I should see "Article created!"
   Then I should see "Hello_World_Article_URL.com"
   Then I should see "My first comment"
   Then article url "Hello_World_Article_URL.com" should exist

# Scenario: a non-Facebook user can sign up and post article
#    Given I am on the homepage
#    And I follow "Sign up"
#    When I fill in "Email" with "helloworld@gmail.com"
#    And I fill in "First name" with "Hello"
#    And I fill in "Last name" with "World"
#    And I fill in "Password" with "helloworld"
#    And I fill in "Password confirmation" with "helloworld"
#    Then I should see "New Article"
#    And if I follow "New Article"
  # Then I should see 

# # Need to revise the following: Only a few scenarios I thought we should cover -
# Scenario: an authenticated user should be able to delete an article they posted
#   Given I am signed in with provider
#   And I delete an article that I find is posted by me
#   Then I should be redirected to '/feed' page and that article should not be there

Scenario: a user should be able to log out
  Then I am on the homepage
  And I follow "Sign out"
  Then I should not see "Sign out"
  Then I should see "Sign up"

# Scenario: a user should be able to sign in through Facebook
#   Given I am on the '/home' page
#   And I follow "sign up"
#   Then I should see at the '/sign_up' page
#   And if I click the link to sign in with provider "facebook"
#   Then I should be redirected to "facebook" and if I accept terms
#   Then I should be redirected to the '/home' page
#   And I should see ...
   
Scenario: a user cannot edit another user's articles
  Given the following articles exist:
    | user_id  | url                                        | initial_comment                             |
    | 1        | cool_news_article.com                      | The description for the next big startup.   |
  Then I am on the show page for article "cool_news_article.com"
  And I follow "Edit Article"
  Then I should see "You do not have permission to edit this article."

Scenario: a user cannot delete another user's article
  Given the following articles exist:
    | user_id  | url                                        | initial_comment                             |
    | 1        | cool_news_article.com                      | The description for the next big startup.   |
  Then I am on the show page for article "cool_news_article.com"
  And I follow "Destroy Article"
  Then I should see "You do not have permission to delete this article."

Scenario: a user can destroy their own article
  Given the following articles exist:
    | user_id  | url                                    | initial_comment                             |
    | 2        | cool_news_article.com                  | The description for the next big startup.   |
  Then I am on the show page for article "cool_news_article.com"
  And I follow "Destroy Article"
  Then I should not see "cool_news_article.com"
  And I should not see "The description for the next big startup."
  
# @javascript
Scenario: a user can edit his article
  # Given I am signed in with provider "facebook"
  And the following articles exist:
    | user_id  | url                                    | initial_comment                             |
    | 2        | cool_news_article.com                  | The description for the next big startup.   |
  Then I am on the show page for article "cool_news_article.com"
  And I follow "Edit Article"
  And I fill in "Initial comment" with "I changed my comment."
  And I press "Update Article"
  Then I should see "Article successfully updated."
  And I am on the show page for article "cool_news_article.com"
  And I should see "I changed my comment."
