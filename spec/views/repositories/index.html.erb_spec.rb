# frozen_string_literal: true

require "rails_helper"

RSpec.describe "repositories/index.html.erb", type: :view do
  let(:repo) { FactoryBot.create(:repository) }
  let(:user) { FactoryBot.create(:user) }
  let(:repo_list) { [record: repo, recommendation: "recommended"] }

  before do
    FactoryBot.create(:repository_user, repository: repo, user: user)
  end

  context "when assigned a list of starred repos" do
    it "shows the repo information" do
      # TODO: build a list with recommendation
      assign(:repos, repo_list)
      assign(:searched_user, user)

      render

      expect(rendered).to have_link(
        "factory-bot-created", href: "https://github.com/wrong/does-not-exist")
    end
  end

  context "when assigned an empty list of repos" do
    it "shows a warning about the empty list" do
      assign(:repos, [])

      render

      expect(rendered).to have_content("Oops, no starred repositories were found")
    end
  end
end
