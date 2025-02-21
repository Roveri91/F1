class AddDriverIdToDrivers < ActiveRecord::Migration[7.2]
  def change
    add_column :drivers, :driver_id, :string
  end
end
