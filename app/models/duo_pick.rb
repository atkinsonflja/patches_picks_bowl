class DuoPick < ActiveRecord::Base
  belongs_to :week
  serialize :picks, Hash

  validates :week_id, :presence => true
end
