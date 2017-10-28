class CreatePetInfos < ActiveRecord::Migration[5.1]
  def change
    create_table :pet_infos do |t|
      t.string :pet_type
      t.integer :age
      t.string :sex
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
