class AddRoastStatusToRoast < ActiveRecord::Migration[8.0]
  def change
    add_column :roasts, :status, :integer, null: false
    add_column :roasts, :status_changed_at, :datetime, null: false
  end
end
