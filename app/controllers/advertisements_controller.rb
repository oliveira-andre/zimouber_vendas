# frozen_string_literal: true

class AdvertisementsController < ApplicationController
  def index
    @ads = current_establishment.advertisements
  end

  def new
    @ad = Advertisement.new(establishment: current_establishment)
    authorize @ad
  end

  def create
    @ad = Advertisement.new(advertisement_params)
    authorize @ad
    @ad.save!
    @ad.image.attach(params[:advertisement][:image])
    flash[:success] = t('form.advertisement.create_success')
    redirect_to advertisements_path
  rescue ActiveRecord::RecordInvalid => e
    e.record.errors.full_messages.each { |msg| flash[:error] = msg }
    redirect_to new_advertisement_path
  end

  private

  def advertisement_params
    params.require(:advertisement).permit(:heading, :value, :description)
          .merge(establishment: current_establishment)
  end
end
