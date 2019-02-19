class User < ApplicationRecord
  has_many: attendances, objectives, payments, physical_tests
  belongs_to: membership

  enum program: {
      UBP: 1,
      MU: 2,
      INT: 3,
      AVZ: 4,
      PRS: 5
  }   
end
