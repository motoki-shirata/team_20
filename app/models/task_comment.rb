class TaskComment < ApplicationRecord
  belongs_to :user
  belongs_to :parent_task
  belongs_to :child_task
end
