class RemoveDataFromDishes < ActiveRecord::Migration[6.1]
  def change
    remove_column :dishes, :data
  end
end
