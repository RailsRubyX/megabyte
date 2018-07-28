class Price < ApplicationRecord
  has_many :pricelists, inverse_of: :price, :dependent => :destroy

  accepts_nested_attributes_for :pricelists, reject_if: :all_blank, allow_destroy: true

  validates :title, presence: true
end
