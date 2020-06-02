class ChangeColumnsDateOrders < ActiveRecord::Migration[6.0]
  def up
    change_column :orders, :start_date, 'date USING CAST(start_date AS date)'
    change_column :orders, :end_date, 'date USING CAST(end_date AS date)'
  end

  def down
    change_column :orders, :start_date, :string
    change_column :orders, :end_date, :string
  end
end
