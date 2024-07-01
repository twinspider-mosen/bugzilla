class Bug < ApplicationRecord
belongs_to :project
  belongs_to :qa, class_name: 'User'
  belongs_to :developer, class_name: 'User', optional: true
	validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }
end
