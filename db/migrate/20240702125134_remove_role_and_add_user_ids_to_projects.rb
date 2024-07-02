class RemoveRoleAndAddUserIdsToProjects < ActiveRecord::Migration[7.1]
  def change
    # Remove the 'role' column from 'projects' table
    remove_column :projects, :role, :integer

  end
end
