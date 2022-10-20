ActiveAdmin.register RequestSetting do
  menu priority: 2

  permit_params :key, :value, :interpolated
end
