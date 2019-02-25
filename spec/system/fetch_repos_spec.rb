# frozen_string_literal: true

require "rails_helper"
require_relative "../../lib/repos_fetcher.rb"

feature "Fetch starred repositories", type: :system do
  background "enter a Github username" do
    visit "/"
    fill_in "username", with: "brunoparga"
    click_button "get repositories"
  end

  scenario "has the correct repositories" do
    expect(page).to have_content "challenge-development"
  end

  scenario "has a recommendation for each repository" do
    forms = page.find_all(id: "name")
    expect(forms[0].value).to eq "shell"
    expect(forms[1].value).to eq "ruby"
    expect(forms[2].value).to eq "undefined"
  end
end
