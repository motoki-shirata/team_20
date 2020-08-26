class ParentTask < ApplicationRecord
    belongs_to :user
    has_many :child_tasks, dependent: :destroy
    has_many :task_comments, dependent: :destroy
end
