class RemapParams
  attr_reader :route, :inbound_params

  def initialize(route:, inbound_params:)
    @route = route
    @inbound_params = inbound_params
  end

  def call
    route.params_remappings.find_each do |params_remap|
      initial_key = params_remap.initial_key
      remapped_key = params_remap.remapped_key
      initial_value = params_remap.initial_value
      remapped_value = params_remap.remapped_value

      if params_remap.values_present?
        if initial_key.present? && inbound_params[initial_key].present?
          try_to_remap_values(initial_key, initial_value, remapped_value)
        else
          inbound_params.keys.each { |key| try_to_remap_values(key, initial_value, remapped_value) }
        end
      end

      if params_remap.keys_present? && inbound_params[initial_key].present?
        inbound_params[remapped_key] = inbound_params.delete(initial_key)
      end
    end

    inbound_params
  end

  private

  def try_to_remap_values(key, initial_value, new_value)
    old_value = inbound_params[key].to_json

    inbound_params[key] = JSON.parse(old_value.gsub(initial_value, new_value)) if old_value.include?(initial_value)
  end
end
