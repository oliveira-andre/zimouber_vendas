# frozen_string_literal: true

class AdvertisementsController < ApplicationController
  def index
    @ads = current_establishment.advertisements
  end

  def new
    @ad = Advertisement.new(establishment: current_establishment)
  end
end
