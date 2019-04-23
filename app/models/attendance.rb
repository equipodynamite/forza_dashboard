class Attendance < ApplicationRecord
  belongs_to :user
  attr_accessor :username
end
