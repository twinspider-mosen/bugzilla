class Bug < ApplicationRecord

  enum bug_type: {bug: 0, feature: 1}
 enum status: [:new_bug, :started, :completed, ]

  belongs_to :project   # Assuming bugs belong to a project (you may need to adjust this association)

  belongs_to :qa, class_name: 'User', foreign_key: 'qa_id'
  belongs_to :developer, class_name: 'User', foreign_key: 'developer_id' , optional: true
  has_one_attached :image
  validates :title, presence: true, uniqueness: true
  validates :status, presence: true
  validates :bug_type, presence: true


end
