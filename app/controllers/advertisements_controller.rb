# frozen_string_literal: true

class AdvertisementsController < ApplicationController
  before_action :load_advertisement, only: %i[edit update show]

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

  def edit
    authorize @ad
  end

  def update
    authorize @ad
    @ad.update!(advertisement_params)
    flash[:success] = t('form.advertisement.update_success')
    redirect_to advertisements_path
  rescue ActiveRecord::RecordInvalid => e
    e.record.errors.full_messages.each { |msg| flash[:error] = msg }
    redirect_to edit_advertisement_path(@ad)
  end

  def show; end

  private

  def advertisement_params
    params.require(:advertisement).permit(
      :image, :heading, :value, :description
    ).merge(establishment: current_establishment)
  end

  def load_advertisement
    @ad = Advertisement.friendly.find(params[:id])
  end
end
