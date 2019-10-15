# frozen_string_literal: true

class AdvertisementsController < ApplicationController
  def index
    @ads = current_establishment.advertisements
  end

  def new; end
end
