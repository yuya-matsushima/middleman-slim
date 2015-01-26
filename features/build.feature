Feature: Middleman-Slim Build

  Scenario: Build a new project
    Given I run `middleman init MY_PROJECT --template slim`
    And I cd to "MY_PROJECT"
    When I run `middleman build`
    Then the exit status should be 0
    And the following files should exist:
      | build/index.html                             |
      | build/images/background.png                  |
      | build/images/middleman.png                   |
      | build/javascripts/all.js                     |
      | build/stylesheets/all.css                    |
      | build/stylesheets/normalize.css              |
    And the file "build/stylesheets/all.css" should contain "../images/"

  Scenario: Build a new project with --images-dir option
    Given I run `middleman init MY_PROJECT --template slim --images-dir img`
    And I cd to "MY_PROJECT"
    When I run `middleman build`
    Then the exit status should be 0
    And the following files should exist:
      | build/img/background.png                     |
      | build/img/middleman.png                      |
      | build/stylesheets/all.css                    |
    And the file "build/stylesheets/all.css" should contain "../img/"
    And the file "build/stylesheets/all.css" should not contain "../images/"

