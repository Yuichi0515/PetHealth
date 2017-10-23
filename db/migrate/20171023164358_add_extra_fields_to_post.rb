class AddExtraFieldsToPost < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :upload_date, :date
  end
end
