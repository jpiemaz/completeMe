class Task < ActiveRecord::Base
  time_for_a_boolean(:completed)

  belongs_to :user

  def self.distinct_due_dates
    where('completed_at IS null').order(due_date: :asc).pluck(:due_date).uniq
  end

  def uncompleted?
    !completed
  end
end
