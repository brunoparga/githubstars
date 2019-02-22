# frozen_string_literal: true

require "rails_helper"

feature "Add tags to repositories", type: :system do
  background do
    visit "/"
    fill_in "username", with: "brunoparga"
    click_button "get repositories"
  end

  scenario "given a list of repositories" do
    fill_in "name", match: :first, with: "back-end"
    click_button "+", match: :first
    # TODO: make this test repository-specific
    expect(page).to have_content("back-end")
  end
end
