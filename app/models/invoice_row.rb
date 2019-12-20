class InvoiceRow < ApplicationRecord
  belongs_to :invoice
  belongs_to :article
end
