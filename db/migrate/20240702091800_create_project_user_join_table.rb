class CreateProjectUserJoinTable < ActiveRecord::Migration[7.1]
 def change
    create_table :project_assignments do |t|
      t.references :project, foreign_key: true
      t.references :user, foreign_key: true
      t.string :role  # If you want to store role specific to the project (e.g., 'QA', 'Developer')

      t.timestamps
    end

    add_index :project_assignments, [:project_id, :user_id], unique: true
  end
end
