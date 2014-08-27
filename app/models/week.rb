class Week < ActiveRecord::Base
  belongs_to :previous_week, :class_name => "Week"
  has_many :games

  def self.current_or_number(week_number)
    if week_number.blank?
      # TODO: A way to select the real current week!
      first
    else
      where(:number => week_number).first
    end
  end
end
