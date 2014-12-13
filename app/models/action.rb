class Action < ActiveRecord::Base
  belongs_to :iteration
  belongs_to :todo

  delegate :name, :description, to: :todo

  scope :uncomplete, -> { where(done: false )}
  scope :complete, -> { where(done: true )}
end
