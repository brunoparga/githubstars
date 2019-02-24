# frozen_string_literal: true

require "rails_helper"

feature "Filter repositories by tag", type: :system, js: true do
  background do
    FactoryBot.create(:repository)
  end

  scenario "only the searched tags appear" do
    visit "/repositories?username=brunoparga"
    forms = page.all("form")
    forms[0].fill_in "name", with: "javascript"
    forms[0].click_button "+"
    forms[1].fill_in "name", with: "documentation"
    forms[1].click_button "+"
    forms[2].fill_in "name", with: "docker"
    forms[2].click_button "+"

    fill_in "search-form", with: "doc"
    click_button "search"

    expect(page).to have_content "documentation"
    expect(page).to have_content "docker"
    expect(page).not_to have_content "javascript"

    # Show no untagged repositories
    expect(page).not_to have_xpath "//td[@class=\"tags\"][not(./div)]"
  end
end
