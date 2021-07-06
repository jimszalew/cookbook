class AddAttributesToDishes < ActiveRecord::Migration[6.1]
  def change
    add_column :dishes, :title, :string
    add_column :dishes, :ingredients, :hstore
    add_column :dishes, :instructions, :hstore
  end
end
