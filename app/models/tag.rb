class Tag < ActiveRecord::Base
  validates_presence_of :name, :age

  belongs_to :driver
end