class ParentTask < ApplicationRecord
    belongs_to :user
    
    has_many :child_tasks
end
