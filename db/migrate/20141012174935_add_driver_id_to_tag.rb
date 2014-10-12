class AddDriverIdToTag < ActiveRecord::Migration
  def change
    add_column :tags, :driver_id, :integer
  end
end
