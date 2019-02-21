# frozen_string_literal: true

require "rails_helper"
require_relative "../../lib/github_interactor.rb"

feature "Fetch starred repositories", type: :system do
  scenario "given a Github username" do
    visit "/"
    fill_in "username", with: "brunoparga"
    click_button "get repositories"
    expect(page).to have_content "challenge-development"
  end
end
