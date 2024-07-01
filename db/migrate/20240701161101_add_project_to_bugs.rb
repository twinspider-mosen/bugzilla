class AddProjectToBugs < ActiveRecord::Migration[7.1]
  def change
    add_reference :bugs, :project, null: false, foreign_key: true
  end
end
