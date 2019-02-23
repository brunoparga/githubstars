# frozen_string_literal: true

require "rails_helper"

RSpec.describe "repositories/index.html.erb", type: :view do
  let(:repo_list) { [FactoryBot.create(:repository)] }

  context "when assigned a list of starred repos" do
    it "shows the repo information" do
      assign(:repos, repo_list)

      render

      expect(rendered).to have_link(
        "challenge-development", href: "https://github.com/brainn-co/challenge-development")
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
