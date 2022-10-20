ActiveAdmin.register Route do
  menu priority: 1

  permit_params :service_http_method, :service_path, :request_http_method, :method, :disabled,
    params_remappings_attributes: %i[initial_key initial_value remapped_key remapped_value]

  form partial: "form"

  index do
    id_column
    column :service_path
    column :service_http_method
    column :remote_method
    column :request_http_method
    column :disabled
    actions
  end

  show do
    attributes_table do
      row :service_path
      row :service_http_method
      row :remote_method
      row :request_http_method
      row :disabled
    end

    panel "Remapped params" do
      table_for route.params_remappings do
        column :initial_key
        column :remapped_key
        column :initial_value
        column :remapped_value
        column do |params_remapping|
          link_to "Edit", edit_admin_params_remapping_path(params_remapping)
          link_to "Delete", admin_params_remapping_path(params_remapping), method: :delete
        end
      end
    end
    active_admin_comments
  end
end
