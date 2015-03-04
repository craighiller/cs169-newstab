@omniauth_test
Feature: Comments
 
  As a user
  So that I can give my opinion on articles
  I want to be able to post comments

  Background:
    Given I am signed in with provider "facebook"
    And the following articles exist:
      | user_id  | url      | title       | content      | initial_comment       |
      | 1        | fake_url | Fake Title  | Fake content | Fake initial comment. |
    And I am on the homepage

Scenario: an unauthenticated user can see comments and who posted them
  Given the following comments exist:
    | user_id  | article_id  | body                             |
    | 1        | 1           | Some cool comment I want to add  |
  And I am on the show page for article "1"
  Then I should see element "comment_1"
  And I should see "Some cool comment I want to add"
  When I click element "user_comment_1"
  Then I should be on the profile page for "fbuser"

@javascript
Scenario: a unauthenticated user cannot post a comment
  And I am on the show page for article "1"
  And I click element "submit_comment_form"
  Then I should see "Please sign in." in element "red_flash"

@javascript
Scenario: an authenticated user can post a comment
  Given I am signed in with provider "facebook"
  And I am on the show page for article "1"
  And I click element "submit_comment_form"
  Then I should see "Your comment can't be blank." in element "red_flash"
  And I fill in "comment[body]" with "Some cool comment I want to add"
  And I click element "submit_comment_form"
  Then I should be on the show page for article "1"
  And I should see "Some cool comment I want to add"

@javascript
Scenario: a user can remove comments they suggested
  Given the following comments exist:
    | user_id  | article_id  | body                             |
    | 1        | 1           | Some cool comment I want to add  |
  And I am signed in with provider "facebook"
  And I am on the show page for article "1"
  Then I should see element "comment_1"
  And I click element "close_comment_1"
  Then I should not see element "comment_1"

@javascript
Scenario: a user cannot delete comments suggested by others
  Given the following comments exist:
    | user_id  | article_id  | body                          |
    | 1        | 1        | Some cool comment I want to add  |
  And I am signed in with provider "twitter"
  And I am on the show page for article "1"
  Then I should see element "comment_1"
  Then I should not see element "close_comment_1"