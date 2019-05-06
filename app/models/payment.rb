class Payment < ApplicationRecord
  belongs_to :user
  validates_numericality_of :amount
  attr_accessor :username

  enum status: [ 'on_time', 'late']
end
