class RenameColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :hourly_productions, :date, :datetime
  end
end
