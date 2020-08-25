class TaskComment < ApplicationRecord
  validates :parent_comment, presence: true, length: { maximum: 255 }
  validates :child_comment, presence: true, length: { maximum: 255 }

  belongs_to :user, optional: true
  belongs_to :parent_task, optional: true
  belongs_to :child_task, optional: true
  belongs_to :boss, optional: true
end
