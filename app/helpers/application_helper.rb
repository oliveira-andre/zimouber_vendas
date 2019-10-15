module ApplicationHelper
  def mask_money(value)
    integer = value.to_s.split('.').first
    decimal = value.to_s.split('.').last
    decimal = "#{decimal}0" if decimal.length == 1
    "R$ #{integer},#{decimal}"
  end
end
