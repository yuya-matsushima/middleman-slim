Feature: Middleman-Slim CLI

  Scenario: Create a new project
    Given I run `middleman init MY_PROJECT --template slim`
    Then the exit status should be 0
    When I cd to "MY_PROJECT"
    Then the following files should exist:
      | Gemfile                                       |
      | .gitignore                                    |
      | config.rb                                     |
      | source/index.html.slim                        |
      | source/images/background.png                  |
      | source/images/middleman.png                   |
      | source/layouts/layout.slim                    |
      | source/javascripts/all.js                     |
      | source/stylesheets/all.css                    |
      | source/stylesheets/normalize.css              |
