# frozen_string_literal: true

require "rails_helper"

RSpec.describe RepositoryUser, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:repo) { FactoryBot.create(:repository, name: "rails") }

  it "is unique for a user and repo" do
    FactoryBot.create(:repository_user, repository: repo, user: user)
    again = FactoryBot.build(:repository_user, repository: repo, user: user)
    expect(again).not_to be_valid
  end
end
