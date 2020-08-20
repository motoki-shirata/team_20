class ParentTask < ApplicationRecord
    has_many :user_missions
    has_many :child_tasks
end
