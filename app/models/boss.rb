class Boss < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :organizations
  has_many :teams, through: :organizations
  # boss.supervise_teamsでチーム引っ張れる
end
