class ChangeDeveloperIdToNullableInBugs < ActiveRecord::Migration[7.1]
  def change
      change_column :bugs, :developer_id, :bigint, null: true

  end
end
