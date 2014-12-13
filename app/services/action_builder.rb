class ActionBuilder

  def initialize(trip)
    @trip = trip
  end

  def run
    return current_iteration if is_current_iteration?
    build_new_actions
  end

  private

  def current_iteration
    @trip.iterations.uncomplete.last
  end

  def is_current_iteration?
    current_iteration.present?
  end

  def build_new_actions
    iteration = @trip.iterations.new
    @trip.todos.each do |todo|
      iteration.actions.new(todo: todo)
    end
    iteration.save!
    iteration
  end

end
