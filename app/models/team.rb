class Team < ApplicationRecord

    has_many :users
    has_many :organizations
    has_many :bosses, through: :organizations
end
