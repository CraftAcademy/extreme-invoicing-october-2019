class InvoiceRow < ApplicationRecord
  validates_presence_of :quantity
  
  belongs_to :invoice
  belongs_to :article
end
