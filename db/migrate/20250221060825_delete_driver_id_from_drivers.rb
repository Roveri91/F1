class DeleteDriverIdFromDrivers < ActiveRecord::Migration[7.2]
  def change
    remove_column :drivers, :driver_id, :string
  end
end
