class Invoice < ApplicationRecord
  validates_presence_of :invoice_number, :date, :due_date
  
  belongs_to :user
end
