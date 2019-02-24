# frozen_string_literal: true

require "rails_helper"

feature "Filter repositories by tag", type: :system, js: true do
  scenario "" do
    visit "/repositories?username=brunoparga"
    # How do I properly test this? There needs to be a repo whose only tag is
    # docker, another whose only tag is documentation, and a third with only
    # javascript; when searching for doc only the first two must appear. I'll
    # need to read up on Capybara finding to do this.
  end
end
