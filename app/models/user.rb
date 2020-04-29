class User < ApplicationRecord
  has_many :attendances, dependent: :destroy
 
  
  has_secure_password
  
  validates :department, length: { in: 2..30 }, allow_blank: true
  
end
