class CreateRepositoryUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :repository_users do |t|
      t.references :repository, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
