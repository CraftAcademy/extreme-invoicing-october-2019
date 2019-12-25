class ChangePayedForColumn < ActiveRecord::Migration[6.0]
  def change
    change_column_default :invoices, :paid_for, from: nil, to: false
  end
end
