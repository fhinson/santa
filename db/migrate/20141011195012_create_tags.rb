class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string  :name
      t.integer :age
      t.string  :gender
      t.text    :wish
      t.text    :alternate_wish
      t.string  :status
      t.integer :zone
      t.string  :code
    end
  end
end
