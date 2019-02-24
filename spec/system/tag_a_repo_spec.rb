# frozen_string_literal: true

require "rails_helper"

feature "Add tags to repositories", type: :system, js: true do
  Capybara.match = :first

  scenario "given a list of repositories" do
    visit "/repositories?username=brunoparga"
    fill_in "name", with: "back-end"
    click_button "+"
    # TODO: make this test repository-specific
    expect(page).to have_content("back-end")
  end
end
