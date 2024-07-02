class Project < ApplicationRecord
  # belongs_to :manager, class_name: 'User', foreign_key: 'manager_id'
  # belongs_to :qa, class_name: 'User', optional: true
  # has_many :bugs, dependent: :destroy

  belongs_to :manager, class_name: 'User', foreign_key: 'manager_id'
  has_many :project_assignments
  has_many :user , through: :project_assignments
  has_many :qas, -> { where(project_assignments: { role: 'qa' }) }, through: :project_assignments, source: :user
has_many :bugs
    accepts_nested_attributes_for :project_assignments

validates :title, presence: true
  validates :description, presence: true, length: { minimum: 10 }

	
end
