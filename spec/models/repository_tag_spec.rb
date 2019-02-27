# frozen_string_literal: true

require "rails_helper"

RSpec.describe RepositoryTag, type: :model do
  # This test doesn't work because of a known issue with shoulda_matchers.
  # For more details, please see the Known Issues section of README.md.

  # before do
  #   ruby_tag = FactoryBot.create(:tag, name: "ruby")
  #   rails = FactoryBot.create(:repository, name: "rails")
  #   described_class.create(repository: rails, tag: ruby_tag)
  # end

  # it { should validate_uniqueness_of(:tag).scoped_to(:repository) }

  let(:ruby_tag) { FactoryBot.create(:tag, name: "ruby") }
  let(:user) { FactoryBot.create(:user) }
  let(:rails) do
    repo = FactoryBot.create(:repository, name: "rails")
    FactoryBot.create(:repository_user, repository: repo, user: user)
    repo
  end
  let(:repo_tag_data) { { repository: rails, tag: ruby_tag, user: user } }

  it "user cannot create more than one tag for a repo" do
    FactoryBot.create(:repository_tag, repo_tag_data)
    second_tag = FactoryBot.build(:repository_tag, repo_tag_data)
    expect(second_tag).not_to be_valid
  end
end
