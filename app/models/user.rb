# frozen_string_literal: true

class User < ApplicationRecord
  has_many :repository_users, dependent: :destroy
  has_many :repositories, through: :repository_users
  has_many :repository_tags, dependent: :destroy

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.username = auth["info"]["nickname"]
    end
  end
end
