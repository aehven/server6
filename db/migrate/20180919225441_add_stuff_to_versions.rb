class AddStuffToVersions < ActiveRecord::Migration[5.2]
  TEXT_BYTES = 1_073_741_823

  def change
    add_column :versions, :object_changes, :text, limit: TEXT_BYTES
    add_column :versions, :comment, :text
  end
end
