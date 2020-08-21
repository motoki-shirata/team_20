class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { maximum: 50 }

  belongs_to :team, optional: true
<<<<<<< HEAD
  has_many :user_missions
  has_many :parent, through: :user_missions, source: :parent_task
=======
>>>>>>> develop
  has_many :parent_tasks
end
