class AddIndexToTagsByCode < ActiveRecord::Migration
  def change
    add_index :tags, :code
  end
end
