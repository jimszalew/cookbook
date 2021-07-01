class CreateSearches < ActiveRecord::Migration[6.1]
  def change
    create_table :searches do |t|
      t.string :criteria
      t.string :url

      t.timestamps
    end
  end
end
