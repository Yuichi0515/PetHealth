class CreateRelationships < ActiveRecord::Migration[5.1]
  def change
    create_table :relationships do |t|
      t.integer :friend
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
