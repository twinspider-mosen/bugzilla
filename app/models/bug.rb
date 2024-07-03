class Bug < ApplicationRecord
  belongs_to :project   # Assuming bugs belong to a project (you may need to adjust this association)

  belongs_to :qa, class_name: 'User', foreign_key: 'qa_id'
  belongs_to :developer, class_name: 'User', foreign_key: 'developer_id' , optional: true

  validates :title, presence: true
  # validates :body, presence: true, length: { minimum: 10 }
end
