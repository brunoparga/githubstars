# frozen_string_literal: true

require "rails_helper"

feature "Remove tags from repositories", type: :system, js: true do
  Capybara.match = :first

  background do
    visit "/repositories?username=brunoparga"
    fill_in "name", with: "impossibly_long_tag_name"
    click_button "+"
  end

  scenario "given a tagged list of repositories" do
    click_link "x"
    # TODO: make this test repository-specific
    expect(page).not_to have_content("impossibly_long_tag_name")
  end
end
