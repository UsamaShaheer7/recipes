class Chef < ActiveRecord::Base
    before_save { self.email = email.downcase }
    validates :chefname, presence: true, length: { minimum: 3, maximum: 40 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i   
    validates :email, presence: true, length: { maximum: 100 }, 
                      format: { with: VALID_EMAIL_REGEX }, 
                      uniqueness: { case_sensitive: false }
    has_many :recipes , dependent: :destroy
    has_secure_password
    validates :password, presence: true, length: { minimum: 5 }, allow_nil: true
    has_many :comments, dependent: :destroy
#   has_many :recipes, dependent: :destroy
#   has_many :likes
#   before_save { self.email = email.downcase }
#   validates :chefname, presence: true, length: { minimum: 3, maximum: 40 }
#   VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
#   validates :email, presence: true, length: { maximum: 100 },
#                     uniqueness: { case_sensitive: false }, 
#                     format: { with: VALID_EMAIL_REGEX }
#   has_secure_password
end
