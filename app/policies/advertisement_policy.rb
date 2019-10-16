# frozen_string_literal: true

class AdvertisementPolicy < ApplicationPolicy
  def new?
    @record.establishment == @establishment
  end

  def create?
    @record.establishment == @establishment
  end

  def edit?
    @record.establishment == @establishment
  end

  def update?
    @record.establishment == @establishment
  end
end
