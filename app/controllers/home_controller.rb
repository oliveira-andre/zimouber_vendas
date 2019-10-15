class HomeController < ApplicationController
  skip_before_action :authenticate_establishment!

  def index; end
end