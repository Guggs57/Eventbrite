class CreateEvents < ActiveRecord::Migration[8.0]
  def change
    create_table :events do |t|
      t.datetime :start_date
      t.integer :duration
      t.string :title
      t.text :description
      t.integer :price
      t.string :location
      t.references :creator, foreign_key: { to_table: :users}

      t.timestamps
    end
  end
end
