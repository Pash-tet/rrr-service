class CreateRoutes < ActiveRecord::Migration[7.0]
  def change
    create_table :routes do |t|
      t.string :service_path, null: false
      t.string :service_http_method, null: false
      t.string :remote_method, null: false
      t.string :request_http_method, null: false
      t.boolean :disabled, null: false, default: false
    end

    add_index :routes, %i[service_path service_http_method], unique: true
  end
end
