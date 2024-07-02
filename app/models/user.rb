class User < ApplicationRecord
    enum role: { developer: 0, qa: 1, manager: 2 }


  # Devise modules and other configurations...

  validates :role, presence: true  

  has_many :bugs_created, class_name: 'Bug', foreign_key: 'qa_id', dependent: :nullify
  has_many :bugs_assigned, class_name: 'Bug', foreign_key: 'developer_id', dependent: :nullify

     has_many :project_assignments
    has_many :managed_projects , class_name: "Project", foreign_key: 'manager_id'
    has_many :projects, through: :project_assignments

  # has_many :assigned_projects, through: :project_assignments, source: :project
  has_many :assigned_bugs, class_name: 'Bug', foreign_key: 'developer_id'
  scope :qas, -> { where(role: 'qa') }

   def qa?
    role == 'qa'
  end

  def developer?
    role == 'developer'
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
