class CreateRockets < ActiveRecord::Migration[6.0]
  def change
    create_table :rockets do |t|
      t.string :name
      t.string :payload
      t.string :price
      t.string :description
      t.string :location
      t.string :rocket_images
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
