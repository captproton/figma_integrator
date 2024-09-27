# features/step_definitions/static_pages_steps.rb

# Authentication steps
Given("I am logged in as a team member") do
  # Implement authentication logic
  # This will likely involve creating a user, associating them with an account,
  # and setting up the session
end

# Navigation steps
When("I navigate to the static pages section") do
  visit figma_integrator.static_pages_path
end

When("I click {string}") do |link_text|
  click_link_or_button(link_text)
end

# Form interaction steps
When("I fill in the page details") do
  fill_in "Title", with: "New Static Page"
  fill_in "Slug", with: "new-static-page"
  fill_in "Content", with: "This is a new static page."
end

# Assertion steps
Then("I should see the new static page in the list") do
  expect(page).to have_content("New Static Page")
end

# More specific steps can be added as needed
