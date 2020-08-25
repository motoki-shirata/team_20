class TaskComment < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :parent_task, optional: true
  belongs_to :child_task, optional: true
  belongs_to :boss, optional: true
end
