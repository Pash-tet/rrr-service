class Route < ApplicationRecord
  has_many :params_remappings
  accepts_nested_attributes_for :params_remappings

  validates :service_path, :service_http_method, :request_http_method, :remote_method, presence: true
  validates :service_path, uniqueness: {scope: :service_http_method}

  scope :active, -> { where(disabled: false) }
end
