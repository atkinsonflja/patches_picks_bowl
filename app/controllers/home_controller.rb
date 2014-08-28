class HomeController < ApplicationController

  # GET /
  def index
  	match "patchespicks.herokuapp.com", :to => redirect("picks.taxslayerbowl.com")
  end

  # GET /rules
  def rules
  end
end
