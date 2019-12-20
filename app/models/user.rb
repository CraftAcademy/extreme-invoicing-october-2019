class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

  has_many :invoices
  has_one :company
  has_many :customers
  has_many :articles
end
