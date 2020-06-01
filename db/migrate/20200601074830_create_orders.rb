class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :rocket, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :start_date
      t.string :end_date
      t.string :status
      t.string :total_price

      t.timestamps
    end
  end
end
