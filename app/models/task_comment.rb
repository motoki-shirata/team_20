class TaskComment < ApplicationRecord
  belongs_to :user
  belongs_to :parent_task
end
