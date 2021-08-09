class CreateMovies < ActiveRecord::Migration[6.1]

  def change
    ActiveRecord::Schema.define do
      create_table :movies do |t|
        t.string :title, null: false, limit: 50
        t.string :format, limit: 9
        t.integer :length
        t.integer :release_year
        t.integer :rating
        t.string :poster
        t.timestamps
      end
    end
  end
end
