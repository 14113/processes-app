class Todo < ActiveRecord::Base
  has_many :actions
  has_many :iterations, through: :actions
  belongs_to :trip
end
