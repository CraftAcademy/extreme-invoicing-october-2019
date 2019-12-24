class Invoice < ApplicationRecord
  validates_presence_of :invoice_number, :date, :due_date
  
  belongs_to :user
  has_many :invoice_rows
  belongs_to :customer, optional: true

  def total
    total = 0
    invoice_rows.each do |row|
      total += row.article.unit_price * (row&.quantity || 1)
    end unless invoice_rows.empty?
    total
  end
end
