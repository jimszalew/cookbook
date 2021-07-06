class ChangeDataTypeToHstore < ActiveRecord::Migration[6.1]
  def up
    enable_extension 'hstore'
    change_column :dishes, :data, 'hstore USING data::hstore'
  end

  def down
    change_column :dishes, :data, :string
  end
end
