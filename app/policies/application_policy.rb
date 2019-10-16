# frozen_string_literal: true

class ApplicationPolicy
  attr_reader :establishment, :record

  def initialize(establishment, record)
    @establishment = establishment
    @record = record
  end
end
