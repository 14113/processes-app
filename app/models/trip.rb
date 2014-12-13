class Trip < ActiveRecord::Base
  has_many :todos, -> { order('position ASC') }
  has_many :iterations

  accepts_nested_attributes_for :todos, :reject_if => lambda { |a| a[:name].blank? }

  validates :name, presence: true

  def current_iteration
    iterations.uncomplete.last || Iteration.new
  end

  def uncomplete_actions
    current_iteration.actions.complete.count if current_iteration.actions
  end
end
