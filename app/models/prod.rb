class Prod < ApplicationRecord
  belongs_to :user
  has_many :prices, dependent: :destroy
  accepts_nested_attributes_for :prices


  serialize :meta, Hash

  def after_initialize
    self.meta ||= {} if new_record?
  end
end
