class AddStatusToBugs < ActiveRecord::Migration[7.1]
  def change
    add_column :bugs, :status, :integer, default: 0
  end
end
