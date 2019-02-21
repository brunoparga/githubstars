class CreateRepositoryTags < ActiveRecord::Migration[5.2]
  def change
    create_table :repository_tags do |t|
      t.references :repository, foreign_key: true
      t.references :tag, foreign_key: true

      t.timestamps
    end
  end
end
