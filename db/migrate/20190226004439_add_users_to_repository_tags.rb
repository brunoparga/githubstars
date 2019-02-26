class AddUsersToRepositoryTags < ActiveRecord::Migration[5.2]
  def change
    add_reference :repository_tags, :user, foreign_key: true
  end
end
