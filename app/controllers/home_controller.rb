# frozen_string_literal: true

class HomeController < ApplicationController
  skip_before_action :authenticate_establishment!

  def index
    @ads = Advertisement.all
  end
end
