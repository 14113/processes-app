class Action < ActiveRecord::Base
  belongs_to :iteration
  belongs_to :todo

  delegate :name, :description, :position, to: :todo

  default_scope { includes(:todo).order('todos.position ASC') }
  scope :uncomplete, -> { where(done: false )}
  scope :complete, -> { where(done: true )}
end
