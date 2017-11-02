class AddNameToPetInfos < ActiveRecord::Migration[5.1]
  def change
    add_column :pet_infos, :name, :string
  end
end
