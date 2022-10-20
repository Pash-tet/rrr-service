class RequestSetting < ApplicationRecord
  VAR_PATTERN = /{(.*?)}/

  validates :key, :value, presence: true
  validate :check_interpolating_value, if: -> { interpolated? }

  private

  def check_interpolating_value
    keys = value.scan(VAR_PATTERN).flatten
    keys.delete("method") # Отдельная переменная

    settings = self.class.where(key: keys).pluck(:key)

    if keys.count != settings.count
      errors.add(:value, "settings with keys #{(keys - settings).join(", ")} not found")
    end
  end
end
