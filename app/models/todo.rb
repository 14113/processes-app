class Todo < ActiveRecord::Base
  has_many :actions
  has_many :iterations, through: :actions
  belongs_to :trip

  acts_as_list scope: :trip

  default_scope { order('id ASC') }
end
