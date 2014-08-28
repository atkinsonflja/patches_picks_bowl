class HomeController < ApplicationController

  # GET /
  def index
  	redirect_to 'picks.taxslayerbowl.com', :status => :moved_permanently
  end

  # GET /rules
  def rules
  end
end
