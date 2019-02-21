# frozen_string_literal: true

require "rails_helper"

RSpec.describe Tag, type: :model do
  let(:empty_tag) { FactoryBot.create(:tag, name: nil) }

  it "has a name" do
    expect { empty_tag }.to raise_error("Validation failed: Name can't be blank")
  end

  it "name is unique" do
    FactoryBot.create(:tag, name: "rspec")

    expect { FactoryBot.create(:tag) }.to raise_error("Validation failed: Name has already been taken")
  end
end
