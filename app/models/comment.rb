class Comment < ApplicationRecord
    belongs_to :recipe
    belongs_to :chef
    validates :description, presence: true, length: { minimum: 5, maximum: 500 }
    validates :recipe_id, presence: true
    validates :chef_id, presence: true
    default_scope -> { order(updated_at: :desc) }
end
