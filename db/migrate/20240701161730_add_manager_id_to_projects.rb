class AddManagerIdToProjects < ActiveRecord::Migration[7.1]
  def change
    add_reference :projects, :manager, foreign_key: { to_table: :users }
  end
end
