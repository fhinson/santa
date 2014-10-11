class CreateDrivers < ActiveRecord::Migration
  def change
    create_table :drivers do |t|
      t.string :name
      t.string :location
      t.string :phone

      t.timestamps
    end
  end
end
