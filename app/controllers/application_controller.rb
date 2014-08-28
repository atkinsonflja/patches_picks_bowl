class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  @hostname = request.host || "www.patchespicks.herokuapp.com"

  if @hostname == "www.patchespicks.herokuapp.com"
  	redirect_to "picks.taxslayerbowl.com", status: 301
  end
end
