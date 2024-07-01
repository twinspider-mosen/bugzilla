class Project < ApplicationRecord
  belongs_to :manager, class_name: 'User', foreign_key: 'manager_id'
  belongs_to :qa, class_name: 'User', optional: true
  has_many :bugs, dependent: :destroy

  
validates :title, presence: true
  validates :description, presence: true, length: { minimum: 10 }

	
end
