class Team < ApplicationRecord

    has_many :users, dependent: :destroy
    has_many :organizations, dependent: :destroy
    has_many :bosses, through: :organizations, dependent: :destroy
end
