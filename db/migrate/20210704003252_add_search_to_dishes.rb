class AddSearchToDishes < ActiveRecord::Migration[6.1]
  def change
    add_reference :dishes, :search, null: false, foreign_key: true
  end
end
