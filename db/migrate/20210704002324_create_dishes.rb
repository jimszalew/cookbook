class CreateDishes < ActiveRecord::Migration[6.1]
  def change
    create_table :dishes do |t|

      t.timestamps
    end
  end
end
