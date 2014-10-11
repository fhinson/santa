class NullFalse < ActiveRecord::Migration
  def change
    change_column :tags, :name, :string, null: false
    change_column :tags, :age, :integer, null: false
    change_column :tags, :status, :string, default: "Unbought"
    add_column    :tags, :special_needs, :text
  end
end
