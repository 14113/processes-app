class Iteration < ActiveRecord::Base
  has_many :actions
  has_many :todos, through: :actions
  belongs_to :trip

  accepts_nested_attributes_for :actions

  scope :uncomplete, -> { where(finished_at: nil )}
  scope :complete, -> { where.not(finished_at: nil )}

  delegate :name, to: :trip

  def finish!
    actions.each do |action|
      action.done = true
    end
    self.finished_at = Time.now
    self.save!
  end

end
