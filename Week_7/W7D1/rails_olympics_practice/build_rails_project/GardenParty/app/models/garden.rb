class Garden < ApplicationRecord
    validates :name, :size, presence: true
    validates :name, uniqueness: {scope: :garden_owner_id}

    belongs_to :garden_owner,
        foreign_key: :garden_owner_id,
        class_name: :User

    has_many :flowers,
        foreign_key: :garden_id,
        class_name: :Flower

end
