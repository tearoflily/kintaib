class User < ApplicationRecord
  has_many :attendances, dependent: :destroy

  validates :email, presence: true
 
  
  has_secure_password
  
  validates :department, length: { in: 2..30 }, allow_blank: true
  
  
  def self.search(search)
    if search
      where(['name LIKE ?', "%#{search}%"])
    else
      all
    end
  end
  
  
end
