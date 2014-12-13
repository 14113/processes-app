class Todo < ActiveRecord::Base
  has_many :actions, -> { order('id ASC') }
  has_many :iterations, through: :actions
  belongs_to :trip

  default_scope { order('id ASC') }
end
