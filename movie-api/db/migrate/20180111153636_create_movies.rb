class CreateMovies < ActiveRecord::Migration[5.1]
  def change
    create_table :movies do |table|
      table.string :title, null: false, limit: 50
      table.string :format, limit: 9
      table.integer :length
      table.integer :release_year
      table.integer :rating

      table.timestamps
    end
  end
end
