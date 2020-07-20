class Toy < ApplicationRecord
    
    validates :name, :toyable_type, :toyable_id, uniqueness: true

    belongs_to :toyable, :polymorphic => true
end
