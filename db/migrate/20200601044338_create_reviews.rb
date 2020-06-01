class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.references :order, null: false, foreign_key: true
      t.string :content
      t.string :rating

      t.timestamps
    end
  end
end
