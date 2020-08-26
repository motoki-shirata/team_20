class ChildTask < ApplicationRecord
  belongs_to :parent_task
  has_many :task_comments, dependent: :destroy
end
