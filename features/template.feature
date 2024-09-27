# File: features/template.feature

Feature: [Feature Name]
  As a [role]
  I want to [desired action]
  So that [benefit]

  Background:
    Given I am logged in as a team member of "Example Team"
    And I am on the FigmaIntegrator dashboard

  Scenario: [Scenario Name]
    When I [action]
    Then I should see [result]

  Scenario: [Another Scenario Name]
    Given [precondition]
    When I [action]
    Then I should see [result]

  @javascript
  Scenario: [Scenario Requiring JavaScript]
    When I [action that requires JavaScript]
    Then I should see [result]

  Scenario Outline: [Scenario Outline Name]
    Given I have a <page_type> page
    When I [action]
    Then I should see [result]

    Examples:
      | page_type |
      | static    |
      | dynamic   |