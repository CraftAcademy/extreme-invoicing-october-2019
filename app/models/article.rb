class Article < ApplicationRecord
  validates_presence_of :name, :unit, :unit_price, :taxrate
  belongs_to :user
end
