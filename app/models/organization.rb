class Organization < ApplicationRecord
    belongs_to :team
    belongs_to :boss
end
