class AddIndexToBugsTitle < ActiveRecord::Migration[7.1]
  def change
        add_index :bugs, :title, unique: true
  end
end
