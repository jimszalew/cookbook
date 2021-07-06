class AddDataToDishes < ActiveRecord::Migration[6.1]
  def change
    add_column :dishes, :data, :string
  end
end
