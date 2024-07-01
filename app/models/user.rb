class User < ApplicationRecord
    enum role: { developer: 0, qa: 1, manager: 2 }


  # Devise modules and other configurations...

  validates :role, presence: true  
has_many :projects, foreign_key: :manager_id, dependent: :destroy
  has_many :assigned_projects, class_name: 'Project', foreign_key: :qa_id, dependent: :nullify
  has_many :assigned_bugs, class_name: 'Bug', foreign_key: :qa_id, dependent: :nullify



  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
