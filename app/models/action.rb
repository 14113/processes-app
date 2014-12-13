class Action < ActiveRecord::Base
  belongs_to :iteration
  belongs_to :todo

  delegate :name, :description, to: :todo

  default_scope { order('id ASC') }
  scope :uncomplete, -> { where(done: false )}
  scope :complete, -> { where(done: true )}
end
