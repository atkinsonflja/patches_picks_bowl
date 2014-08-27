class Week < ActiveRecord::Base
  belongs_to :previous_week, :class_name => "Week"
end
