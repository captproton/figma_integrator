Feature: Managing Static Pages
  As a team member
  I want to create and manage static pages
  So that I can add custom content to my site

  Background:
    Given I am logged in as a team member of "Example Team"
    And I am on the FigmaIntegrator dashboard

  Scenario: Creating a new static page
    When I click "New Static Page"
    And I fill in the following details:
      | Title       | About Us            |
      | Slug        | about-us            |
      | Content     | This is about us... |
    And I click "Create Static Page"
    Then I should see "Static page was successfully created"
    And I should see "About Us" in the list of static pages

  Scenario: Editing an existing static page
    Given there is a static page titled "Contact Us"
    When I click "Edit" for the "Contact Us" page
    And I change the "Content" to "Our new contact information..."
    And I click "Update Static Page"
    Then I should see "Static page was successfully updated"
    And the "Contact Us" page should contain "Our new contact information..."

  @javascript
  Scenario: Deleting a static page
    Given there is a static page titled "Outdated Info"
    When I click "Delete" for the "Outdated Info" page
    And I confirm the deletion
    Then I should see "Static page was successfully deleted"
    And I should not see "Outdated Info" in the list of static pages

  Scenario Outline: Viewing static pages in different site modes
    Given there is a static page titled "Terms of Service"
    And the site mode is set to <mode>
    When I visit the "Terms of Service" page
    Then I should see the page content in <mode> mode

    Examples:
      | mode  |
      | light |
      | dark  |