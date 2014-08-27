class HomeController < ApplicationController

  # GET /
  def index
    @homes = Home.all
  end
end
