class AddDonorFieldsToTag < ActiveRecord::Migration
  def change
    add_column :tags, :phone, :string
    add_column :tags, :location, :string
  end
end
