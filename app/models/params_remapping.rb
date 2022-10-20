class ParamsRemapping < ApplicationRecord
  belongs_to :route

  def keys_present?
    initial_key.present? && remapped_key.present?
  end

  def values_present?
    initial_value.present? && remapped_value.present?
  end
end
