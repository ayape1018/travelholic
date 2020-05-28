class Country < ApplicationRecord
  has_many :places
  belongs_to :area
end
