ActiveAdmin.register ParamsRemapping do
  menu priority: 3

  # actions :index, :show, :edit

  form do |f|
    f.inputs "Params remapping" do
      f.input :initial_key
      f.input :remapped_key
      f.input :initial_value
      f.input :remapped_value
    end

    f.actions
  end

  index do
    id_column
    column :route do |remap|
      route = remap.route
      link_to "#{route.service_http_method.upcase} #{route.service_path}", admin_route_path(route)
    end
    column :initial_key
    column :remapped_key
    column :initial_value
    column :remapped_value
    actions
  end
end
