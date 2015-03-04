@omniauth
Feature: Features
 
  As a user
  So that I can help distinguish good articles
  I want to be able to like articles

  Background:
    Given I am signed in with provider "facebook"
    And the following articles exist:
      | user_id  | url      | title       | content      | initial_comment       |
      | 1        | fake_url | Fake Title  | Fake content | Fake initial comment. |
    And I am on the homepage

@javascript
Scenario: a unauthenticated user cannot like an article
  And I am on the show page for article "1"
  And I click element "like_button"
  And I should see "Please sign in." in element "red_flash"

@javascript
Scenario: an authenticated user can like an article
  Given I am signed in with provider "facebook"
  And I am on the show page for article "1"
  And I click element "like_button"
  Then I should be on the show page for article "1"
  And I should see "1" in element "like_count"
  And I should see element "dislike_button"
  But I should not see element "like_button"

@javascript
Scenario: a user cannot unlike articles they did not like
  Given the following likes exist:
    | user_id  | article_id  |
    | 1        | 1        |
  And I am signed in with provider "twitter"
  And I am on the show page for article "1"
  Then I should see "1" in element "like_count"
  And I should see element "like_button"
  But I should not see element "dislike_button"

@javascript
Scenario: a user can unlike articles they liked
  Given the following likes exist:
    | user_id  | article_id  |
    | 1        | 1        |
  And I am signed in with provider "facebook"
  And I am on the show page for article "1"
  Then I should see "1" in element "like_count"
  When I click element "dislike_button"
  Then I should be on the show page for article "1"
  And I should see "0" in element "like_count"
  And I should see element "like_button"
  But I should not see element "dislike_button"