# frozen_string_literal: true

require "rails_helper"

RSpec.describe RepositoryTag, type: :model do
  # This test should work, but doesn't because of a known issue with
  # shoulda_matchers: https://github.com/thoughtbot/shoulda-matchers/issues/814

  # before do
  #   ruby_tag = FactoryBot.create(:tag, name: "ruby")
  #   rails = FactoryBot.create(:repository, name: "rails")
  #   described_class.create(repository: rails, tag: ruby_tag)
  # end

  # it { should validate_uniqueness_of(:tag).scoped_to(:repository) }

  let(:ruby_tag) { FactoryBot.create(:tag, name: "ruby") }
  let(:rails) { FactoryBot.create(:repository, name: "rails") }

  it "reject more than one of the same tag for a repo" do
    described_class.create(repository: rails, tag: ruby_tag)
    second_tag = described_class.new(repository: rails, tag: ruby_tag)
    expect(second_tag).not_to be_valid
  end
end
