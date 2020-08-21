class ParentTask < ApplicationRecord
    belongs_to :user
    belongs_to :manager
    has_many :child_tasks
end
