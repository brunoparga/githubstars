# frozen_string_literal: true

require "rails_helper"

RSpec.describe "repositories/index.html.erb", type: :view do
  let(:repos) do
    Array.new(5).map do
      {
        id: 6,
        name: "bananas",
        description: "fruity JavaScript framework",
        html_url: "https://github.com/bananas/bananas",
        language: "javascript"
      }
    end
  end

  context "when assigned a list of starred repos" do
    it "shows the repo information" do
      assign(:repos, repos)

      render

      expect(rendered).to have_link("bananas", href: "https://github.com/bananas/bananas")
    end
  end

  context "when assigned an empty list of repos" do
    it "shows a warning about the empty list" do
      assign(:repos, [])

      render

      expect(rendered).to have_content("Oops, no starred repositories were found.")
    end
  end
end
