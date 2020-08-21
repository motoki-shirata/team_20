class Organization < ApplicationRecord
    belongs_to :teams
    belongs_to :bosses
end
