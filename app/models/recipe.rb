class Recipe < ApplicationRecord
    validates :name, presence: true, length: { minimum: 3, maximum: 100 }
    validates :description, presence: true, length: { minimum: 5, maximum: 500 }
    belongs_to :chef
    validates :chef_id, presence: true
    # has_many :ingredients
    # has_many :directions
    # has_many :comments
    # has_many :favorites
    
    # validates :name, presence: true, length: { minimum: 3, maximum: 100 }
    # validates :description, presence: true, length: { minimum: 5, maximum: 500 }
    # validates :user_id, presence: true
end