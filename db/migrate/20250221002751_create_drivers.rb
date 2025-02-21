class CreateDrivers < ActiveRecord::Migration[7.2]
  def change
    create_table :drivers do |t|
      t.string :name
      t.string :team
      t.string :car_number
      t.integer :point
      t.string :position

      t.timestamps
    end
  end
end
