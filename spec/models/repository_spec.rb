# frozen_string_literal: true

require "rails_helper"

RSpec.describe Repository, type: :model do
  it "correctly sets the language when that is not set on Github" do
    repo = FactoryBot.create(:repository, language: nil)

    expect(repo.language).to eq "undefined"
  end
end
