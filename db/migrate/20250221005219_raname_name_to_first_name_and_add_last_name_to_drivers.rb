class RanameNameToFirstNameAndAddLastNameToDrivers < ActiveRecord::Migration[7.2]
  def change
    rename_column :drivers, :name, :first_name
    add_column :drivers, :last_name, :string
  end
end
