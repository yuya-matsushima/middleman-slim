Feature: Middleman init

  Scenario: Create a new project
    When I run `middleman init MY_PROJECT -T yterajima/middleman-slim#v4` interactively
    And I type "y"
    And I type "y"
    And I type "y"
    And I type "y"
    Then the exit status should be 0
    When I cd to "MY_PROJECT"
    Then the following files should exist:
      | Gemfile                                       |
      | .gitignore                                    |
      | config.ru                                     |
      | config.rb                                     |
      | source/index.html.slim                        |
      | source/layouts/layout.slim                    |
      | source/javascripts/all.js                     |
      | source/stylesheets/site.css.scss              |

  Scenario: Create a new project in the current directory
    Given a directory named "MY_PROJECT"
    When I cd to "MY_PROJECT"
    And I run `middleman init -T yterajima/middleman-slim#v4` interactively
    And I type "y"
    And I type "y"
    And I type "y"
    And I type "y"
    Then the exit status should be 0
    And the following files should exist:
      | Gemfile                                       |
      | config.rb                                     |
      | source/index.html.slim                        |

  Scenario: Create a new project with middleman-sprockets
    When I run `middleman init MY_PROJECT -T yterajima/middleman-slim#v4` interactively
    And I type "y"
    And I type "n"
    And I type "n"
    And I type "n"
    Then the exit status should be 0
    When I cd to "MY_PROJECT"
    Then the file "Gemfile" should contain "middleman-sprockets"
    And the file "Gemfile" should not contain "middleman-compass"
    And the file "Gemfile" should not contain "middleman-livereload"

  Scenario: Create a new project with middleman-compass
    When I run `middleman init MY_PROJECT -T yterajima/middleman-slim#v4` interactively
    And I type "n"
    And I type "y"
    And I type "n"
    And I type "n"
    Then the exit status should be 0
    When I cd to "MY_PROJECT"
    Then the file "Gemfile" should not contain "middleman-sprockets"
    And the file "Gemfile" should contain "middleman-compass"
    And the file "Gemfile" should not contain "middleman-livereload"

  Scenario: Create a new project with middleman-livereload
    When I run `middleman init MY_PROJECT -T yterajima/middleman-slim#v4` interactively
    And I type "n"
    And I type "n"
    And I type "y"
    And I type "n"
    Then the exit status should be 0
    When I cd to "MY_PROJECT"
    Then the file "Gemfile" should not contain "middleman-sprockets"
    And the file "Gemfile" should not contain "middleman-compass"
    And the file "Gemfile" should contain "middleman-livereload"

  Scenario: Create a new project without cunfig.ru
    When I run `middleman init MY_PROJECT -T yterajima/middleman-slim#v4` interactively
    And I type "n"
    And I type "n"
    And I type "n"
    And I type "n"
    Then the exit status should be 0
    When I cd to "MY_PROJECT"
    Then the file "config.ru" should not exist
