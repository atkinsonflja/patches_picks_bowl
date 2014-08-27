class AddNextWeekToWeeks < ActiveRecord::Migration
  def change
    add_reference :weeks, :next_week, index: true
  end
end
