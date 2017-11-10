class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.string :message
      t.integer :post_to_id
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
