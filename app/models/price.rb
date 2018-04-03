class Price < ApplicationRecord
  belongs_to :prod
  has_one :user, through: :prod
end
